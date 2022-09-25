#!/usr/bin/make -f

.PHONY: build build_test clean default docs run test

ifeq '' '$(findstring ifort,$(FC))'
  use_intel =
else
  use_intel = yes
endif

# Fortran project.
LINK.o = $(LINK.f)

ifdef DEBUG
  builddir = build/debug
else
  builddir = build/release
endif

app_sources := $(wildcard app/*.f90)
src_sources := $(wildcard src/*.f90)
test_sources := $(wildcard test/*.f90)
all_sources := $(app_sources) $(src_sources) $(test_sources)

app_objects := $(patsubst %.f90, $(builddir)/%.o, $(app_sources))
src_objects := $(patsubst %.f90, $(builddir)/%.o, $(src_sources))
test_objects := $(patsubst %.f90, $(builddir)/%.o, $(test_sources))

main := $(builddir)/app/main
check := $(builddir)/test/check

## Language independent flags.

# Always add debug symbols.
CPPFLAGS += -g

# Optimisation.
ifdef DEBUG
  CPPFLAGS += -O0
else
  CPPFLAGS += -O3
  # Optimise for build machine.
  CPPFLAGS += -march=native

  ifneq 'yes' '$(use_intel)'
    # Only use some floating point optimisations.
    CPPFLAGS += -ffast-math
  endif
endif

# Produce optimisation information.
ifeq 'yes' '$(use_intel)'
  CPPFLAGS += -diag-enable=vec
  CPPFLAGS += -qopt-report-phase=vec
  CPPFLAGS += -qopt-report=5
else
  CPPFLAGS += -fdump-tree-optimized
endif

## C flags.

# Warn a lot.
CFLAGS += -Wfloat-equal
CFLAGS += -Wformat=2
CFLAGS += -Wpointer-arith
CFLAGS += -Wshadow
CFLAGS += -Wwrite-strings

# C++ flags.

# Warn a lot.
ifeq 'yes' '$(use_intel)'
  CPPFLAGS += -warn all
else
  CPPFLAGS += -Wall
  CPPFLAGS += -Wcast-align
  CPPFLAGS += -Wconversion
  CPPFLAGS += -Wextra
  CPPFLAGS += -Wfatal-errors
  CPPFLAGS += -Wpedantic
  CPPFLAGS += -Wshadow
  CPPFLAGS += -Wunreachable-code
endif

## Fortran flags.

# Use build directory for output module file.
ifeq 'yes' '$(use_intel)'
  FFLAGS += -module $(builddir)
else
  FFLAGS += -J$(builddir)
endif

## Internal dependencies.

LDLIBS += $(src_objects)

## Build commands

default: build

all: build test docs

run: build
	$(main)

test: build_test
	$(check)

build: $(src_objects) $(app_objects) $(main)

build_test: $(src_objects) $(test_objects) $(check)

$(builddir)/%.o: %.f90
	mkdir -p "$(@D)"
	${FC} ${CPPFLAGS} ${FFLAGS} -Wa,-ahl=$(builddir)/$*.lst -c -o $@ $?

docs: $(builddir)/docs/html/index.html

$(builddir)/docs/html/index.html: Doxyfile $(all_sources)
	mkdir -p "$(@D)"
	env DOXYGEN_OUTPUT_DIRECTORY="$(@D)/.." doxygen Doxyfile

clean:
	-$(RM) -r $(builddir)
