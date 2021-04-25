.. _lammps_on_dilhan:

======================================
About the LAMMPS install on Dilhan
======================================

This page contains information related to the installation of LAMMPS on Dilhan. Some of this is relevant also for self-compilation of the code, for those who want to give this a try.


LAMMPS on Dilhan
-------------------------

You will notice numerous LAMMPS modules in Dilhan

.. code-block:: bash

        module avail lammps

The default LAMMPS module, follows the standart ``cmake`` procedure in the `LAMMPS manual <https://lammps.sandia.gov/doc/Build_cmake.html>`_ . As an example, the following is how the `lammps/intel20.1-openmpi4/stable-270221``` binary is compiled

.. code-block:: bash

        module load compilers/intel/20.2 openmpi/intel/4.1.0-intel20 tools/cmake/3.19.6
        git clone -b unstable https://github.com/lammps/lammps.git lammps-stable
        mkdir lammps-stable/build
        cd lammps-stable/build
        CC=mpicc CXX=mpic++ FC=mpif90 cmake ../cmake -D BUILD_MPI=on -D BLAS_LIBRARIES="-L${MKLROOT}/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm -ldl" -D LAPACK_LIBRARIES="-L${MKLROOT}/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm -ldl" -D PKG_BODY=yes -D PKG_CLASS2=yes -D PKG_DIPOLE=yes -D PKG_MANYBODY=yes -D PKG_MC=yes -D PKG_LATTE=yes -D PKG_MLIAP=yes -D PKG_SNAP=yes -D PKG_SPIN=yes -D PKG_PYTHON=yes -D PKG_USER-MOLFILE=yes -D PKG_USER-PHONON=yes -D PKG_USER-REAXC=yes  -D PKG_KSPACE=yes -D PKG_USER-MEAMC=yes -D PKG_USER-PLUMED=yes -D PKG_USER-SMTBQ=yes -D PKG_USER-DIFFRACTION=yes -D FFT=MKL
        make




