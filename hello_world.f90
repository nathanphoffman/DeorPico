! FORTRAN function - returns a value
      FUNCTION SQUARE(N)
      SQUARE = N * N
      RETURN
      END

! FORTRAN subroutine - no return value      
      SUBROUTINE PRINTIT(N)
      WRITE(*,*) N
      RETURN
      END