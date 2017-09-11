- https://www.confluent.io/blog/publishing-apache-kafka-new-york-times/

  - NYT uses Kafka as primary data store for all content
  - Different DBs can be materialized by processing that log
  - Schema changes are easy; change schema of a DB then re-process the entire event log to recreate the DB content
  - Twitter discussion: https://twitter.com/benjaminencz/status/905571431248928770

  ​

