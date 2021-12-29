##### 28.1 Introduce
* Raw sockets provide three features not provided by normal TCP/UDP
* 1. it let us read/write ICMPv4, IGMPv4, and ICMPv6 packets. `ping` program sends ICMP echo requests and receive ICMP echo replies; `mrouted` sends and receives IGMPv4 packets.
* 2. with a raw socket, a process can read and write IPv4 datagram with an **IPv4 protocol field** that is not processed by the kernel.
* 3. with a raw socket, a process can build its own IPv4 header using `IP_HDRINCL` socket option.


##### 28.2 Raw socket creation
###### Steps:
* 1. create with SOCK_RAW, only superuser can create a raw socket
* 2. IP_HDRINCL option can be set
* 3. `bind` can be called on the raw socket, but this is rare.
* 4. `connect` can be called, but rare.

##### 28.3 Raw socket output
###### Rules to follow:
* output IF ---> `sendto` or `sendmsg`
* starting address of data is different based on whether `IP_HDRINCL` option is set or not
* kernel framents raw packets that exceed the outgoing interface `MTU`

###### IPv6 difference
* TBC

##### 28.4 Raw socket input
###### which received IP datagram does the kernel pass to raw socket?
* UDP/TCP packets never passed to raw socket
* Most ICMP packets are passed to raw socket after kernel has finished processing it
* All IGMP packets are passed to it after kernel finished processing it
* All IP datagram with a protocol field that the kernel does not understand are passed to it
* If datagram arrives in fragments, nothing is passed to a raw socket until all fragments have arrived and have been reassembled.

###### matching rules required before the datagram delivered to raw socket
* If a nonzero `protocol` is specified when the raw socket is created
* If a local IP address is bound to the raw socket by `bind`
* If a foreign IP address was specified for the raw socket by `connect`

###### ICMPv6 type filtering
* application-specified filter are used.
* Purpose: To reduce the number of packets passed from kernel to application across a `raw ICMPv6` socket.


##### 28.5 `ping` program
*

##### 28.6 `traceroute` program
*
