# locality

Description: Has several meanings in the context of parallel programming:
1. Locally reason about one thread at a time (also known as thread modularity). Simplifies correctness arguments.
2. Data locality: related memory locations are accessed shortly after each other. Improves performance by optimal cache usage.
3. Code locality: straight-line code increases opportunities for instruction level parallelism