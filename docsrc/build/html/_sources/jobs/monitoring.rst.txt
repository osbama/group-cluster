.. _monitoring_jobs:

Monitoring your jobs
====================

SLURM commands
--------------

To monitor your jobs, you can use of of those commands. For details run them
with the `-`-help option:

``scontrol show jobid -dd <jobid>`` lists detailed information for a job (useful for troubleshooting).

``sacct -j <jobid> --format=JobID,JobName,MaxRSS,Elapsed`` will give you
statistics on completed jobs by jobID. Once your job has
completed, you can get additional information that was not available during
the run. This includes run time, memory used, etc.

..
  From our monitoring tool Ganglia, you can watch live status information on our group cluster:
  *  `Load situation <http://carbon.physics.metu.edu.tr/ganglia/>`_



CPU load and memory consumption of your job
-------------------------------------------

Our cluster has only limited resources and usually a high demand.
Therefore using the available resources as efficient as possible is paramount to have short queueing times
and getting most out of your quota.





