# cilk-style programming

Description: Parallel programming idiom: To compute a program, execute code and spawn new tasks if required. Before returning, wait for all spawned tasks to complete. The system manages the eventual execution of the spawned tasks potentially in parallel. spawning and waiting on tasks creates a task graph which is a DAG.