#!/usr/bin/env -S make -f

FC = gfortran

default:
	$(FC) hello.f90 -o hello

run:
	./hello
