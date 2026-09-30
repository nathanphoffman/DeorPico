! Fortran 90 sample
program sample
  implicit none
  integer :: i
  real :: total
  double precision, parameter :: scale = 1.5d0
  character(len=20) :: label

  label = 'running total'
  total = 0.0
  do i = 1, 10
    if (mod(i, 2) == 0) then
      total = total + square(i) * 2.5e-1
    end if
  end do
  print *, "result: ", label, total * scale

contains

  integer function square(n)
    integer, intent(in) :: n
    square = n * n
  end function square

end program sample
