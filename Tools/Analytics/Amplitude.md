**SQL Query for events and top level event properties:**

```sql
SELECT user_id, e_option, e_selected FROM app244.sheet_view_options_select
WHERE e_option = 'loupe' ORDER BY event_time ASC;
```

First 50 event properties are stored as columns on the individual tables of the event. For further columns, `json_extract_path_text` needs to be used (see: [Amplitude Event Properties](https://amplitude.zendesk.com/hc/en-us/articles/207150947-Redshift-Event-Properties]))

**SQL Query for properties stored in JSON blobs:**

```sql
SELECT
JSON_EXTRACT_PATH_TEXT(event_properties, 'project_db.size') AS db_size,
JSON_EXTRACT_PATH_TEXT(event_properties, 'model.counts.total_projects_model_counts.annotations') AS annotation_count,
JSON_EXTRACT_PATH_TEXT(event_properties, 'model.counts.total_projects_model_counts.issues') AS issue_count
FROM events244
WHERE DATE(event_time) BETWEEN '2017-02-18' AND '2017-02-23'
AND event_type = 'annotation_migration.project_stats'
ORDER BY db_size DESC;
```

Need to use `json_extract_path_text` to access event data stored inside of a json blob within the event properties. 