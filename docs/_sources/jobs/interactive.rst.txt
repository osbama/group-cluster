.. _interactive:

Interactive jobs
================

Starting an interacitve job
---------------------------

You can run an interactive job like this::

  $ srun -n <threads> --partition <machine_name> --time=01:00:00 --pty bash -i

Here we ask for *threads* number of threads in workstation *machine_name* for one hour with the
default amount of memory. The command prompt will appear as soon as
the job starts.

This is how it looks once the interactive job starts::

  srun: job 12345 queued and waiting for resources
  srun: job 12345 has been allocated resources

Exit the bash shell to end the job. If you exceed the time or memory
limits the job will also abort.

Interactive jobs have the same policies as normal batch jobs, there
are no extra restrictions.

By defult, the node allocation is `exclusive` i.e. the node is allocated exclusively
for one job. You can share the node among multiple jobs by asking for oversubscription

Allowing/asking oversubscription::

  $ srun --ntasks=4 --time=12:00:00 --partition=forever-diamond --oversubscribe --pty bash -i

Here you are asking only 4 cpus from `forever-diamond`, and the rest is open for
sharing. You should be aware that you when you are sharing the node with other
users, since no hard memory limits are implemented in our cluster, you need to
take care to play nice.


Keeping interactive jobs alive
------------------------------
Interactive jobs die when you disconnect from the login node either by choice or by
internet connection problems. To keep a job alive you can use a terminal multiplexer
like ``tmux``.

tmux allows you to run processes as usual in your standard bash shell

You start tmux on the login node before you get a interactive slurm session with
``srun`` and then do all the work in it. In case of a disconnect you simply reconnect
to the login node and attach to the tmux session again by typing::

  tmux attach

or in case you have multiple session running::

  tmux list-session
  tmux attach -t SESSION_NUMBER

As long as the tmux session is not closed or terminated (e.g. by a server restart) your
session should continue.

To log out a tmux session without closing it you have to press CTRL-B (that the Ctrl key
and simultaneously "b", which is the standard tmux prefix) and then "d" (without the
quotation marks). To close a session just close the bash session with either CRTL-D or
type exit. You can get a list of all tmux commands by CTRL-B and the ? (question mark).
See also `this page <https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/>`_
for a short tutorial of tmux.

Otherwise working inside of a tmux session is almost the same as a normal bash session.
