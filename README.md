cfghist
=======
A tool for creating config history of Linux/UNIX system.

Idea
----
I tend to experiment a lot with my systems and I was looking for a way to save changes to file/few files so those could be relatively easy to reproduce.
There are tools like Ansible that could work resonably well for this use case, but writing whole playbook up front took too much time.
I wanted something that would save my changes after I already made them to my system and tested them.  

Inspiration for creating this tool was `configuration` command of Cisco's iOS. On there you can make changes then save or reject them and go back to previous state.
In this case we are using ZFS snapshots for that.  

How it works?
-------------
- First, a snapshot is created before any changes are made
- Then we get normal bash shell, but every command that is run is saved to current config file
- There is also `edit` command, it creates diff of edited file, so we can track of changes to files too
- When we are done, we need to use `quit` command, it then asks if we want to save changes, create a new snapshot or rollback to clean one

Run commnads are saved in config file, and changes to files are saved with diffs. For now, there is no script for recreating changes from these files, but when there's need for it, I will create one.
For now I am mainly using these scripts for keeping history of made changes, and for creating snapshots of my system so I always have something to rollback to.

Dependencies
------------
- bash
- git
- coreutils
- grep
- sed
