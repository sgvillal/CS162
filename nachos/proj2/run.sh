#!/bin/sh

#java nachos.machine.Machine $*
#java nachos.machine.Machine -x mulprocess.coff -#1 -d ma
#java -Dsun.reflect.inflationThreshold=50 nachos.machine.Machine  -x isprmgr.coff   -d as
#java nachos.machine.Machine -x exittest.coff -d ma
#java nachos.machine.Machine -x exectest.coff  -d ma
#java nachos.machine.Machine -x sh.coff  

#######################################################
#
# Test project2-task1
#
#######################################################
rm ../test/out
touch ../test/out

touch ../test/test1.in
touch ../test/test2.in
touch ../test/test3.in
touch ../test/test.out
echo "0 test#########################################################################################################################################################################################################################################################################################################################################################################################################################################################################">test.in

echo "FileSyscall.c VAR 7 $$ ">../test/cp.in
touch ../test/cp.out

file="../test/testVar1.txt"
if [ -e $file ]; then
    rm $file
fi

file="../test/cp.out"
if [ -e $file ]; then
    rm $file
fi

# For option of sun.reflect.inflationThreshold, it's suggested to set to 0
# Refer to: http://www-01.ibm.com/support/docview.wss?uid=swg21636746


#java -Dsun.reflect.inflationThreshold=50 nachos.machine.Machine  -x ../test..coff   -d as < test.in
java -Dsun.reflect.inflationThreshold=0 nachos.machine.Machine  -x isprmgr.coff>isprmgr.log
#java -Dsun.reflect.inflationThreshold=50 nachos.machine.Machine  -x filesyscall.coff   < test.in > filesyscall.log

cat filesyscall.log|grep "++FILESYSCALL End of this run"
if [ $? -ne 0 ]; then
    echo "Failed to test file system call" 
    exit -1
else
    echo "Test file system call successfully" 
fi

java -Dsun.reflect.inflationThreshold=50 nachos.machine.Machine  -d t

exit 0


# 6/13/2014 Reading paper about lottery Scheduling
# 6/14/2014 Reading paper about lottery Scheduling: "Loottery Scheduling: Flexible Proportional-Share Resource Management
# 6/15/2014 Reading paper "Loottery Scheduling: Flexible Proportional-Share Resource Management", almost got it!
# 6/18/2014 Smash my 10k PB at Omlypic Park in Beijing, need to go to sleep now, will work on CS162 tomorrow morning 
# 6/26/2014 Attend a technical meeting, so today I've no time to make a streak ...



