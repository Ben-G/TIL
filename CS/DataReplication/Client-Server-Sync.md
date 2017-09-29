# Client-Server Sync: An Unsolved Problem?

*More formally known as: Data Replication*

Some notes on various resources I've looked at to come up with solutions for client-server based sync.

Generally came across 2 traditional approaches:

- State based sync
- Operation based sync

**There are papers discussing interesting alternative solutions:**

- Differential Sync:
 - https://neil.fraser.name/writing/sync/
 - http://codebrief.com/2013/08/client-sync-for-the-rest-of-us/  
- Conflict free, replicated data types (CRDTs):
 - https://hal.inria.fr/file/index/docid/617341/filename/RR-7687.pdf 
 - https://github.com/papers-we-love/papers-we-love/blob/master/data_replication/a-comprehensive-study-of-convergent-and-communative-replicated-data-types.pdf
- Discussion of Union of CRDTs and Operational Transformation:
  - https://medium.com/@raphlinus/towards-a-unified-theory-of-operational-transformation-and-crdt-70485876f72f
**Related papers:**

- RING: A Client-Server System for Multi User Virtual Environments
 - Visibility computation for multi-client systems; should be applicable to general software development
 - http://www.cs.princeton.edu/courses/archive/fall08/cos597B/papers/RING.pdf (Need to read)


 ​
---

Notes on implementing a sync mechnanism based on above ideas:

## Sync V2 Prototyping

On a high level we can chose between two fundamentally different approaches. One approach performs synchronization by tracking events, syncing these events and replaying them to bring client and server up to the same state.

The second approach tracks changes in the form of snapshots or patches (we track the data/mutations themselves, not the operations that caused the changes).

Throughout this document we will refer to these two approaches as following:

* **Event Sync: **we track mutations in the form of events (based on the ideas of Operational Transformation (https://en.wikipedia.org/wiki/Operational_transformation))
* **Differential Sync:** we track mutations as snapshots of data (or as snapshots of diffs between data, based on the ideas of Differential Synchronization (https://neil.fraser.name/writing/sync/))

The following sections will discuss these approaches in detail.

**Approach 1: Event Sync**
In my current prototype client and server transform data through defined Operations. E.g. AddAnnotation, ChangeUsername, etc. 

Each mutation is represented by one of these operations. 

The **server** stores separate sets of data:

* A commitLog with all the operations that have been applied successfully
* The latest server state (in form of DB models)

The **client** stores separate sets of data:

* **Server State:** The latest server state from last sync (in form of DB models)
* **Server Commit Log Set**: A set of known operations from the servers commit log; indicates which operations this client is aware of
* **Pending Operations:** A set of local operations that have not yet been pushed to the server
* **Local State:** The local view of the data: server state + applied local operations (in form of DB models)

The client works with the data in the **Local State**, the same way clients work with their local persistence layer today.

Upon synchronization:

1. The client asks the server for the entries from the commitLog which it does not yet know about. It applies these operations to its **Server State**, thereby updating its local copy of the server state to match the actual server state
2. It pushes its **Pending Operations** to the server. The server evaluates the operations:
    1. It applies the operations that are still valid with respect to the latest server state
    2. It rejects operations that have become invalid; **it returns a list of invalidated operations to the client**
3. The client recalculates its local state by applying the **valid Pending Operations** to the local copy of the server state;
    it then empties its **Pending Operations** queue. 

Client and server now have the same state and the list of local changes on the client is empty.


Benefits of this approach

* By using Operations as the atomic unit of mutations, we have an automatic** audit trail**. We can understand the semantics of all operations that occurred over time.
    * Having a formal definition of these operations allows us to easily define notification / live update rules based on them (notify user X whenever operation Y occurs on project Z)
* **Client - Server sync occurs in delta updates**. Only the initial sync requires us to exchange the full model information. Beyond that client and server communicate in operations. When updating frequently, these operation sets will be a lot smaller than a full sync.
* The sync model based on operations makes it a lot easier to implement **live updating**. The server can push new committed operations to the client. The client can apply these new operations in the same manner (independent of whether it's using push/pull sync)
* Having a formal definition of an Operation means that we can encode rules, about when operations are valid/invalid. If operations have become invalid, we can identify the exact reason, theoretically enabling **conflict resolution**. (In some cases we might even be able to transform an operation automatically, to still be valid despite concurrent changes, borrowing ideas from Operational Transformation (https://en.wikipedia.org/wiki/Operational_transformation))

Risks of this approach

* **Client and server need to have a common understanding of how to apply operations, otherwise local and server state will divert**. This common understanding also needs to be versioned correctly. An operation in v3 of the API might work differently then an operation in v4.
    * There might be ways of mitigating this risk by instead calculating the diffs between the latest operations the client has seen and the latest server state and syncing a JSON model with the latest values of the changed fields to the client, instead of a set of operations. (this however would might mean larger changes to server side persistence, because it would require us to be able to view the state of models at an earlier point in time).
* After crossing a certain threshold, transferring and applying new operations can become more expensive than a full sync (image a client not syncing for multiple months on a large project). We could handle such edge cases specially; sending the local pending operations first; then performing a new full sync (the same way we do initial sync) instead of a delta sync.

Prototype in a Swift Playground

I've implemented the basic algorithm in Swift, in order to be able to iterate on this idea:
https://github.com/Ben-G/OT-Sync-Prototype

The main file showing an example synchronization scenario lives here:
https://github.com/Ben-G/OT-Sync-Prototype/blob/master/OperationalTransformDemo.playground/Contents.swift

**FAQ**

* How does this approach work with permissions / a visibility model?
    * When a permission change occurs, previous operations that might not have been visible to a client could become visible. Upon the next synchronization the server will identify the operations that the client does not yet know about and send them to the client (this is possible because client or server (impl. detail) remember the set of operations the client has already seen). 
* How does this approach work for entities that were visible, but now have become invisible due to a permission change? 
    * -This leads to a broader question: how can we *undo* an operation? We have seen how an operation can be replayed, but not undone → this might be a severe limitation of this approach that would require us to define an inverse operation-
    * Discussing permission details is outside the scope of this doc. We should be possible to use the containers approach currently in use for Field Reports. We can use a similar sequence number / commit log scheme




​	


