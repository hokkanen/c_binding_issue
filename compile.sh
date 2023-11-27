#!/bin/bash -l

# Compile the Fortran code
ftn -c f_caller.F90 -o f_caller.o
ftn -c f_callee.F90 -o f_callee.o

# Compile the C code
cc -c c_callee.c -o c_callee.o

# Link the object files
ftn f_caller.o f_callee.o c_callee.o
