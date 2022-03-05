program hello
  implicit none ! Require variable declaration before use.

  ! Variable declarationx come before "body".
  integer :: counter
  real :: pi
  complex :: two_dimensional
  character :: a_letter
  logical :: no
  logical :: yes

  ! "Static" variable. Persists between function calls.
  integer :: call_counter = 0

  ! Variables are not initialised automatically.
  cOuNtEr = 1
  pi = 3.14159265
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
