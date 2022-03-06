program hello
  ! Bring names from other modules into scope.
  ! Use => to map from a different name.
  use, intrinsic :: iso_fortran_env, only: sp=>real32, real64
  use, intrinsic :: iso_c_binding, only: c_float, c_double

  implicit none ! Require variable declaration before use.

  ! Variable declarationx come before "body".
  integer :: counter
  real :: pi
  real(sp) :: short_pi ! Explicit precision.
  real(real64) :: long_pi
  real(c_float) :: short_e
  real(c_double) :: long_e
  complex :: two_dimensional
  character :: a_letter
  logical :: no
  logical :: yes

  ! "Static" variable. Persists between function calls.
  integer :: call_counter = 0

  ! Variables are not initialised automatically.
  cOuNtEr = 1
  pi = 3.14159265
  ! Underscore suffix for literal kind.
  short_pi = 3.14159265_sp
  long_pi = 3.14159265_real64
  short_e = 2.718281828_c_float
  long_e = 2.718281828_c_double
  two_dimensional = (100, 200)
  a_letter = 'A'
  a_letter = "B"
  no = .false.
  yes = .true.
  call_counter = call_counter + 1 - (1*3/3)**5

  ! (File handle, format specifier)
  ! If asterisk, use STDIN/STDOUT and "auto convert"
  write (*, *) 'You have ', 'found letters ', a_letter, ' and', yes
  write (*, *) 'Pick one.'
  read (*, *) a_letter
  ! Wrapper for STDOUT.
  print *, 'New letter is ', a_letter
end program hello
