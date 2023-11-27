#include <stdio.h>

// Just dummy function to return a pointer for
void dummy(int* a) { *a += 10; }

// Function called from fortran
void *c_func( char *library, char *name) {
  printf("library: %s, name: %s\n", library, name);

  void (*ptr)(int*) = &dummy;

  return ptr;
}
