.. _VASP:

==========================================
VASP (Vienna Ab initio Simulation Package)
==========================================

Information regarding the Vienna Ab initio Simulation Package (VASP) installed on Dilhan. 

This package is only available to select users


Related information
===================

.. toctree::
   :maxdepth: 1

   firsttime_vasp.rst
   vasp_on_our_clusters.rst


General information
===================

Description
-----------

VASP is a complex package for performing ab-initio quantum-mechanical molecular dynamics (MD) simulations using pseudopotentials or the projector-augmented wave method and a plane wave basis set. The approach implemented in VASP is based on the (finite-temperature) local-density approximation with the free energy as variational quantity and an exact evaluation of the instantaneous electronic ground state at each MD time step.

VASP uses efficient matrix diagonalisation schemes and an efficient Pulay/Broyden charge density mixing. These techniques avoid all problems possibly occurring in the original Car-Parrinello method, which is based on the simultaneous integration of electronic and ionic equations of motion.

The interaction between ions and electrons is described by ultra-soft Vanderbilt pseudopotentials (US-PP) or by the projector-augmented wave (PAW) method. US-PP (and the PAW method) allow for a considerable reduction of the number of plane-waves per atom for transition metals and first row elements. Forces and the full stress tensor can be calculated with VASP and used to relax atoms into their instantaneous ground-state.


Online information from vendor
------------------------------

* Homepage: https://www.vasp.at
* Documentation: https://cms.mpi.univie.ac.at/wiki/index.php/The_VASP_Manual


License and access policy
-------------------------

The VASP license is proprietary and commercial. It is based on group license policy, and for NOTUR systems VASP packages falls in the "bring your own license" category. See :ref:`About_licenses`.

The Vasp program is not distributed via site licences. 

VASP is a commercial software package that requires a license for all who wants use it. To run VASP:

#. Your group must have a valid licence. To acquire a licence, please consult this link: https://www.vasp.at/index.php/faqs/71-how-can-i-purchase-a-vasp-license.

#. We need to get a confirmation from a VASP representative to confirm that you have access to the license. Your group representative needs to contact Dr. Doris Vogtenhuber (doris.vogtenhuber@univie.ac.at) from the VASP team and ask her to send a confirmation email to us (support@metacenter.no) to confirm that you have a valid licence. Once we get a confirmation email we will grant you access to run VASP.


Citation
---------

When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citation(s).

Usage
=====

You load the application by typing:

.. code-block:: bash

    $ module load VASP

This command will give you the default version.

For more information on available versions, type:

.. code-block:: bash

    $ module avail VASP

Experiencewise, VASP is a rather memory intensive code. Users are advised to read up on the general job script example(s) for SLURM and Dilhan, and also how to specify memory in `SLURM <https://slurm.schedmd.com>`_.


About the VASP version(s) installed on Our Cluster
----------------------------------------------------------

See :ref:`vasp_on_our_cluster`.

