# Lessons learned builing offline capable distributed systems on a budget

- Be careful with sync/pagination schemes. E.g. using `lastUpdate` timestamp will result in issues when data is modified during a sync session. It can also cause issues because multiple records can have excactly the same `lastUpdate` time, and depending on how you fetch data from the database it might not be stably sorted and you'll drop records. You need a monotonically increasing sequence number (essentially a pointer into the log of changes) that you can use during pagination. After fetching one page you can pass the latest sequence number you've seen to the server and receive the next page.
- VERSION YOUR SCHEMAS
  - You will be talking to various old clients expecting various different schemas of data. Having to reverse engineer the schema version out of the data shape is unreliable and painful. Having a version number associated with data can't do harm.

