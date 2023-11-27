program main
    
    USE F_CALLEE
    
    implicit none
    INTEGER(KIND=SELECTED_INT_KIND(18)) :: ptr = 0
    character :: libname(10),funcname(10)
    
    libname(1) = "l"
    libname(2) = "i"
    libname(3) = "b"
    libname(4) = "r"
    libname(5) = "a"
    libname(6) = "r"
    libname(7) = "y"
    libname(8) = CHAR(0)
    
    funcname(1) = "f"
    funcname(2) = "u"
    funcname(3) = "n"
    funcname(4) = "c"
    funcname(5) = CHAR(0)
    
    print *, 'ptr:', ptr
    ptr = func2(libname,funcname)
    print *, 'ptr:', ptr

end program main
