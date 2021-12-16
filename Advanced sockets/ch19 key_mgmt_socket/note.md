###### 19.1 Intr

* A standard of mechanism was needed to manage secret encryption and authorization keys.
* thus, new API were create for IPsec and other network services.
* this API create a new protocol family --- `PF_KEY`
* The only type of socket supported in the key domain is a raw socket.
* Three types of opt supported on key mgmt sockets:
* 1. A process can send a msg to the kernel
* 2. A process can read a msg from kernel(or another process)
* 3. A process can send a dump request msg to the kernel, and the kernel will reply with a dump of the current SADB(security association database)


###### 19.2 Reading and Writing

* same strategy with routing table access

###### 19.3 Dumping SADB

* refer to sadb_dump function in key/dump.c file

###### 19.4 Creating a static SA

* step-by-step operation manully
* use sadb_dump to verify the validation

###### 19.5 Dynamically Maintaining SAs

* For greater security, `periodic` rekeying is required.

###### 19.6 Summary

* 1. key mgmt socket are used to communicate SAs to the kernel
* 2. SAs support static and dynamic installation
* 3. Dynamic keys can have associate lifetime, when liftime reached, **key mgmt deamon is informed**.
