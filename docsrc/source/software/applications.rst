

Which software is installed on our cluster
===============================================

To find out what software packages are available, type::

  module avail

Notice that some software have multiple copies. These are the variants of that software optimized for a particular workstations' hardware


Changes in application software
---------------------------------

The easiest way to check which software and versions available is to use
the  ``module`` command.
List all software available::

  module avail

List all version of a specific software::

  module avail software-name


Missing or new software
==========================
In order to request a software installed system-wide you need to:
-Explain how many *other* users will use this software
-Explain licensing. It is unlikely that a licensed software will be installed system-wide. 



Conda
-------------------

Many software packages, especially if they are python based, can be easily installed using
the Conda package manager.

A small tutorial can be found in the :ref:`python` section of this documentation.
