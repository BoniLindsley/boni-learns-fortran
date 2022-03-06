module boni_learns_fortran
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, boni-learns-fortran!"
  end subroutine say_hello
end module boni_learns_fortran
