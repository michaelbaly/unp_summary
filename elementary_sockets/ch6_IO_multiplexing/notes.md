## Scenarios:

* when client handling multiple descriptors(interactive input and network socket)
* client handles multiple sockets at the same time
* tcp server handles both listening and connected sockets
* a server handles both tcp and udp
* a server handles multiple services and multiple protocols

![](sock_ready_for_select.jpg)

#### 6.5 Shutdown function
* limitation of close function:
1. Decrease the descriptors's reference count and close socket **only if the count reach 0**
* [note] with shutdown , we can initiate TCP's normal connection termination sequence
![](shut_ter_seq.jpg)
2. Close terminates both direction of data transfer, reading and writing


* prototype --- int shutdown(int sockfd, int howto);
| ---howto----            | ---action---                                     |
| ---------------------  | --------------------------------------------------|
|        SHUT_RD               |  read half closed                           |
|        SHUT_WR               |  write half closed                          |
|        SHUT_RDWR             |   both closed                               |
