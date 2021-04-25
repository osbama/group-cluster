.. _LAMMPS:

=======================================================================
Large-scale Atomic/Molecular Massively Parallel Simulator (LAMMPS)
=======================================================================

LAMMPS is a classical molecular dynamics code with a focus on materials modeling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.  



Related information
===================

.. toctree::
   :maxdepth: 1

   lammps_on_dilhan.rst
   firsttime_lammps.rst


General information
===================

Description
-----------

LAMMPS is a classical molecular dynamics code with a focus on materials modeling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.

LAMMPS has potentials for solid-state materials (metals, semiconductors) and soft matter (biomolecules, polymers) and coarse-grained or mesoscopic systems. It can be used to model atoms or, more generically, as a parallel particle simulator at the atomic, meso, or continuum scale.

LAMMPS runs on single processors or in parallel using message-passing techniques and a spatial-decomposition of the simulation domain. Many of its models have versions that provide accelerated performance on CPUs, GPUs, and Intel Xeon Phis. The code is designed to be easy to modify or extend with new functionality.

LAMMPS is distributed as an open source code under the terms of the GPL. The current version can be downloaded here. Links are also included to older versions. All LAMMPS development is done via GitHub, so all versions can also be accessed there. Periodic releases are also posted to SourceForge.


Online information
------------------------------

* Homepage: https://lammps.sandia.gov/
* Manual: https://lammps.sandia.gov/doc/Manual.html
* Tutorials: https://lammps.sandia.gov/tutorials.html


License and access policy
-------------------------

LAMMPS is distributed as an open source code under the terms of the GPL

Citation
---------

When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citation(s).

Usage
=====

You load the application by typing:

.. code-block:: bash

    $ module load lammps

This command will give you the default version.

For more information on available versions, type:

.. code-block:: bash

    $ module avail lammps


About the LAMMPS version(s) installed on Dilhan
---------------------------------------------------------------

LAMMPS is a constantly evolving software with many subpackages. The compilation of the default version is described in : :doc:`lammps_on_dilhan`.

