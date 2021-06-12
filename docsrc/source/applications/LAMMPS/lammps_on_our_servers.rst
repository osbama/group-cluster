.. _lammps_on_our_servers:

===========================================
About the LAMMPS install on our clusters
===========================================

This page contains information related to the installation of LAMMPS on Dilhan. Some of this is relevant also for self-compilation of the code, for those who want to give this a try.


LAMMPS on Carbon
##########################

You will notice numerous LAMMPS modules in Carbon

.. code-block:: bash

        module avail lammps

The default LAMMPS module, follows the standart ``cmake`` procedure in the `LAMMPS manual <https://lammps.sandia.gov/doc/Build_cmake.html>`_ . 

Loading the ``miniconda3`` module and source the environment is mandatory in order to use python environment.



Compilation procedure with Intel compilers
*********************************************

.. note::

   Some packages such as `PLUMED <http://gensoft.pasteur.fr/docs/lammps/12Dec2018/Build_extras.html#user-plumed-package>`_ and `MSCG <http://gensoft.pasteur.fr/docs/lammps/12Dec2018/Build_extras.html#mscg-package>`_ requires GSL. 

   You can install GSL to your user using conda

   .. code-block:: bash

      conda install -c conda-forge gsl 


.. code-block:: bash

        git clone https://github.com/lammps/lammps.git lammps
        mkdir lammps/build-intel
        cd lammps/build-intel
        module purge
        module load cmake/3.15.4 compiler/latest mkl/latest openmpi/intel/4.1.1-intel21.2
        module load conda/miniconda3
        eval "$(/share/apps/miniconda3/bin/conda shell.bash hook)"
        CC=mpicc CXX=mpic++ FC=mpif90 cmake ../cmake -D BUILD_MPI=on -D BLAS_LIBRARIES="-L${MKLROOT}/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm -ldl" -D LAPACK_LIBRARIES="-L${MKLROOT}/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm -ldl" -D PKG_BODY=yes -D PKG_CLASS2=yes -D PKG_DIPOLE=yes -D PKG_MANYBODY=yes -D PKG_MC=yes -D PKG_LATTE=yes -D PKG_MLIAP=yes -D PKG_SNAP=yes -D PKG_SPIN=yes -D PKG_PYTHON=yes -D PKG_USER-MOLFILE=yes -D PKG_USER-PHONON=yes -D PKG_USER-REAXC=yes  -D PKG_KSPACE=yes -D PKG_USER-MEAMC=yes -D PKG_USER-PLUMED=yes -D PKG_USER-SMTBQ=yes -D PKG_USER-DIFFRACTION=yes -D FFT=MKL
        make


Compilation procedure with PGI compilers
*********************************************

.. note::

   Some packages such as `PLUMED <http://gensoft.pasteur.fr/docs/lammps/12Dec2018/Build_extras.html#user-plumed-package>`_ and `MSCG <http://gensoft.pasteur.fr/docs/lammps/12Dec2018/Build_extras.html#mscg-package>`_ requires GSL. 

   You can install GSL to your user using conda

   .. code-block:: bash

      conda install -c conda-forge gsl 


.. code-block:: bash

        git clone https://github.com/lammps/lammps.git lammps
        mkdir lammps/build-intel
        cd lammps/build-intel
        module purge
        module load cmake/3.15.4 nvhpc/21.3
        module load conda/miniconda3
        eval "$(/share/apps/miniconda3/bin/conda shell.bash hook)"
        CC=mpicc CXX=mpic++ FC=mpif90 cmake ../cmake -D BUILD_MPI=on -D BLAS_LIBRARIES="-lblas" -D LAPACK_LIBRARIES="-llapack" -D PKG_BODY=yes -D PKG_CLASS2=yes -D PKG_DIPOLE=yes -D PKG_MANYBODY=yes -D PKG_MC=yes -D PKG_LATTE=yes -D PKG_MLIAP=yes -D PKG_SNAP=yes -D PKG_SPIN=yes -D PKG_PYTHON=yes -D PKG_USER-MOLFILE=yes -D PKG_USER-PHONON=yes -D PKG_USER-REAXC=yes  -D PKG_KSPACE=yes -D PKG_USER-MEAMC=yes -D PKG_USER-PLUMED=yes -D PKG_USER-SMTBQ=yes -D PKG_USER-DIFFRACTION=yes L
        make






