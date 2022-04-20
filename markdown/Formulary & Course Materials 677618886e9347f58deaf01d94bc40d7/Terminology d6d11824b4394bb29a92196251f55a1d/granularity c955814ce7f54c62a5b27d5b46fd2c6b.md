# granularity

Description: Coarse vs. fine: Splitting work into large tasks (coarse) reduces overhead, but might not use all available threads. Small tasks (fine granular) can be parallelized more, but also add more overhead. The trick is to find a "reasonable" size to minimize overhead and maximize parallelism.