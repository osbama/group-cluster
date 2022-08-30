.. _getting_started:

===============
Getting started
===============

Here you will get the basics to work with our group's workstations. Please study carefully the links at the end of each paragraph to get more detailed information.

Get an account
--------------

If you are elligible for an account, you may apply locally. :doc:`/account/account`



Connect to our workstations
-----------------

You may connect to our group workstations via *SSH* to ``carbon.physics.metu.edu.tr``. This means that on Linux and OSX you may directly connect by opening a terminal and writing ``ssh username@carbon.physics.metu.edu.tr``. From Windows, you may connect via a dedicated application like PuTTY, or using the Windows Subsytem for Linux (WSL) . X-forwarding for graphical applications is possible. There exists also methods to allow easy graphical file transfer. Please see the following link for details to all mentioned methods. :doc:`/account/login`

On nodes and files
------------------

When you login, you will be on a login node. Do *not* run any long-lasting programs here, or you risk your account being banned. The login node shall only be used for job preparation (see below) and simple file operations.

You will also be in your home directory ``/home/username``. This is accessible to all workstations.  This space is **not** backed up. Please remove old files regularly. :doc:`/storage/storage`

To move files from your computer to Dilhan or vice versa, you may use any tool that works with *ssh*. On Linux and OSX, these are scp, rsync, or similar programs. On Windows, you may use WinSCP. :doc:`/storage/file_transfer`

Run a program
-------------

There are many programs pre-installed. You may get a list of all programs by typing ``module avail``. You can also search within that list. ``module avail Q-E`` will search for Quantum Espresso (case-insensitive). When you found your program of choice, you may load it using ``module load forever-diamond/Q-E/nvhpc/git280822-nvhpc22.7``. All program files will now be available in your path, i.e. you can now simply call ``pw.x`` to run Quantum Espresso PW. You can also compile your own software, if necessary. :doc:`/software/modules`

To eventually run the program, you have to write a job script. In this script, you can define how long the job (i.e. the program) will run and how much memory and compute cores it needs. For the actual computation, you need to learn at least the basics of Linux shell scripting. You can learn some basics here: :doc:`/introduction/linux`.

When you wrote the job script, you can start it with ``sbatch jobscript.sh``. This will put the script in the queue, where it will wait until an appropriate compute node is available. You can see the status of your job with ``squeue -u username``. :doc:`/jobs/batch` and :doc:`/jobs/examples`

Every job that gets started will be charged to your quota. Your quota is calculated in hours of CPU time and is connected to your specific project. 


Happy researching!
