# Threads and Synchronization

# Multitasking

Multitasking describes the concurrent execution of multiple tasks or processes. It is achieved via time multiplexing of the CPU, which creates an impression of parallelism even on a single-core system. Multitasking allows for asynchronous I/O.

# Processes/Multiprocessing

A process is essentially a program executing inside an OS. Each running instance of a program (e.g., multiple browser windows) is a separate process. Multiple processes can be run in parallel. Each process has a context:

## Process Context

- Instruction counter/pointer
- Values in registers, stack and heap
- Resource handles (device access, open files)
- ...

## Process Lifecycle

A process can have the following states:

- Created
- Waiting
- Running
- Blocked (waiting for e.g., I/O)
- Terminated

![2022-03-05_14-55.png](Threads%20and%20Synchronization%208eed6a728f094eb6ab3696275989e0c2/2022-03-05_14-55.png)

## Process Management

Processes need resources: CPU time, memory etc.

The OS manages processes:

- Starts processes
- Terminates processes (frees resources)
- Controls resource usage (prevents monopolizing CPU time)
- Schedules CPU time
- Synchronizes processes if required
- Allows for Inter Process Communication (IPC)

## Process Control Block (PCB)

Each process has a process control block, which contains the whole process context:

![2022-03-05_14-58.png](Threads%20and%20Synchronization%208eed6a728f094eb6ab3696275989e0c2/2022-03-05_14-58.png)

![2022-03-05_14-59.png](Threads%20and%20Synchronization%208eed6a728f094eb6ab3696275989e0c2/2022-03-05_14-59.png)

# Threads/Multithreading

Threads are independent sequences of execution running in the same OS process. Multiple threads share the same address space. Therefore threads are not shielded from each other, share resources and can communicate more easily. However, this makes multithreading more vulnerable for programming mistakes.

Context switching between threads is efficient, as there is no change of address space, no automatic scheduling and no saving/reloading of the PCB state.

Multithreading is used in reactive systems - systems that are constantly monitoring. It makes GUI applications more responsive to user input as an application can interrupt a time-consuming task. With multithreading, webservers can handle multiple clients simultaneously. Multithreading in general takes advantage of multiple CPUs/cores.

## Multithreading: 1 vs. many CPUs

![2022-03-05_15-07.png](Threads%20and%20Synchronization%208eed6a728f094eb6ab3696275989e0c2/2022-03-05_15-07.png)

## Java Threads

Thread:

- A set of instructions to be executed one at a time, in a specified order
- A special `Thead` class is part of the core language

Some methods of `java.lang.Thread`:

- `start()`: method called to spawn a new thread
    - Causes JVM to call `run()` method on object
- `interrupt()`: freeze and throw exception to thread

### Creating Java Threads

**Instantiating a subclass of `java.lang.Thread`:**

- Override `run()` method (must be overridden)
- `run()` is called when execution of that thread begins
- A thread terminates when `run()` returns
- `start()` method invokes `run()`
- Calling `run()` does not create a new thread

**Implement `java.lang.Runnable`:**

- Single method: `public void run()`
- Class implements `Runnable`

### Thread State Model in Java

![2022-03-05_15-15_1.png](Threads%20and%20Synchronization%208eed6a728f094eb6ab3696275989e0c2/2022-03-05_15-15_1.png)

### `java.lang.Thread` (under the hood)

![2022-03-05_15-17.png](Threads%20and%20Synchronization%208eed6a728f094eb6ab3696275989e0c2/2022-03-05_15-17.png)

![2022-03-05_15-18.png](Threads%20and%20Synchronization%208eed6a728f094eb6ab3696275989e0c2/2022-03-05_15-18.png)

### Java Threads: Some Key Points

- Every Java program has at least one execution thread
    - First execution thread calls `main()`
- Each call to `start()` method of a `Thread` object creates an actual execution thread
- The program end when all non-daemon thread are finished
- Threads can continue to run even if `main()` returns
- Creating a `Thread` object does not start a thread
- Calling `run()` does not start a thread either, need to explicitly call `start()`

### Java Threads: Some Useful Attributes and Methods

- **ID**: this attribute denotes the unique identifier for each `Thread`
    
    ```java
    Thread t = Thread.currentThread();
    System.out.println("Thread ID" + t.getId());
    ```
    
- **Name**: this attribute denotes the name of the `Thread`
    
    ```java
    t.setName("PP" + 2022);
    ```
    
- **Priority**: denotes the priority of the thread. Threads can have a priority between 1 and 10:
    - JVM uses the priority of threads to select the one that uses the CPU at each moment
    - Typically higher-priority threads finish before low-priority threads
    
    ```java
    t.setPriority(Thread.MAX_PRIORITY);
    ```
    
- **Status**: denotes the status the thread is in: one of new, runnable, blocked, waiting, time waiting or terminated
    
    ```java
    if (t.getState() == State.TERMINATED) \{
        System.out.println("Thread is terminated");
    \}
    ```
    

### Joining Java Threads

Common scenario:

- Main thread starts (forks, spawns) several worker threads...
- ... then needs to wait for the worker’s results to be available

Previously:

- Busy waiting by *spinning* (looping) until each worker’s state is terminated
- Boilerplate code, that is inefficient as the main thread spinning uses CPU time

Idea: wake thread up once work is done. From main thread’s perspective:

- Instead of busily waiting for the results (ready? now ready? now?)...
- ... go to sleep and be woken up once the results are ready

Performance trade-off:

- Join (sleep, wakeup) typically incurs context switch overhead
- If worker threads are short-lived, busy waiting may perform better
- Later in the course: `SpinLock`

### Exceptions

Exceptions in a single-threaded (i.e., sequential) program terminate the program if not caught.

What if a worker thread throws an exception?

- Exception is (usually) shown on console
- Behavior of `thread.join()` is unaffected
- Main thread may not be aware of an exception inside a worker thread

Solution: Setting `UncaughtExceptionHandler`. Implementing `UncaughtExceptionHandler` interface allows us to handle unchecked exceptions. We have three options:

- Register exception handler with `Thread` object
- Register exception handler with `ThreadGroup` object
- Use `setDefaultUncaughtExceptionHandler()` to register handler for all threads

The exception handler can then record which threads terminated exceptionally, restart them or handle the issue otherwise.