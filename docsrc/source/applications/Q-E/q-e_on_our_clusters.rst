.. _q-e_on_our_cluster:

========================================================
Quantum Espresso in our cluster
========================================================

This page contains information related to the installation of Quantum Espresso on our group cluster. Some of this is relevant also for self-compilation of the code, for those who want to give this a try.


Quantum Espresso on our group cluster
----------------------------------------

Note that the Quantum Espresso installation on our group cluster mainly follows the standard syntax introduced by the Quantum-Espresso team with their new installation scheme. Based on their system, we have added two binaries - as commented under.

If you do

.. code-block:: bash

        module avail q-e

on our group cluster, you will notice that, there are a number of available vasp modules. This might appear confusing.


First; each module is optimised for a particular workstation. For example ``JRTI/Q-E/nvhpc-21.3/7.0`` is optimized for
:ref:`Just Read The Instructions <about_JRTI>`. Second, ``nvhpc`` indicates it is compiled with Nvidia HPC compilers. Third ``7.0`` is the version of Quantum Espresso, and ``openACC`` indicates it is compiled with openACC accellaration (with GPUs).  All versions of Quantum Espresso is compiled with the support for maximally-localised Wannier functions and the Wannier90 program and also the MPI flag in FPP (-DMPI)

Quantum Espresso Best Practices using GPUs
-------------------------------------------

Please read the `MAX webinar on how to use Quantum Espresso on new GPU based HPC systems <http://www.max-centre.eu/webinar/how-use-quantum-espresso-new-gpu-based-hpc-systems>`_

The presentation slides are available `also here <../files/QE_on_gpu.pdf'>`_

Some highlights:

  * **1MPI process perGPU,**
  * CPU cores can (must!) be exploited with OpenMP parallelism
  * Pool parallelism is very effective, but requires memory
  * The dense eigenvalue problem is solved on 1 GPU, use the serial eigensolver.
  * Check the Wiki, it’s updated with a collaborative effort!
  * More details: P. Giannozzi et al. J. Chem. Phys. 152, 154105 (2020)

In carbon, GPU enabled Q-E installs use NVHPC compilers.

.. include:: ../files/job_q-e-gpu.sh
     :literal:


About memory allocation for Quantum Espresso
------------------------------------------------

Quantum Espresso is known to be potentially memory demanding. Quite often, you might experience to use less than the full number of cores on the node, but still all of the memory.

For core-count, node-count and amounts of memory on our group cluster, see :ref:`workstations`.

There are two important considerations to make:

Make sure that you are using the SBATCH --exclusive flag in your run script.
