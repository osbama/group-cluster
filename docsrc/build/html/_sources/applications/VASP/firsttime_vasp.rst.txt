.. _first_time_vasp:

==============================
First time you run a VASP job?
==============================

This page contains info aimed at first time
users of VASP on in one of our workstations, but may also be useful to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.



If you want to run this testjob, download the copies of the scripts and put them
into your test job folder (which I assume you have created in advance).

VASP input example
------------------

Download the tarred job :download:`CeO2job-files <../files/CeO2.tar.gz>`.

move this file to your test job folder and type

.. code-block:: bash

   tar -zxf CeO2.tar.gz

Then; download the job-script as seen here:

.. include:: ../files/job_vasp.sh
   :literal:

Download it here :download:`job_vasp.sh <../files/job_vasp.sh>`.



