###### Intro
* 1. OOB data is considered higher priority than normal data.
* 2. OOB data is mapped onto the existing connection.


###### 24.2 TCP OOB data
* TCP provide an `urgent mode` to send `MSG_OOB` to the peer.
* example of using `SIGURG`
* 1. OOB sending --- send with `MSG_OOB` flag

  ```
   Write(sockfd, "123", 3);
   printf("wrote 3 bytes of normal data\n");
   sleep(1);

   Send(sockfd, "4", 1, MSG_OOB);
   printf("wrote 1 byte of OOB data\n");
   sleep(1);

  ```

* 2. OOB receiving --- use signal handler

*  * snapcode 1
    ```
         connfd = Accept(listenfd, NULL, NULL);

         Signal(SIGURG, sig_urg);
         Fcntl(connfd, F_SETOWN, getpid());

    ```
* * snapcode 2

    ```
    void
     sig_urg(int signo)
     {
         int     n;
         char    buff[100];

         printf("SIGURG received\n");
         n = Recv(connfd, buff, sizeof(buff) - 1, MSG_OOB);
         buff[n] = 0;                /* null terminate */
         printf("read %d OOB byte: %s\n", n, buff);
     }

    ```

* **possible errors**:
  - 1. If the process asks for OOB data, but peer has not sent any, `EINVAL` is returned.
  - 2. If the process has been notified that the peer has sent an OOB byte, and the process tries to read it but it not yet arrived, `EWOULDBLOCK` is returned.
  - 3. If the process tries to read the OOB byte multiple times, `EINVAL` is returned.
  - 4. If the process has set the `SO_OOBINLINE` option and then tries to read OOB byte specifying `MSG_OOB`, `EINVAL` is returned

* example using `select`
  - To avoid error 3 above.


###### 24.3 sockatmark function
* There is an associated OOB mark when OOB data is arrived, it's the `position` where the OOB byte is in the normal stream
* imp using `ioctl`:
  ```
  1 #include    "unp.h"

  2 int
  3 sockatmark(int fd)
  4 {
  5     int     flag;

  6     if (ioctl(fd, SIOCATMARK, &flag) < 0)
  7         return (-1);
  8     return (flag != 0);
  9 }

  ```
* two features of OOB mark
* 1. OOB mark always points one beyond the final byte of normal data.
* 2. a read operation always stops at the OOB mark.

###### 24.4 TCP OOB data recap
* The usefulness of OOB data depends on **why it is being used by the application**.
