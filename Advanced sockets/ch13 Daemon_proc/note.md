##### 13.1 ways to start a daemon
* system start up, via script
* inetd superserver
* ...

##### 13.2 syslogd daemon
* BSD implemntation
  * configuration /etc/syslog.conf
  * a unix domain socket is created and bound to /var/run/log
  * a udp socket is created and bound to port 514
  * pathname /dev/klog is opened (for any error input)

##### 13.3 syslog function
* logging messages from a daemon is to call this function

##### 13.4 daemon_init function
* to daemonize the process

##### 13.5 inetd daemon
