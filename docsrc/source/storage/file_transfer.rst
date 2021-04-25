.. _file_transfer:

=================================================
Transferring files to/from our group cluster
=================================================

Only ssh type of access is open to our group cluster's head node. However, we also have a 
NAS server. To upload or download data to your home directory, scp and sftp can be used. 


Carbon (Head node and home directories) 
=================================================

To transfer data to and from our group cluster's head node use the following address:

::

    carbon.physics.metu.edu.tr

This address has nodes with 10Gb network interfaces.

Basic tools (scp, sftp)

Standard scp command and sftp clients can be used:

::

    ssh carbon.physics.metu.edu.tr
    ssh -l <username> carbon.physics.metu.edu.tr

    sftp carbon.physics.metu.edu.tr
    sftp <username>@carbon.physics.metu.edu.tr

Mounting the file system on you local machine using sshfs
---------------------------------------------------------
For linux users::

    sshfs [user@]carbon.physics.metu.edu.tr:[dir] mountpoint [options]

eg.::

    sshfs steinar@carbon.physics.metu.edu.tr:  /home/steinar/our group cluster-fs/

Windows users may buy and install
`expandrive <https://www.expandrive.com/windows>`_.



rsync
--------------------
The tool `rsync <https://devhints.io/rsync>`_ is also available for transferring files.


Mistake Not... (NAS server) 
=================================================

Our NAS server offers redundant disks, a trash bin, and cloudstation services. You can reach it via `http://mistake-not.quickconnect.to/ <http://mistake-not.quickconnect.to/>`_ 

The files stored in the NAS are accesible in the carbon under ``~/mnt/$USER``. **Warning!** This folder is not accessible to other workstations. 
