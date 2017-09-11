http://debezium.io/

> Debezium is an open source distributed platform for change data capture. Start it up, point it at your databases, and your apps can start responding to all of the inserts, updates, and deletes that other apps commit to your databases. Debezium is durable and fast, so your apps can respond quickly and never miss an event, even when things go wrong.

Exposes a log of changes on top of a regular database.

> Debezium is built on top of [Apache Kafka](http://kafka.apache.org/) and provides [Kafka Connect](http://kafka.apache.org/documentation.html#connect) compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, from where your application consumes them. This makes it possible for your application to easily consume all of the events correctly and completely. Even if your application stops (or crashes), upon restart it will start consume the events where it left off so it misses nothing.

