#!/bin/bash 
echo "Welcome"
#Fetching Processor id
read -p "Enter process name for pid to be fetched: " id
echo "Pids of process entered: " 
pidof $id
p=$(pidof $id |  awk '{print $1}')
echo "First pid of process: $p"  
n=$(pidof $id | wc -w )
echo "Total pid(s) in process: $n"
echo "Bash version ${BASH_VERSION}..."
set -o braceexpand
if [[ -o braceexpand ]]
then
    echo "Brace expand is on"
else
    echo "Brace expand is off"
fi
 
for (( i = 1; i <= $n; i++ ))
do    
   q=$(pidof $id | awk '{print $'$i'}')
# awk '{print " '$i' "}'
   read -p "Enter processor to be assigned to sub process $i (pid=$q): " r 
   echo " $r "
   taskset -p -c $r $q
done 
set +o braceexpand
 
 
#echo "\n Limiting memory"
#Limiting memory for a process using cputool 
#sudo apt cputool #if not installed already
#dd if=/dev/zero of=/dev/null & #dd command results into a high CPU percentage, in the background and display its PID
#top #to check
#cputool --cpu-limit 50 -p 9476  #The command will limit the dd command (PID 9476) to 50% use of one CPU core
#top
 
echo "\n Sending alert" 
#!/bin/bash
## get total free memory size in megabytes(MB) 
read -p "Enter pid of process to check memory being used: " pr
use=$(pmap $pr | awk 'END {print $2}')
NUMBER=$(pmap $pr | awk 'END {print $2}' | tr -dc '0-9')
echo $NUMBER
echo "Memory being used: $use "
## check if memory is greater than or equals to  10MB
if [ $NUMBER -ge 10 ]; then
     
       ## send alert if system memory is running low
       echo "Server memory is running low,Warning ! $use MB"
fi
 
 
#Dedicating processor
#Check number of processors 
k=$(grep -c proc /proc/cpuinfo)
GRUB_CMDLINE_LINUX="isolcpus=$k"
#Installing 
#sudo update-grub #If not done already
echo "Processor Dedication "
read -p "Enter process id : " rr
read -p "Enter processor to be dedicated: " l
 
taskset -cp $l $rr
 
#Checking all the processes running on a processor 
 
process=$(ps -aeF | awk '{ if ($7 == 2) { print $3 } }' )
echo $process 
 
 
 
#chmod a+x alert.sh
#ln -s -t /cron.hourly/alert.sh /scripts/alert.sh
 
#exit 0
