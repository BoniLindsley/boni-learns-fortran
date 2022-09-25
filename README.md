# boni-learns-fortran

A place to store my notes on learning Fortran.

## Install Fortran

### Debian Package Manager

GCC Fortran is available in the Debian official repository:
<https://packages.debian.org/sid/gfortran>

```sh
apt install --no-install-recommends gfortran
```

### Windows MSYS2 Repository

GCC Fortran is available in the MSYS2 official repository
<https://packages.msys2.org/package/mingw-w64-x86_64-gcc-fortran?repo=mingw64>.

```sh
pacman -S mingw-w64-x86_64-gcc-fortran
```

Make sure appropriate `bin` directory is in `%PATH%`
if using from outside a MSYS2 shell.

## Install Fortran Package Manager

The Fortran Package Manager ([fpm](https://github.com/fortran-lang/fpm))
is the currently recommended way to build Fortran applications.

### Windows MSYS2 Repository

fpm is available in the MSYS2 official repository
<https://packages.msys2.org/package/mingw-w64-x86_64-fpm?repo=mingw64>.

```sh
pacman -S mingw-w64-x86_64-fpm
```

### GitHub Source

Basic idea is to clone the GitHub repository and run its install script.
This requires GCC Fortran to already be installed.

```sh
git clone https://github.com/fortran-lang/fpm.git . #
./install.sh
# The script uses `./build/bootstrap` to download and build fpm.
# It produces a single binary output.
ls -l ${HOME}/.local/bin/fpm
```

## First Project

This can be started from the fpm tutorial for a
[first project](https://fpm.fortran-lang.org/en/tutorial/hello-fpm.html).
This requires GCC Fortran and fpm to already be installed.

```sh
fpm new learn-fortran
cd learn-fortran
# Edit project metadata in `fpm.toml`.
fpm build
fpm test
fpm run
```

Learn Fortran from <https://fortran-lang.org/learn/quickstart>.
Edit `app/main.f90` to follow tutorial.
