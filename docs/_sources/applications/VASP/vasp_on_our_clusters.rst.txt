.. _vasp_on_our_cluster:

=========================================
About the VASP install on our cluster
=========================================

This page contains information related to the installation of VASP on our group cluster. Some of this is relevant also for self-compilation of the code, for those who want to give this a try.


VASP on our group cluster
------------------------------------

Note that the VASP installation on our group cluster mainly follows the standard syntax introduced by the vASP team with their new installation scheme. Based on their system, we have added two binaries - as commented under.

If you do

.. code-block:: bash

        module avail VASP

on our group cluster, you will notice that, there are a number of available vasp modules. This might appear confusing.


First; each module is optimised for a particular workstation. For example ``triumphant-coal/vasp/nvhpc/6.1-openACC`` is optimized for
:ref:`Triumphant Coal <about_triumphant-coal>`. Second, ``nvhpc`` indicates it is compiled with Nvidia HPC compilers. Third ``6.1`` is the version of VASP, and ``openACC`` indicates it is compiled with openACC accellaration (with GPUs).  All versions of VASP is compiled with the support for maximally-localised Wannier functions and the Wannier90 program and also the MPI flag in FPP (-DMPI)


There are 3 different binaries in each VASP module, all compiled with the same FPP settings (mentioned below):

* vasp_std
* vasp_gam
* vasp_ncl


FPP settings for each binary
----------------------------

#. vasp_std is compiled with the following additional FPP flag(s): -DNGZhalf, it is the "standard" vasp binary. 
#. vasp_gam is compiled with the following additional FPP flag(s): -DNGZhalf -DwNGZhalf, it has optimizations for Gamma point only calculations
#. vasp_ncl is compiled with the following additional FPP flag(s): no modifcations in FPP settings, it is intended for non-collinear calculations. 

We would be happy to provide a copy of our build scripts (patches) upon request.

About memory allocation for VASP
--------------------------------

VASP is known to be potentially memory demanding. Quite often, you might experience to use less than the full number of cores on the node, but still all of the memory.

For core-count, node-count and amounts of memory on our group cluster, see :ref:`workstations`.

There are two important considerations to make:

Make sure that you are using the SBATCH --exclusive flag in your run script.



