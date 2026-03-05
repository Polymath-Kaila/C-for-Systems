# Systems C “C to talk to the kernel”

This repository is **not general C**. It is **systems C**: the subset of C you need to read POSIX/Linux kernel-facing APIs, write correct low-level programs, and avoid the classic failure modes (lifetime bugs, buffer overruns, incorrect error handling, partial I/O).

The repo is structured so that:

- **`docs/`** = theory you must internalize (compact, reusable)
- **`src/` + `include/`** = your reusable systems toolkit (wrappers + safe patterns)
- **`labs/`** = proof programs (you demonstrate the theory by building)
- **`examples/`** = tiny isolated demonstrations
- **`tests/`** = regression tests for your toolkit

---

## Repository Layout
Its well structured just check on it.  


---

## How to Use This Repo (Workflow)

### Rule 1: Theory → Proof
For each topic:
1. Read/write the relevant **`docs/*.md`**
2. Implement the primitive in **`src/` + `include/`**
3. Prove it in a **`labs/`** program
4. Lock it in with a **`tests/`** program

You don’t “finish” a concept until you have:
- a clear doc summary (`docs/`)
- a reusable implementation (`src/` + `include/`)
- a working proof (`labs/`)
- a test (`tests/`)

### Rule 2: Error-first discipline
Everything that touches the OS must have disciplined error handling:
- check return codes
- understand partial reads/writes
- handle `EINTR` correctly (retry where appropriate)
- print meaningful context

This repo should make it normal to write:

- `xread/xwrite/xclose` wrappers
- `xwrite_all` loops
- `die_errno("context")`

### Rule 3: Zero undefined behavior (UB)
You will treat UB as a failure state:
- no out-of-bounds access
- no use-after-free
- no reading uninitialized memory
- no invalid pointer arithmetic

Use sanitizers to enforce this.

---

## Platform Notes (Windows)

You can use this repo from Windows in two sane ways:

### Option A (Recommended): WSL2 (Linux userland)
This gives you real POSIX headers and behavior (sockets, fork, etc.).
You’ll compile with gcc/clang and everything in this repo maps cleanly.

### Option B: MSYS2 / MinGW (Works, but not identical)
Good for learning C and some POSIX-like APIs, but:
- not all POSIX syscalls behave the same
- `fork/exec` semantics differ or may not exist
- sockets exist, but edge cases can differ

If your goal is “C to talk to the kernel” for Linux servers, use **WSL2**.

---

## Setup
#### Follow online docs for set up and get started.
