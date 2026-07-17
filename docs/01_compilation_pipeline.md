#C compilation process

After writing a C program code it goes through 4 stages called compilation stages.  
1. Preprocessing where by header files are expanded.
```bash
gcc -E filename.c
```

2. Compilation where by the C progrm code is converted to equivalent assembly code
```bash
gcc -S filename.c
```

3.Assembler where by the assemby code is converted to object code or machine code.
```bash
gcc -c filename.c
```
4.Linker which brings external libraries to our program code.
```bash
gcc -o executable.c filename.c

```
---
