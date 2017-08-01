# Surprisingly Simple Deadlocks in Postgres

Today I was able to produce a deadlock in postgres (in a side-project of mine) by running some seemingly innocent updates. I had multiple processes that would regularly update large portions of a table with new data.

The deadlock would occur whenever two processes updated the same table at the same time.

Postgres would deadlock due to the default behavior described here:

> In PostgreSQL the rows will be locked as they are updated -- in fact, the way this actually works is that each tuple (version of a row) has a system field called `xmin` to indicate which transaction made that tuple current (by insert or update) and a system field called `xmax` to indicate which transaction expired that tuple (by update or delete). When you access data, it checks each tuple to determine whether it is visible to your transaction, by checking your active "snapshot" against these values.
>
> If you are executing an UPDATE and a tuple which matches your search conditions has an xmin which would make it visible to your snapshot and an xmax of an active transaction, it blocks, waiting for that transaction to complete.
>
> [...]
>
> Obviously, a deadlock is the result of this happening to rows in different order.

[Source on StackOverflow](https://stackoverflow.com/questions/10245560/deadlocks-in-postgresql-when-running-update)

So by the virtue of having to processes updating two tables in a different order I would regularly run into deadlocks.

A simple solution that is appropriate for my particular task is to use `SELECT FOR UPDATE` to take a row-exlusive lock for all the rows I need to update. Here's a detailed decription of the various [lock types in Postgres](https://www.postgresql.org/docs/9.4/static/explicit-locking.html) and here's a good [blog post on Potgres locks](http://big-elephants.com/2013-09/exploring-query-locks-in-postgres/).

