
Storage and backup
==================


Available file system
---------------------


+------------------------+------------+----------------------------+----------+
| Mount point            | size       | redundancies               | Erased?  |
+========================+============+============================+==========+
| /home, /share, /data   | 4 Tb       |  ZFS mirror                | No       |
+------------------------+------------+----------------------------+----------+
| $HOME/mnt/$USER        | 24 Tb      |  BTRFS mirror, Recycle bin | No       |
+------------------------+------------+----------------------------+----------+
| /shared_scratch        | 24 Tb      |  BTRFS mirror              | Periodic |
+------------------------+------------+----------------------------+----------+
| /scratch /scratch1 ..  | 1 Tb       | none                       | Periodic |
+------------------------+------------+----------------------------+----------+


Home area
---------

The file system for user home directories on our group cluster. It is a 4 TB global file
system, which is accessible from both the login nodes and all the compute
nodes. You'll likely have a quota on this system. It is not
possible to extend the size. If you need more space, consider using
NAS mounted ``$HOME/mnt/$USER``.

The home area is for "permanent" storage only, so please do not use it for
temporary storage during production runs. Jobs using the home area for scratch
files while running may be killed without any warning.


Work/scratch areas
------------------

.. warning::
   In all scratch areas, auto cleanup affecting all files
   older than 21 days will be implemented.



There is no backup of files stored.




Closing of user account
-----------------------

User accounts on our group cluster are closed on request from department or the
project leader. The account is closed in a way so that the user no
longer can log in.


Privacy of user data
--------------------

General privacy

There is a couple of things you as a user, can do to minimize the risk
of your data and account on our group cluster being read/accessed from the outside
world.

#. Your account on our group cluster is personal, do not give away your password to
   anyone.
#. If you have configured ssh-keys on your local computer, do not use
   passphrase-less keys for accessing our group cluster.

By default a new account on our group cluster is readable for everyone on the
system. 

This can easily be change by the user using the command chmod The chmod
have a lot "cryptic" combinations of options (`click here for a more in
depth explanation <https://en.wikipedia.org/wiki/Chmod>`_ ). the most
commonly used is:

*  only user can read their home directory::

      chmod 700 /home/$USER

*  User and their group can read and execute files on the home directory::

      chmod 750 /home/$USER

*  User and all others including the group can read and execute the files::

      chmod 755 /home/$USER

*  everybody can read, execute, and WRITE to directory::

      chmod 777 /home/$USER



Management of many small files (> 10000)
----------------------------------------

The file system on our group cluster is designed to give good performance for large
files. This have some impact if you have many small files.

If you have thousands of files in one directory. Basic operations like
'ls' becomes very slow, there is nothing to do about this. However
directories containing many files may cause the backup of the data to
fail. It is therefore highly recommended that if you want backup of the
files you need to use 'tar' to create on archive file of the directory.


.. _file_compression:

Compression of data
-------------------

Data which is not accessed frequently like results of finished projects
should be compressed in order to reduce storage space.

We recommend ``gzip`` and ``tar`` to compress single files or whole folder
structures. To compress a single file::

  $ gzip file

To decompress::

  $ gzip --decompress file

To create a archive multiple files or folder::

  $ tar czvf archive.tar.gz files

It is recommended to use the file suffix ``.tar.gz`` to make it clear
that archive was compressed with ``gzip``.

To extract a archive (use ``-C folder`` to extract the files in
folder)::

  $ tar zxvf archive.tar.gz


Binary data and endianness
--------------------------

our group cluster is like all desktop PCs a little endian computer.

The best work around for file compatibility is to save your file in a portable file
format like `netCDF <https://www.unidata.ucar.edu/software/netcdf/>`_ or
`HDF5 <https://www.hdfgroup.org/>`_.

Both formats are supported on our group cluster, but you have to load its modules
to use them::

  $ module load netCDF

Or::

  $ module load HDF5
