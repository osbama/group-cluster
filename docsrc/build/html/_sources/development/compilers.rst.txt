

Compilers
=========

In addition to standard gcc compiler suite provided by the CentOs, our group cluster has 
Intel Cluster Studio XE and NVIDIA HPC (PGI) compilers installed. 

The performance and stability of these compilers depend heavily on the program. For example, 
VASP 6 works better with PGI compilers thanks to close collaboration with NVIDIA, on the other
hand Quantum Espresso seems not to like PGI compilers, and work much more reliably with Intel 
compilers.



Usage of the Intel ifort compiler
---------------------------------------------------------------------------------

You need to load appropiate intel compiler module listed under */share/apps/intel/modulefiles* (i.e. ``module load compiler/latest``).

For plain Fortran codes (all Fortran standards) the general form
for usage of the Intel ifort compiler is as follows::

  $ ifort [options] file1 [file2 ...]

where options represents zero or more compiler options, and fileN is a
Fortran source (.f .for .ftn .f90 .fpp .F .FOR .F90 .i .i90), assembly
(.s .S), object (.o), static library (.a), or an other linkable file.
Commonly used options may be placed in the ifort.cfg file.

The form above also applies for Fortran codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <https://en.wikipedia.org/wiki/OpenMP>`_); you only have to
select the necessary compiler options for OpenMP.

For Fortran codes parallelized with MPI the general form is quite
similar, you just need to add the appropiate mpi module on top of the intel compiler module (i.e. ``module load openmpi/intel/4.1.0-intel20``)::

  $ mpif90 [options] file1 [file2 ...]

The wrapper mpif90 is using the Intel ifort compiler and invokes all the
necessary MPI machinery automatically for you.  Therefore, everything else is
the same for compiling MPI codes as for compiling plain Fortran codes.



Usage of the Intel C/C++ compilers
---------------------------------------------------------------------------------

You need to load appropiate intel compiler module as described above.

For plain C/C++ codes the general form for usage of the Intel
icc/icpc  compilers are as follows::

  $ icc  [options] file1 [file2 ...]  # for C
  $ icpc [options] file1 [file2 ...]  # for C++

where options represents zero or more compiler options, fileN is a
C/C++ source (.C .c .cc .cpp .cxx .c++ .i .ii), assembly (.s .S), object
(.o), static library (.a), or other linkable file. Commonly used options
may be placed in the icc.cfg file (C) or the icpc.cfg (C++).

The form above also applies for C/C++ codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <https://en.wikipedia.org/wiki/OpenMP>`_); you only have to
select the necessary compiler options for OpenMP.

For C/C++ codes parallelized with MPI the general form is quite
similar, you just need to add the appropiate mpi module on top of the intel compiler module:::

  $ mpicc [options] file1 [file2 ...]  # for C when using OpenMPI
  $ mpiCC [options] file1 [file2 ...]  # For C++ when using OpenMPI

Both mpicc and mpiCC are using the Intel compilers, they are just
wrappers that invoke all the necessary MPI machinery automatically for
you. Therefore, everything else is the same for compiling MPI codes as
for compiling plain C/C++ codes.

Usage of the NVIDIA (PGI) compilers
---------------------------------------------------------------------------------

This is essentially the same as Intel compilers, just load the appropiate modules, and replace ifort/icc/icpc by pgfortran/pgcc/pgc++.
Please note that NVHPC compilers come with their own openmpi. If you want to disable it, or override it with the our group cluster provided openmpi, load the corresponding modules.

