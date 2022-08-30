.. _first_time_q-e:

================================================
First time you run a Quantum Espresso job?
================================================

This page contains info aimed at first time
users of Quantum Espresso on in one of our workstations, but may also be useful to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.


If you want to run this testjob, download the copies of the scripts and put them
into your test job folder (which I assume you have created in advance).

Quantum Espresso Tutorial
----------------------------------

Let's do the basics of ``pw.x`` in the
`Q-E tutorial <http://www.fisica.uniud.it/~giannozz/QE-Tutorial/handson_pwscf.pdf>`_

.. note::

  It is better you do the tutorial in your own PC, since they are very "light"
  calculations, and you will not need to wait for resources. You can easily install
  Quantum Espresso to your own pc using `Anaconda <https://anaconda.org/conda-forge/qe>`_
  by

  ``conda install -c conda-forge qe``


Download the tarred job :download:`handson_pwscf.tar.gz <../files/handson_pwscf.tar.gz>`.

move this file to your test job folder and type

.. code-block:: bash

   tar -zxf handson_pwscf.tar.gz

The instructions you need to follow are in `handson_pwscf.pdf`. These examples
are designed to be run interactively. If you want to do this in our cluster,
you need to reserve yourself an interactive job :ref:`interactive`


Quantum Espresso Production Test Job
-------------------------------------

In this example, we will run one of the basic Quantum Espresso examples

Download the tarred job :download:`qe-example-job.tar.gz <../files/qe-example-job.tar.gz>`.

This is a simple ``pw.x`` run for the Silicon. It should run very fast and minimal resources

Upload this to your home directory, and untar the file

.. code-block:: bash

   tar -zxf qe-example-job.tar.gz
   cd qe-example-job

Please inspect the ``pw.x`` input file to see the structure. The pseudopotential
is already included in this example in the `pseudo` directory. However, you are
encouraged to check out the `Standart Solid State PPs <https://www.materialscloud.org/discover/sssp/table/efficiency>`_
In Carbon, `pslibrary` pseudo potentials can be reached from `/share/apps/pslibrary1.0.0`

Next, you need to create a job script in this directory. You can use the example
script here :download:`job_q-e.sh <../files/job_q-e.sh>`.

.. code-block:: bash

   sbatch job_q-e.sh

This script will ask for shared 4 cpus in :ref:`Triumphant Coal <about_triumphant-coal>`. Copy the files
in the example directory to the local scratch (which is much much faster), and finaly
copy the results back to where it was launched in a `.tar.gz` archive.

Feel free to modify the job script for your needs.

.. include:: ../files/job_q-e.sh
   :literal:

See :ref:`Quantum Espresso in our cluster <q-e_on_our_cluster>` for further details, tips and tricks.
