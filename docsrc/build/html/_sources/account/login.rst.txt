.. _login:

=============================
Logging in for the first time
=============================


Log in with SSH
===============

An *SSH* client (Secure SHell) is the required tool to connect to our group workstations. An *SSH* client provides secure encrypted communications between two hosts over an insecure network.

If you already have *ssh* installed on your UNIX-like system, have a user account and password on a Notur system, login may be as easy as typing

::

 ssh <machine name>         (for instance: ssh carbon.physics.metu.edu.tr)

into a terminal window.

If your user name on the machine differs from your user name on the local machine, use the -l option to specify the user name on the machine to which you connect. For example:

::

 ssh <machine name> -l [username]

And if you need X-forwarding (for instance, if you like to run Emacs in it's own window) you must log in like this:

::

 ssh -X -Y <machine name>

No matter how you login, you will need to confirm that the connection shall be trusted. The SHA256 key fingerprint of ``carbon.physics.metu.edu.tr`` is:

::

 SHA256:QiMKNx7rHlw/0Vv1bbi2yvWWV4+HQ2s5NknyajDxyHc

So you should get precisely this message the first time you login via ssh:

::

 The authenticity of host 'carbon.physics.metu.edu.tr' can't be established.
 RSA key fingerprint is SHA256:QiMKNx7rHlw/0Vv1bbi2yvWWV4+HQ2s5NknyajDxyHc
 Are you sure you want to continue connecting (yes/no)?

If you see this message with precisely this code, you can continue by typing ``yes`` and pressing *Enter*. If you connect to dilhan for the first time and ssh does *not* show you this key, please contact mbaris@metu.edu.tr immediately.



SSH clients for Windows and Mac
-------------------------------

At the `OpenSSH page <https://www.openssh.com>`_ you will find several *SSH* alternatives for both Windows and Mac.

Please note that Mac OS X comes with its own implementation of *OpenSSH*, so you don't need to install any third-party software to take advantage of the extra security *SSH* offers. Just open a terminal window and jump in.


Learning more about SSH
-----------------------

To learn more about using SSH, please also consult the `OpenSSH page <https://www.openssh.com>`_ page and take a look at the manual page on your system (*man ssh*).



Obtain a new password
=====================

When you have been granted an account on our group cluster, your username and password is sent to you separately.



**Important:**

If you are connecting from outside the networks of METU, you need to log into ODTU VPN
