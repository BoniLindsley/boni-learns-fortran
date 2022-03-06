# boni-learns-fortran

Steps:

1.  Install Fortran.
    Use system package manager. For example,
    1.  Debian: `apt install --no-install-recommends gfortran`.
        From <https://packages.debian.org/sid/gfortran>.
    2.  Windows MSYS2: `pacman -S mingw-w64-x86_64-gcc-fortran`.
        Make sure appropriate `bin` directory is in path.
        From <https://packages.msys2.org/package/mingw-w64-x86_64-gcc-fortran?repo=mingw64>.
2.  Install Fortran package manager
    ([fpm](https://github.com/fortran-lang/fpm)).
    Basic idea is to clone `https://github.com/fortran-lang/fpm.git`
    and run `install.sh`.
    The script uses `./build/bootstrap` to download and build fpm.
    Default single binary output is `${HOME}/.local/bin/fpm`.
3.  Create [first project](https://fpm.fortran-lang.org/en/tutorial/hello-fpm.html).
    Basic idea:
    ```sh
    fpm new learn-fortran
    cd learn-fortran
    fpm build
    fpm test
    fpm run
    ```
    Edit project metadata in `fpm.toml`.
4.  Learn Fortran from <https://fortran-lang.org/learn/quickstart>.
    Edit `app/main.f90` to follow tutorial.
