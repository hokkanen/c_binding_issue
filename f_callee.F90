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
              subroutine cfunc(lib, f_n, cptr_) &
                bind(C, name="c_func")
                USE, INTRINSIC :: ISO_C_BINDING
                character(c_char) :: lib(*), f_n(*)
                TYPE(C_FUNPTR) :: cptr_
              end subroutine cfunc
            end interface
            call cfunc(library, fname, cptr)
            ptr = TRANSFER(cptr, ptr)
        end function func2
END MODULE F_CALLEE
