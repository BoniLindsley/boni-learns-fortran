program hello
  ! Bring names from other modules into scope.
  ! Use => to map from a different name.
  use, intrinsic :: iso_fortran_env, only: sp => real32, real64
  use, intrinsic :: iso_c_binding, only: c_float, c_double

  implicit none ! Require variable declaration before use.

  ! Variable declarations come before "body".
  integer :: counter
  real :: half
  real(sp) :: short_pi ! Explicit "kind" precision.
  real(real64) :: long_pi
  real(c_float) :: short_e
  real(c_double) :: long_e
  complex :: two_dimensional
  character :: a_letter
  logical :: no
  logical :: yes

  ! Arrays
  integer, dimension(8) :: eight_numbers_to_sort
  integer, dimension(3, 3) :: tic_tac_toe_grid
  integer :: ten_numbers_to_sort(10) ! Same as (1:10)
  integer :: weights_on_swing(-5:5) ! 11 elements
  integer :: chess_grid(8, 8)
  integer, allocatable :: origin(:)
  integer, allocatable :: upper_triangular_matrix(:, :)

  ! "Static" variable. Persists between function calls.
  integer :: call_counter = 0

  ! Variables are not initialised automatically.
  cOuNtEr = 1
  half = 0.5
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

  eight_numbers_to_sort = [1, 6, 2, 3, 5, 8, 7, 4]
  ten_numbers_to_sort = [(counter*2, counter=1, 10)] ! [2, 4, ..., 20]

  ! -5,-4,-3,-2,-1, 0, 1, 2, 3, 4, 5
  ! [?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?]
  weights_on_swing(:) = 0
  ! [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  weights_on_swing(5) = 60
  ! [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,60]
  weights_on_swing(-2) = 30
  ! [0, 0, 0,-2, 0, 0, 0, 0, 0, 0, 0]

  ! Not sure how to construct a 2D arrays directly.
  tic_tac_toe_grid(:, :) = 0
  chess_grid(1, :) = [5, 3, 3, 9, 40, 3, 3, 5]
  chess_grid(2, :) = 1
  chess_grid(3:6, :) = 0
  chess_grid(7, :) = [1, 1, 1, 1, 1, 1, 1, 1]
  chess_grid(8, :) = [5, 3, 3, 9, 40, 3, 3, 5]

  allocate (origin(3))
  allocate (upper_triangular_matrix(2, 2))
  origin = [0, 0, 0]
  upper_triangular_matrix(:, 1) = [1, 0]
  upper_triangular_matrix(:, 2) = [2, 1]
  deallocate (origin)
  deallocate (upper_triangular_matrix)

  ! (File handle, format specifier)
  ! If asterisk, use STDIN/STDOUT and "auto convert"
  write (*, *) 'You have ', 'found letters ', a_letter, ' and', yes
  write (*, *) 'Pick one.'
  read (*, *) a_letter
  ! Wrapper for STDOUT.
  print *, 'New letter is ', a_letter
end program hello
