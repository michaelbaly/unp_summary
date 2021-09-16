* SO_USELOOPBACK is not a POSIX standard, in case of debug, check with #ifdef

#### 7.5 Generic socket option
###### SO_LINGER
+ 1 close with linger option on, provide a chance for client to receive *FIN* from server, but does not guarantee **FIN** finally received.

![](linger_scenarios.png)

###### SO_RCVBUF/SO_SNDBUF
+ 1 change default size with this two options
+ 2 setting diff with client and server, on client, setting SO_RCVBUF before calling connect; on server, before calling listen ---> have no effect on window scale option
+ 3 TCP socket buffer size should be **at least four times the MSS** for the connection.
+ 4 dealing with performance --- client tcp must keep a copy of each segment until ACK is received

###### SO_RCVLOWAT/SO_SNDLOWAT
+ 1 consider sencarios with select to any specific descriptor to be "readable" or "writable"
