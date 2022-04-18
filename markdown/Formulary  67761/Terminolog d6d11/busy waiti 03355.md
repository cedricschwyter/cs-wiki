# busy waiting

Description: Occurs when a thead busily (actively) waits, e.g. by spinning in a loop, for a condition to become true. In the opposite scenario, the thread sleeps (i.e. is blocked; in Java: join(), wait()) until the condition becomes true. Trade-off: busy waiting uses up CPU time, whereas blocking may cause additional context switches.