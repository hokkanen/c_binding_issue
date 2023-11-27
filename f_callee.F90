MODULE F_CALLEE
    USE, INTRINSIC :: ISO_C_BINDING
    IMPLICIT NONE
    CONTAINS
        function func2(library, fname) RESULT(ptr)
            implicit none
            CHARACTER :: library(*), fname(*)
            INTEGER(KIND=SELECTED_INT_KIND(18)) :: ptr
            TYPE(C_FUNPTR) :: cptr
            interface
              function cfunc(lib, f_n) RESULT(cptr_) &
                bind(C, name="c_func")
                USE, INTRINSIC :: ISO_C_BINDING
                character(c_char) :: lib(*), f_n(*)
                TYPE(C_FUNPTR) :: cptr_
              end function cfunc
            end interface
            cptr = cfunc(library, fname)
            ptr = TRANSFER(cptr, ptr)
        end function func2
END MODULE F_CALLEE
