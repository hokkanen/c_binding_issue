#include <stdio.h>

// Just dummy function to return a pointer for
void dummy() { printf("Function pointer is working!\n"); }

// Function called from fortran
void c_func( char *library, char *name, void (**ptr)()) {
  printf("library: %s, name: %s\n", library, name);
  *ptr = &dummy;
}
