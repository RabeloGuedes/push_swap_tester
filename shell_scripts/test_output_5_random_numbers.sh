#!/usr/bin/env bash

LINES_IN_FILES=0
TOTAL_LINES=0
MAX_LINES=0
TEST_5_PATH="$TEST_OUTPUT_FILES$TEST_5";
MIN_LINES=$(wc -l < "$TEST_5_PATH"/test_5_numbers_output1.txt)
FILE_NAME_5_OUTPUT="test_5_numbers_output"

echo "";
echo "${GREEN}Testing the number of lines of the 5 random integers sequences!${RESET}"
echo "";
sleep 2;

# It counts the number of lines of 5 output files and display it's name as well as the number of lines.
# This is for the 5 numbers sequence.
for i in $(seq 1 100); do
	LINES_IN_FILES=$(wc -l < $TEST_5_PATH$FILE_NAME_5_OUTPUT$i.txt);
	if [ "$LINES_IN_FILES" -gt "$MAX_LINES" ]; then MAX_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -lt "$MIN_LINES" ]; then MIN_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -gt "12" ];
		then echo "The file $FILE_NAME_5_OUTPUT$i.txt has: $SUPER_RED$LINES_IN_FILES$WHITE lines";
	elif [[ "$LINES_IN_FILES" -lt "13" && "$IS_FULL" = "YES" ]]; then
		echo "The file $FILE_NAME_5_OUTPUT$i.txt has: $SUPER_GREEN$LINES_IN_FILES$WHITE lines";
	fi;
	TOTAL_LINES=$(($TOTAL_LINES + $LINES_IN_FILES));
done

echo "$YELLOW=========================================RESULT=========================================$YELLOW"
echo "";

# It shows the max number of lines, i.e. from the file with most lines.
if [ "$MAX_LINES" -gt "12" ];
	then echo "$WHITE 		The file with the most lines has: $SUPER_RED$MAX_LINES$WHITE lines                  $WHITE";
else
	echo "$WHITE 		The file with the most lines has: $SUPER_GREEN$MAX_LINES$WHITE lines                  $WHITE ";
fi;

# It shows the min number of lines, i.e. from the file with least lines.
if [ "$MIN_LINES" -gt "12" ];
	then echo "$WHITE 		The file with the least lines has: $SUPER_RED$MIN_LINES$WHITE lines                 $WHITE ";
else
	echo "$WHITE 		The file with the least lines has: $SUPER_GREEN$MIN_LINES$WHITE lines                 $WHITE ";
fi;

echo "$WHITE$MAGENTA 		Total lines in all files: $TOTAL_LINES$WHITE     	       			  $WHITE"
echo "$WHITE$BLUE 		The average lines per file is: $(($TOTAL_LINES / 100))$WHITE          	 	          $WHITE "

echo "";
if [ "$MAX_LINES" -lt "13" ];
	then echo "                                    ${SUPER_GREEN}Grade: Great";
	export NEXT_TEST="YES";
else
	echo "                                    ${SUPER_RED}Grade: Failure";
	export NEXT_TEST="NO";
fi;

echo ""
echo "$YELLOW=========================================RESULT=========================================$YELLOW$WHITE"