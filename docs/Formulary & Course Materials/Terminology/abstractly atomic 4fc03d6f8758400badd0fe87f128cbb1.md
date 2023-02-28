# abstractly atomic

Description: A statement or instruction that, at a certain level of abstraction, appears to be executed atomically. E.g. from a caller's perspective, a method synchronized append(x) of a queue appears to append element x in one step, but from the queue's perspective, this might take several steps.