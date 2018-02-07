# General rollout process for breaking data model changes

The goal of this document is to outline a general process for releasing breaking data model changes, that require mobile clients to update and work with a new API interface.

Since a lot of features will not be adopted immediately after release and will not be adopted by all customers, we want to avoid forcing all of our customers to update their mobile client versions immediately. Therefore we aim to work with project-specific feature flags and to maintain basic backwards compatibility on existing API endpoints.

## Rollout steps

1. **[DB/API] **Migrate the underlying database tables to the new schema

2. 1. **[API] **Update existing endpoints to retain their behavior while using the new schema
   2. **[API] **Start writing all changes to both new and old schema, then migrate old records

3. **[API] **Create an endpoint with a new version that accepts and returns the relevant data in its new format

4. Define a **project-specific** feature flag, that can be used on backend and frontend

5. 1. When the feature flag is turned off:

   2. 1. **[API]** Existing endpoints retain their behavior for reads and writes

   3. When the feature flag is turned on:

   4. 1. **[API]** We retain some form of backwards compatibility for read endpoints. Despite not showing the data from the data model change correctly, old clients continue to work as expected. (*Note: this is only necessary until we deprecate all clients released prior to mid-August 2017)*

      2. **[API]** We block old clients from writing, by causing a sync error, in cases where they would override data in form of the new data model, with data in form of the old data model (*Example: we migrate to multiple assignees for issues; old clients would be blocked from updating issues that have multiple assignees; as they would override them with a single assignee*).

      3. **[Mobile]** When mobile clients encounter the feature flag

      4. 1. They migrate their local database to support the new data model change. This migration can happen eagerly, but new schema will only be used when feature flag is on
         2. They start using the new API endpoint 
         3. They re-sync all records that have been affected by the data model change (*Example: if issues now support multiple assignees, all issues will be re-synced.*) For detail, see *Updating cached data on clients after rollout* later in this document.

      5. **[Web] **Pick API endpoint based on feature flag

6. When the **feature is in use **on a project (*see “Toggle by feature use”*):

7. 1. **[API]** Set a new `min_required_features` entry to block older mobile app versions from entering this project (*Note: this only supported by mobile app versions released mid-August 2017 and onwards)*

## Toggling the project specific feature/in-use flag

For a beta-testing period we will enable the feature flag for individual projects that are participating. 

### Toggle by feature use

At general release we'll enable the feature for all projects. However, the lockout of old clients only takes effect when the feature is actually used on a project. This model postpones the requirement to update app versions on a project, until the feature is actually in use.

*Note: depending on your project, you might want to only allow administrators to enable features, instead of using the “toggle by use model”. This avoids situations in which an individual user starts using a feature and thus forces all other project members to update their app version.*

## Rolling back changes released with this process

When following the playbook above, **changes that have been rolled out, cannot be rolled back easily. **Records that have been created/updated through the new endpoints, have only updated the new data model. Turning off a feature flag, and switching back to the old data model would mean that these changes are lost.  

If an easy rollback is a requirement, this can be accomplished by having the new endpoints continue to update the old data models (in whatever backwards compatible way possible).

## Updating cached data on clients after rollout

For most breaking API changes, clients will need to re-sync data in oder to correctly capture all fields that were added. This is required because we might have downloaded records with an old version of the app,  which ignored added fields (issue discussed here: **Introducing Schema Versions for Record Types**)

- The re-sync needs to be triggered by the app when the app is syncing an existing project for the first time after seeing the activated feature flag (on an app version that supports the feature in question). This requires persisting a feature specific migration flag per project.
  - We will use the `min_features` identifier to identify the “data version” of a project
  - Whenever we sync a project successfully we store the current `min_features` for that project as the current “data version”
  - Prior to sync, if the current set of `min_features` (obtained via the project list) contains identifiers not persisted in the DB, we know that a migration is necessary. For most features this means resetting the client side sync tokens and re-fetching the entire digest for the feature in question.

