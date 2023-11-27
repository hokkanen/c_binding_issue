# Makefile for fortran iso_c_binding example

# Compiler settings
C_COMP = gcc
F_COMP = gfortran

# Object files
C_OBJS = c_callee.o
F_OBJS = f_callee.o f_caller.o

# Executable
BIN = a.out

# Compile rules
%.o: %.c
	$(C_COMP) -c $< -o $@

%.o: %.F90
	$(F_COMP) -c $< -o $@

# Link rule
$(BIN): $(C_OBJS) $(F_OBJS)
	$(F_COMP) $^ -o $@

# Clean rule
clean:
	rm -f $(C_OBJS) $(F_OBJS) $(BIN) *.mod 

# Module dependencies
f_callee.o: f_callee.F90
f_caller.o: f_caller.F90 f_callee.mod

# Module compilation
f_callee.mod: f_callee.F90
	$(F_COMP) -c $< -o $@
