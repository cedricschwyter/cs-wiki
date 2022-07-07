# Java Recap (in light of concurrency)

# Errors

There are three different kinds of errors:

- Compiler errors
- Runtime errors
- Logic errors

# Data Types

A category or set of data values

- Constrains the operations that can be performed on data
- Many languages ask the programmer to specify types
- Internally, everything is stored as a sequence of 1s and 0s

# Primitive Types

Integer:

- byte (8 bits)
- short (16 bits)
- int (32 bits)
- long (64 bits)

Real numbers:

- float (32 bits)
- double (64 bits)

Characters (Unicode):

- char (16 bits)

Booleans:

- boolean

# Type Conversion (Casting)

Since Java is a strongly-typed language the compiled can detect type errors at compile time.

# Two-way `if` Statement

```java
if (boolean-expression) &#123;
    statementsTrue();
&#125; else &#123;
    statementsFalse();
&#125;
```

# Nested `if/else`

Chooses between outcomes using many tests.

```java
if (test) &#123;
    statements();
&#125; else if (test) &#123;
    statements();
&#125; else &#123;
    statements();
&#125;
```

Tip: In parallelism/concurrency try to have the `if/else`'s read from a local variable.

# Loops

## Bounded Loop

Executes a known number of times.

## Unbounded Loop

A loop where the number of times its body repeats is unknown in advance, e.g., repeat until the user types “q” to quit.

# Arrays

An array is an object that stores many values of the same type.

- element: one value in an array
- index: a 0-based integer to access an element from an array

# Strings

An object storing a sequence of text characters.

Unlike most other objects, a `String` can be created without `new`: `String name = "text";`.

Characters of a string are numbered with 0-based indexes.

# Objects

An object is an entity that contains data and behavior. An object can be constructed using the `new` keyword: `Type objectName = new Type(params);`. Dot notation is used to call an object’s methods and thus interact with its behavior: `objectName.methodName(params);`.

# Object References

Arrays and object use reference semantics.

- *efficiency:* Copying large objects slows down a program.
- *sharing:* It is useful to share an object’s data among methods.

## Pass by reference

When an object is passed as a parameter, the object is *not* copied. The parameter refers to the same object. If the parameter is modified it *will* affect the original object.

# Variables, Constants

*Static variables*: are shared by all instances of a class. *Static methods* are *not* tied to a specific object. *Static constants* are final variables shared by all instances of a class. *Instance variables* belong to a specific class *instance*. *Instance methods* are invoked by an *instance* of the class.

# Exceptions

*Advantages* of exception handling:

- enables a method to throw an exception to its caller
- without this, a method must handle the exception or terminate the program

# Language Features vs. Parallelism: Guidelines

- Keep variables as ‘local’ as possible: global variables means they can be accessed by various parallel activities. While when its local to the process/thread we are safe against inadvertent accesses to the variable.
- If possible, avoid aliasing of references: aliasing can lead to unexpected updates to memory through a process that accesses a seemingly unrelated variable (named differently).
- If possible, avoid mutable state, in particular when aliased: aliasing is no problem if the shared object is immutable, but concurrent mutations can make bugs *really* hard to reproduce and investigate (”Heisenbugs”)
- Exceptions vs. Concurrency/Parallelism:
    - Exceptions tend to be less effective with parallelism because the cause of the error may be far earlier in the execution than where the exception triggers. Hence, the stack trace of the exception can be less informative and useful.
    - Exceptions thrown in a thread (parallel process) don’t automatically reach the main program, and thus might go completely unnoticed. This can make it (even) more complicated to track down the root cause of a bug.