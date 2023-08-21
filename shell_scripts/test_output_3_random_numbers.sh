#!/usr/bin/env bash

LINES_IN_FILES=0
TOTAL_LINES=0
MAX_LINES=0
TEST_3_PATH="$TEST_OUTPUT_FILES$TEST_3";
MIN_LINES=$(wc -l < "$TEST_3_PATH"/test_3_numbers_output1.txt)
FILE_NAME_3_OUTPUT="test_3_numbers_output"

echo ""
echo "${SUPER_GREEN}Testing the number of lines of the 3 random integers sequences!${RESET}"
echo ""
sleep 2;

# It counts the number of lines of 3 output files and display it's name as well as the number of lines.
# This is for the 3 numbers sequence.
for i in $(seq 1 100); do
	LINES_IN_FILES=$(wc -l < $TEST_3_PATH$FILE_NAME_3_OUTPUT$i.txt);
	if [ "$LINES_IN_FILES" -gt "$MAX_LINES" ]; then MAX_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -lt "$MIN_LINES" ]; then MIN_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -gt "3" ];
		then echo "The file $FILE_NAME_3_OUTPUT$i.txt has: $SUPER_RED$LINES_IN_FILES$WHITE lines";
	elif [[ "$LINES_IN_FILES" -lt "4" && "$IS_FULL" = "YES" ]]; then
		echo "The file $FILE_NAME_3_OUTPUT$i.txt has: $SUPER_GREEN$LINES_IN_FILES$WHITE lines";
	fi;
	TOTAL_LINES=$(($TOTAL_LINES + $LINES_IN_FILES));
done

echo "$YELLOW=========================================RESULT=========================================$YELLOW"
echo ""

# It shows the max number of lines, i.e. from the file with most lines.
if [ "$MAX_LINES" -gt "3" ];
	then echo "$WHITE 		The file with the most lines has: $SUPER_RED$MAX_LINES$WHITE lines                  $WHITE";
else
	echo "$WHITE 		The file with the most lines has: $SUPER_GREEN$MAX_LINES$WHITE lines                  $WHITE ";
fi;

# It shows the min number of lines, i.e. from the file with least lines.
if [ "$MIN_LINES" -gt "3" ];
	then echo "$WHITE 		The file with the least lines has: $SUPER_RED$MIN_LINES$WHITE lines                 $WHITE ";
else
	echo "$WHITE 		The file with the least lines has: $SUPER_GREEN$MIN_LINES$WHITE lines                 $WHITE ";
fi;

echo "$WHITE$MAGENTA 		Total lines in all files: $TOTAL_LINES$WHITE     	       			  $WHITE"
echo "$WHITE$BLUE 		The average lines per file is: $(($TOTAL_LINES / 100))$WHITE          	 	          $WHITE "

if [ "$MAX_LINES" -lt "4" ];
	then
		echo "";
		echo "                                    ${SUPER_GREEN}Grade: Great";
	export NEXT_TEST="YES";
else
	echo "";
	echo "                                    ${SUPER_RED}Grade: Failure";
	export NEXT_TEST="NO";
fi;

echo ""
echo "$YELLOW=========================================RESULT=========================================$YELLOW$WHITE"