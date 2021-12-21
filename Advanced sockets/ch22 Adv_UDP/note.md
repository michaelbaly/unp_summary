###### 22.1 Intr

* collection of various topics that affect app using UDP


###### 22.2 receiving flags, dest IP, and IF index
* recvfrom_flags function, similar to recvmsg but return more info

###### 22.3 Datagram truncation

* when a UDP datagram arrives that is larger than app's buffer, recvmsg sets `MSG_TRUNC` flag
* not all imp handle in this fashion:
* 1. discard the excess bytes and return `MSG_TRUNC` flag to application
* 2. discard the excess bytes without telling app
* 3. keep excess bytes and return them in subsequent read operation on the socket

###### 22.4 when to use UDP instead of TCP
* 1. UDP `must` be used for broadcast or multicast applications.
* 2. UDP `can` be used for simple request-reply applications, but error detection must then be built into the application.
* 3. UDP 'should not' be used for bulk data transfer --- refer to TCP features: error check, flow control, congestion avoidance, etc.

* Exceptions: TFTP , uses UDP for bulk data transfer.
* TFTP is used only to bootstrap systems on a LAN, not for bulk data transfer across WANs

###### 22.5 Adding reliability to a UDP applciation
* two feature, at least, are required:
* 1. timeout and retransmission
* 2. sequence numbers so the client can verify that a reply is for the appropriate request
* TBC: rtt example

###### 22.6 Binding IF address

* TBC:

###### 22.7 concurrent UDP server

###### 22.8 IPv6 packet info

###### 22.9 IPv6 pMTU

###### 22.10 summary
* Q: when applcaiton want to know the dest IP addr and received IF for a UDP datagram, what we gonna do?
