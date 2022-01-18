.. _q-e:

==========================================
Quantum Espresso 
==========================================

Information regarding the Quantum Espresso installed on our clusters. 



Related information
===================

.. toctree::
   :maxdepth: 1

   firsttime_q-e.rst
   q-e_on_our_clusters.rst


General information
===================

Description
-------------

Quantum ESPRESSO is an integrated suite of Open-Source computer codes for electronic-structure calculations and materials modeling at the nanoscale. It is based on density-functional theory, plane waves, and pseudopotentials.

Online information
------------------------------

* Homepage: https://www.quantum-espresso.org/
* Documentation: https://www.quantum-espresso.org/resources/users-manual
* Tutorials: https://www.quantum-espresso.org/resources/tutorials


Citation
---------

When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citation(s).

Usage
=====

You load the application by typing:

.. code-block:: bash

    $ module load JRTI/Q-E/nvhpc-21.3/7.0

This command will give you the default version.

For more information on available versions, type:

.. code-block:: bash

    $ module avail q-e

Experiencewise, Quantum Espresso is a rather memory intensive code. Users are advised to read up on the general job script example(s) for SLURM, and also how to specify memory in `SLURM <https://slurm.schedmd.com>`_.


About the Quantum Espresso version(s) installed on Our Cluster
---------------------------------------------------------------------

See :ref:`q-e_on_our_cluster`.

