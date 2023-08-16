#!/usr/bin/env bash

LINES_IN_FILES=0
TOTAL_LINES=0
MAX_LINES=0
MIN_LINES=$(wc -l < ../test_output_files/test_500/test_500_numbers_output1.txt)
TEST_OUTPUT_FILES_PATH="../test_output_files/"
TEST_500_PATH="test_500/"
FILE_NAME_500_OUTPUT="test_500_numbers_output"

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
SUPER_RED="\033[91m"
SUPER_GREEN="\033[92m"
SUPER_YELLOW="\033[93m"
SUPER_BLUE="\033[94m"
SUPER_MAGENTA="\033[95m"
SUPER_CYAN="\033[96m"

# It counts the number of lines of 100 output files and display it's name as well as the number of lines.
# This is for the 500 numbers sequence.
for i in $(seq 1 15); do
	LINES_IN_FILES=$(wc -l < "$TEST_OUTPUT_FILES_PATH$TEST_500_PATH$FILE_NAME_500_OUTPUT$i.txt");
	if [ "$LINES_IN_FILES" -gt "$MAX_LINES" ]; then MAX_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -lt "$MIN_LINES" ]; then MIN_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -gt "5500" ];
		then echo "The file $FILE_NAME_500_OUTPUT$i.txt has: $SUPER_RED$LINES_IN_FILES$WHITE lines";
	else
		echo "The file $FILE_NAME_500_OUTPUT$i.txt has: $SUPER_GREEN$LINES_IN_FILES$WHITE lines";
	fi;
	TOTAL_LINES=$(($TOTAL_LINES + $LINES_IN_FILES));
done

echo "$YELLOW=========================================RESULT====================================$YELLOW"

# It shows the max number of lines, i.e. from the file with most lines.
if [ "$MAX_LINES" -gt "5500" ];
	then echo "$WHITE         The file with the most lines has: $SUPER_RED$MAX_LINES$WHITE lines                        $WHITE";
else
	echo "$WHITE         The file with the most lines has: $SUPER_GREEN$MAX_LINES$WHITE lines                        $WHITE";
fi;

# It shows the min number of lines, i.e. from the file with least lines.
if [ "$MIN_LINES" -gt "5500" ];
	then echo "$WHITE         The file with the least has: $SUPER_RED$MIN_LINES$WHITE lines                             $WHITE";
else
	echo "$WHITE         The file with the least lines has: $SUPER_GREEN$MIN_LINES$WHITE lines                       $WHITE";
fi;

echo "$WHITE$MAGENTA         Total lines in all files: $TOTAL_LINES$WHITE                                         $WHITE"
echo "$WHITE$BLUE         The average lines per file is: $(($TOTAL_LINES / 15))$WHITE                                     $WHITE"

echo "$YELLOW=========================================RESULT====================================$YELLOW$WHITE"