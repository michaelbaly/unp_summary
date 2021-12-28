###### AT16 local upgrade agent

* agent behaves as a thread
* the thread responsible for:
* 1. monitor UART1 mode
* 2. pulls up by user defined at command: AT+DCPS=1, 1

* pseducode of the thread

```
DCPS_HANDLER():
  // enable/disable dcp mode
  // pull up another thread to configure upgrade environment if necessary
```

```
LOCAL_UPGRADE_THREAD(parameters):
  // Close debug console and open uart1, reuse debug console resource: buffer / queue

  if (in dcp mode) {
    uart_onoff(debug, off)
    uart_onoff(uart1, on)
    // mark in case of rest/power down operation, main thread will check it once bootup
    write(fd, mark)
  } else {
    uart_onoff(uart1, off)
    uart_onoff(debug, on)
    // clear mark in fs
    write(fd, unmark)
  }
```

```
MAIN_THREAD():
  if (upgrade_mark_exist) {
    // use UART1 instead of debug console for upgrade
  }
```
