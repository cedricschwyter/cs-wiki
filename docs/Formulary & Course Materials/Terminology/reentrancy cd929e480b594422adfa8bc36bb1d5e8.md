# reentrancy

Description: A lock is reentrant if it can be acquired (and released) multiple times by the same thread. If a lock is non-reentrant, trying to acquire it again might cause an exception or other problems.