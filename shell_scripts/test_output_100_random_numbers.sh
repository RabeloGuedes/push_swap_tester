#!/usr/bin/env bash

LINES_IN_FILES=0
TOTAL_LINES=0
MAX_LINES=0
TEST_100_PATH="$TEST_OUTPUT_FILES$TEST_100";
MIN_LINES=$(wc -l < "$TEST_100_PATH"/test_100_numbers_output1.txt)
FILE_NAME_100_OUTPUT="test_100_numbers_output"

echo "";
echo "${SUPER_YELLOW}Testing the number of lines of the 100 random integers sequences!${RESET}"
echo "";
sleep 2;

# It counts the number of lines of 100 output files and display it's name as well as the number of lines.
# This is for the 100 numbers sequence.
for i in $(seq 1 100); do
	LINES_IN_FILES=$(wc -l < $TEST_100_PATH$FILE_NAME_100_OUTPUT$i.txt);
	if [ "$LINES_IN_FILES" -gt "$MAX_LINES" ]; then MAX_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -lt "$MIN_LINES" ]; then MIN_LINES=$LINES_IN_FILES; fi;
	if [ "$LINES_IN_FILES" -gt "699" ];
		then echo "The file $FILE_NAME_100_OUTPUT$i.txt has: $SUPER_RED$LINES_IN_FILES$WHITE lines";
	elif [ "$LINES_IN_FILES" -lt "700" ] && [ "$IS_FULL" = "YES" ]; then
		echo "The file $FILE_NAME_100_OUTPUT$i.txt has: $SUPER_GREEN$LINES_IN_FILES$WHITE lines";
	fi;
	TOTAL_LINES=$(($TOTAL_LINES + $LINES_IN_FILES));
done

echo "$YELLOW=========================================RESULT=========================================$YELLOW"
echo "";

# It shows the max number of lines, i.e. from the file with most lines.
if [ "$MAX_LINES" -gt "700" ];
	then echo "$WHITE 		The file with the most lines has: $SUPER_RED$MAX_LINES$WHITE lines                  $WHITE";
else
	echo "$WHITE 		The file with the most lines has: $SUPER_GREEN$MAX_LINES$WHITE lines                  $WHITE ";
fi;

# It shows the min number of lines, i.e. from the file with least lines.
if [ "$MIN_LINES" -gt "700" ];
	then echo "$WHITE 		The file with the least lines has: $SUPER_RED$MIN_LINES$WHITE lines                 $WHITE ";
else
	echo "$WHITE 		The file with the least lines has: $SUPER_GREEN$MIN_LINES$WHITE lines                 $WHITE ";
fi;

echo "$WHITE$MAGENTA 		Total lines in all files: $TOTAL_LINES$WHITE     	       			  $WHITE"
echo "$WHITE$BLUE 		The average lines per file is: $(($TOTAL_LINES / 100))$WHITE          	 	          $WHITE "

echo "";
if [ "$MAX_LINES" -lt "700" ];
	then echo "                                    ${SUPER_GREEN}Grade: Great, 5/5";
elif [ "$MAX_LINES" -lt "900" ];
	then echo "                                    ${CYAN}Grade: Good, 4/5";
elif [ "$MAX_LINES" -lt "1100" ];
	then echo "                                    ${YELLOW}Grade: OK, 3/5";
elif [ "$MAX_LINES" -lt "1300" ];
	then echo "                                    ${SUPER_YELLOW}Grade: Bad, 2/5";
elif [ "$MAX_LINES" -lt "1500" ];
	then echo "                                    ${RED}Grade: Really Bad, 1/5";
else
	echo "                                    ${SUPER_RED}Grade: Failure, 0/5";
fi;

echo "";
echo "$YELLOW=========================================RESULT=========================================$YELLOW$WHITE"