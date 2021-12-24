###### 26.1 Intro
* fork take charge of logic process for each child process, but with problems:
  - fork is expensive, memory is copied from parent to child --- data/text,etc; new imp(copy-on-write) still expensive even it only copy text at frist stage.
  - IPC is difficult to/from child and client, especially, returning info from child to parent

* thread can solve both problems.
* the main problem thread need to consider is `SYNCHRONIZATION`
* threads within a process share:
  - 1. process instructions
  - 2. most data
  - 3. open files
  - 4. signal handler and signal dispositions
  - 5. current working dir
  - 6. user and group IDs
* threads has its own:
  - 1. Thread ID
  - 2. set of registers, including program counter and stack pointer
  - 3. stack
  - 4. errno
  - 5. signal mask
  - 6. priority

###### 26.2 thread function
* pthread_detach --- commonly called by the thread that whats to detach itself.
```
  pthread_detach(pthread_self());
```
* Two other ways for a thread to terminate:
* 1. the function that started the thread can return
* 2. if the main function of the process returns or if any thread calls exit, **the process terminates, including any threads**.

###### 26.3 str_cli function using threads
* NA

###### 26.4 TCP echo server using threads
* creat thread instead of fork every time arrives a new connection
```
  ...
  connfd = accept()
  pthread_create(..., (void*)connfd)
```

* Problems arise when serveral connections arrives simoutenously --- causing connfd with the latest value, thus previous connfd lost

* Passing portable argument --- use malloc/free for each connfd, but malloc/free are nonre-entry functions that cause other problems
```
  ...
  iptr = malloc(sizeof(int))
  *iptr = accept()
  pthread_create(..., iptr)
```
```
handler(void* arg)
  connfd = *((int*)(arg))
  free(arg)
```

* thread-safe function
  - two of the function are thread-safe only if caller alocates space for the result and passes that pointer as the argument to the function

###### 26.5 Thread-specific data
* the first two functions taht are normally called when dealing with thread-specific data are:
* 1. pthread_once
* 2. pthread_key_create
  - **typical use of these two function:**
  ```
  pthread_key_t   rl_key;
     pthread_once_t  rl_once = PTHREAD_ONCE_INIT;

     void
     readline_destructor(void *ptr)
     {
         free(ptr);
     }

     void
     readline_once(void)
     {
         pthread_key_create(&rl_key, readline_destructor);
     }

     ssize_t
     readline( ... )
     {
         ...

         pthread_once(&rl_once, readline_once);

         if ( (ptr = pthread_getspecific(rl_key)) == NULL) {
             ptr = Malloc( ... );
             pthread_setspecific(rl_key, ptr);
             /* initialize memory pointed to by ptr */
         }
         ...
         /* use values pointed to by ptr */
     }
  ```
