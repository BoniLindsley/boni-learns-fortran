#!/usr/bin/env -S make -f

FC = gfortran

default:
	$(FC) -Wall hello.f90 -o hello

run:
	./hello
