Shell script for processor and process management.

This project is meant to give a solution to the specific needs of core processor management by the users for large project handling. 
Aims to provide an open and direct environment between the user and operating system.  


## Usage
Linux systems

$ bash Processor.bash   #or bash Processor.sh (in case extension is altered to the shell extension)

## Requirements

Processor id(s) for the processes to managed.

## Env used: 
RHEL-7

## What the script actually manages

Managing processor/thread affinity:
---> Run-time processor allocation using command prompt

Shared Memory Allocation on the system:
--->Limiting and memory for a particular process
--->Sending alerts on large memory usage


## Problem Description

The script solves the issue where a project utilizes large systems of large memory space and large numbers of processors to be handled at once. Since the default Kernel settings involve a number of CPU scheduling algorithms (usually Round Robin scheduling), the tasks or processes on a system are by default allocated to the available processor as per the scheduling process or size of the process. The project requires dedicated processors for particular processors and explicit management of the resources and processes on the servers and multi core processors, in order to avoid interruptions and deadlocks by other processes and efficient management of the processes. 
By default, multiple applications are deployed on a server/ processor. To avoid over utilization of resources by a large interrupting process and process deadlock, I have created a shell script to explicitly manage the processes being assigned to the processors and keep a check on the memory space being used by the process, using various commands.  

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate


