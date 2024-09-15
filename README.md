cfghist
=======
A tool for creating a configuration history of Linux systems.

Idea
----
As someone who frequently experiments with operating systems, I wanted a way to save the changes I make for easy reproduction or reference later.
While tools like Ansible work very well for this use case, writing a complete playbook upfront can be very time-consuming in my opinion.

I was looking for something that would track commands and files, allowing me to save changes after testing or revert to a previous version if needed.
I couldn't really find anything like that, so I created this simple tool. The inspiration came from the `configuration` command in Cisco iOS.

How it works?
-------------
This tool leverages the snapshot capabilities of ZFS.

- A snapshot is created before any changes are made. 
- Then, user enters a bash shell, where every command is saved to a temporary configuration file. Non-essential commands like `ls` can be filtered out using Regex.
- The `edit` command creates copy of an edited file in configuration directory, allowing for tracking of changes made to files.
- Upon completion, the `quit` command prompts the user to either save changes, create a new snapshot, or rollback to the previous state. 

Commands are saved to a configuration file, and changes to all files are tracked using Git. Currently, there is no script available for recreating the system from the configuration files, but I will create one if the need arises. For now, I primarily use this tool for documenting changes made to my systems and for automatic snapshots and rollbacks.

Dependencies
------------
- bash
- coreutils
- grep
- sed
