

Running MPI jobs
================

There are several available MPI implementations on our group cluster:

- OpenMPI provided by the ``openHPC`` module, e.g. ``module load openmpi3/3.1.4``
- OpenMPI provided by the ``nvHPC`` module, e.g. ``module load nvhpc/21.3``
- OpenMPI compiled for the ``intel`` module, e.g. ``module load openmpi/3.1.4/intel``
- Intel MPI provided by the ``intel`` module, e.g. ``module load mpi/latest``

There are several ways of launching an MPI application within a SLURM
allocation, e.g. ``srun``, ``mpirun``, ``mpiexec`` and ``mpiexec.hydra``.
Unfortunately, the best way to launch your program depends on the MPI
implementation (and possibly your application), and choosing the wrong command
can severly affect the efficiency of your parallel run. Our recommendation is
the following:

Intel MPI
---------

With Intel MPI, we have found that ``mpirun`` can incorrectly distribute the
MPI ranks among the allocated nodes. We thus recommend using ``srun``::

    $ srun --mpi=pmi2 ./my_application

OpenMPI
-------

With OpenMPI, ``mpirun`` seems to be working correctly. Also, it seems that
``srun`` fails to launch your application in parallel, so here we recommend
using ``mpirun``::

    $ mpirun ./my_application


