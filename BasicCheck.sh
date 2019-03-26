#!/bin/bash

path=${1}
progname=${2}
shift 2

cd $path
 
	make
	if [[ $? -eq 0 ]]; 
	then
		COMPILE="PASS"
		valgrind --leak-check=full --error-exitcode=1 ./$progname $@ &>/dev/null
		if [[ $? -eq 0 ]]; 
		then
			MEMCHECK="PASS"
			valgrind --tool=helgrind --error-exitcode=1 ./$progname $@ &>/dev/null
			if [[ $? -eq 0 ]]; 
			then
				THREAD="PASS"
				exit 0
			else 
				THREAD="FAIL"
				exit 1
			fi
		else
			MEMCHECK="FAIL"
			valgrind --tool=helgrind --error-exitcode=1 ./$progname $@ &>/dev/null
			if [[ $? -eq 0 ]]; 
			then
				THREAD="PASS"
				exit 2
			else
				THREAD="FAIL"
				exit 3
			fi
		fi
	echo
	echo "Compilation	Memory leaks	Thread race"
	echo "  $COMPILE		   $MEMCHECK	  	    $THREAD"

	else

	echo
	echo "Compilation	Memory leaks	Thread race"
	echo "  FAIL		   FAIL	  	       FAIL"
	exit 7
	fi
