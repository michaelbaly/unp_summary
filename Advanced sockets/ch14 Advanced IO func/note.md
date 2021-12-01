##### 14.2 socket timeouts
###### Three ways to place a timeout
* 1 call alarm, which generates `SIGALRM` when time expired
* 2 Block waiting for IO in `select`
* 3 use `SO_RCVTIMEO` and  `SO_SNDTIMEO` socket options

##### 14.4 readv and writev
* read into or wirte from one or more buffers with a single function call.
* datatype `struct iovec` are specified by `POSIX`

##### 14.5 recvmsg and sendmsg
* most general of all the IO functions

![](diff_group_IO.png)

##### 14.6 Ancillary Data
* This data can be sent and received using `msg_control` and `msg_controllen` members of `msghdr`
*

##### 14.7 How much data is queued?
* three tech to see how much data queued to be read on a `socket`, without reading the data

| tech                | scenario                 | tips                      |
| ------------------- | ------------------------ | ------------------------- |
| nonblocking IO      | not block in kernel      |                           |
| use `MSG_PEEK` flag | remain data on the queue |                           |
| FIONREAD command    | build-in with ioctl      | total num of bytes queued |
|                     |                          |                           |

##### 14.8 sockets and std IO
###### std IO library can be used with sockets, but should consider:
* A std IO stream can be created from any descriptor by calling `fdopen` func, the relationship will be `stream <-----> fd`
* TCP and UDP are full-duplex. std IO stream can also be full-duplex: open stream with type `r+` but constrains follows: an output function cannot be followed by an input function without  an intervening call to `fflush`,`fseek`,`fsetpos`,`rewind`, and vias-versus
* simpley way to handle this `read-write` problem is to open two std IO streams: one for reading, one for writing

##### 14.9 Adv polling

###### `/dev/poll` IF
###### `kqueue ` IF
* poll for many events without the overhead required by `select` and `poll`
