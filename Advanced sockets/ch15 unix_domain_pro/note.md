##### 15.1 Introduce
* The Unix domain protocols are not an actual protocol suite, but a way of performing client/server communication on a single host using the same API that is used for clients and servers on different hosts
* in other word, Unix domain sockets are an `alternative to IPC` when the client and server are on the `same host`
* why unix domain protocol are used:
*   + 1 On Berkeley-derived impl, this socket are often twice as fast as a TCP socket when both peers are on the same host.
*   + 2 when passing descriptors `between processes` on the same host
*   + 3 newer imple of this sockets provide client's credentials to the server(security concerns)

##### 15.2 socket structure

```
struct sockaddr_un {
  sa_family_t sun_family;     /* AF_LOCAL */
  char        sun_path[104];  /* null-terminated pathname */
};

```

##### 15.3 socketpair function
* applies `only to` unix domain socket


##### 15.9 summary
* `Descriptor passing` is a powerful technique between clients and servers on the same host and it takes place across a Unix domain socket
