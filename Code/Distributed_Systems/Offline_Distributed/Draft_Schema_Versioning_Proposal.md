# Introducing Schema Versions for Record Types

## **Purpose**

As we add new features to OurExampleApp, we are frequently changing the schema of various record types. Currently these schemas are not versioned (and also not well documented).

We have documentation for schema changes that break backwards compatibility, in the form of new versions of our endpoints. However, we have no visibility into backwards compatible changes.

This introduces issues for mobile clients, that try to keep records in sync with the server. 

Users with old client versions, that do not understand new fields, will still sync these fields but ignore them. As users upgrade to client versions that *do* understand these new fields, they need to re-sync all of the records they have synced previously in order to ensure that they also synced all new fields.

- User A uses OurExampleApp 3.9.0 on iOS
- OurExampleApp ships version 4.0.0 that supports a cost impact field on issues
- User A continues to use OurExampleApp 3.9.0
- User A syncs issues that contain the cost impact field, but does not parse/persist that field since the client does not understand it.
- User A upgrades to OurExampleApp 4.0.0 on iOS
- User A now has issues that are missing the cost impact field
- User A needs to re-sync all issues to ensure that all new fields are synced correctly

By introducing a schema version for all record types we could streamline this process on mobile clients. The schema version of a record should be updated on the server, whenever the record is updated/saved after the new schema version has been shipped.

This way mobile clients could detect which records have a higher schema version than the client previously understood. The mobile clients could use that information to only update these records. Clients could avoid re-syncing by persisting the raw JSON values they get from the server  and the schema version of the record alongside the structured data.

## **Implementation / Example**

Let's assume two schema version:

Issue, Schema 5:

- UID
- Assigned To 
- Due Date

Issue, Schema 6:

- UID
- Assigned To
- Due Date
- Cost Impact

When the client syncs issues, it retrieves the *effective schema version* for each record. The effective schema version only gets updated when the issue has been saved after the schema version went into effect.



A server response might look like this:

```
[
    // An issue that has not been updated after addition of the
    // cost impact field
    {
         "uid": "...",
         "assigned_to:": "...",
         "due_date": "",
         "effective_schema": 5
    },
    // An issue that was updated after the addition of the cost impact field
    // and that has a cost impact value
    {
         "uid": "...",
         "assigned_to:": "...",
         "due_date": "",
         "cost_impact:": 20,
         "effective_schema": 6
    },
    // An issue that was updated after the addition of the cost impact field
    // but doesn't have a cost impact value
    {
         "uid": "...",
         "assigned_to:": "...",
         "due_date": "",
         "effective_schema": 6
    },   
]
```

The implementation on the backend should keep track of the latest schema version of each record type and bump the effective schema version to that value whenever a new record is created or an existing record is updated.