#!/usr/bin/env bash

PROGRAM_NAME="push_swap"
TEST_OUTPUT_FILES="../test_output_files/"
TEST_ERROR_FILES="../test_error_files/"
TEST_SEQUENCES="../test_sequence/"
TEST_100="test_100/"
TEST_500="test_500/"
FILE_NAME_100_SEQUENCE="test_100_sequence"
FILE_NAME_100_OUTPUT="test_100_numbers_output"
FILE_NAME_100_ERROR="test_100_numbers_error"
FILE_NAME_500_OUTPUT="test_500_numbers_output"
FILE_NAME_500_ERROR="test_500_numbers_error"
FILE_NAME_END=".txt"

ERROR_FILES_100_AMOUNT=0
ERROR_FILES_500_AMOUNT=0

# colors
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
# colors

# Checks and creates directory
test $TEST_OUTPUT_FILES | mkdir $TEST_OUTPUT_FILES
test $TEST_ERROR_FILES | mkdir $TEST_ERROR_FILES
test $TEST_SEQUENCES | mkdir $TEST_SEQUENCES
test $TEST_OUTPUT_FILES$TEST_100 | mkdir $TEST_OUTPUT_FILES$TEST_100
test $TEST_ERROR_FILES$TEST_100 | mkdir $TEST_ERROR_FILES$TEST_100
test $TEST_SEQUENCES$TEST_100 | mkdir $TEST_SEQUENCES$TEST_100
test $TEST_OUTPUT_FILES$TEST_500 | mkdir $TEST_OUTPUT_FILES$TEST_500
test $TEST_ERROR_FILES$TEST_500 | mkdir $TEST_ERROR_FILES$TEST_500
test $TEST_SEQUENCES$TEST_500 | mkdir $TEST_SEQUENCES$TEST_500
# Checks and creates directory

echo "$YELLOW Testing 100 times with 100 random numbers$WHITE"

# Generates numbers between -5000 and 5000 and shuffles it and select 100 numbers from it,
# then redirect this sequence to a file called test_100_sequence(number).txt, the number in the
# file name means really which file it is, if is 1 it means first, 2 is second, and so on.
# It also takes in each iteration and redirect each sequence to the test_100_numbers_output(number).txt
for i in $(seq 1 100); do
	RANDOM_SEQ_100=$(seq -5000 5000 | shuf -n 100)
	echo "$RANDOM_SEQ_100" > $TEST_SEQUENCES$TEST_100$FILE_NAME_100_SEQUENCE$i$FILE_END;
	../../$PROGRAM_NAME $RANDOM_SEQ_100 > $TEST_OUTPUT_FILES$TEST_100$FILE_NAME_100_OUTPUT$i$FILE_NAME_END 2>$TEST_ERROR_FILES$TEST_100$FILE_NAME_100_ERROR$i$FILE_NAME_END;
	result=$(../../$PROGRAM_NAME $RANDOM_SEQ_100 | ./../../checker $RANDOM_SEQ_100);
	if [ "$result" = "OK" ]; then
		echo "Test_100: $i º$GREEN OK$WHITE";
	else
		echo "Test_100: $i º$RED KO$WHITE";
	fi;
done

# This block of code tests if there is some error log written in the error files, if not it delete the file, else keeps it.
# This is for the 100 files.
for i in $(seq 1 100); do
	LINES=$(wc -l < "$TEST_ERROR_FILES$TEST_100$FILE_NAME_100_ERROR$i$FILE_NAME_END");
	if [ "$LINES" -eq 0 ]; then
		rm "$TEST_ERROR_FILES$TEST_100$FILE_NAME_100_ERROR$i$FILE_NAME_END";
	else
		ERROR_FILES_100_AMOUNT=$(($ERROR_FILES_100_AMOUNT + 1))
	fi;
done

# This block of code checks whether there is or not at least on error file in the error directory.
# This is for the 100 files.
if [ "$(find $TEST_ERROR_FILES$TEST_100 -type f -name ".txt" | wc -l )" -gt "0" ]; then
	echo "$SUPER_RED Something went wrong, check $TEST_ERROR_FILES$TEST_100 $ERROR_FILES_100_AMOUNT errors :($WHITE";
else
	echo "$SUPER_GREEN Really good, $ERROR_FILES_100_AMOUNT errors$WHITE";
fi;
echo "$YELLOW Testing 15 times with 500 random numbers$WHITE"
echo "$SUPER_RED Be patient it takes some time$WHITE"

# Generates numbers between -5000 and 5000 and shuffles it and select 500 numbers from it,
# then redirect this sequence to a file called test_500_sequence(number).txt, the number in the
# file name means really which file it is, if is 1 it means first, 2 is second, and so on.
# It also takes in each iteration and redirect each sequence to the test_500_numbers_output(number).txt
for i in $(seq 1 15); do
	RANDOM_SEQ_500=$(seq -5000 5000 | shuf -n 500)
	echo "$RANDOM_SEQ_500" > $TEST_SEQUENCES$TEST_500$FILE_NAME_500_SEQUENCE$i$FILE_END;
	../../$PROGRAM_NAME $RANDOM_SEQ_500 > $TEST_OUTPUT_FILES$TEST_500$FILE_NAME_500_OUTPUT$i$FILE_NAME_END 2>$TEST_ERROR_FILES$TEST_500$FILE_NAME_500_ERROR$i$FILE_NAME_END;
	result=$(../../$PROGRAM_NAME $RANDOM_SEQ_500 | ./../../checker $RANDOM_SEQ_500);
	if [ "$result" = "OK" ]; then
		echo "Test_500: $i º$GREEN OK$WHITE";
	else
		echo "Test_500: $i º$RED KO$WHITE";
	fi;
done

# This block of code tests if there is some error log written in the error files, if not it delete the file, else keeps it.
# This is for the 500 files.
for i in $(seq 1 15); do
	LINES=$(wc -l < "$TEST_ERROR_FILES$TEST_500$FILE_NAME_500_ERROR$i$FILE_NAME_END");
	if [ "$LINES" -eq 0 ]; then
		rm "$TEST_ERROR_FILES$TEST_500$FILE_NAME_500_ERROR$i$FILE_NAME_END";
	else
		ERROR_FILES_500_AMOUNT=$(($ERROR_FILES_500_AMOUNT + 1))
	fi;
done

# This block of code checks whether there is or not at least on error file in the error directory.
# This is for the 500 files.
if [ "$(find $TEST_ERROR_FILES$TEST_500 -type f -name ".txt" | wc -l )" -gt "0" ]; then
	echo "$SUPER_RED Something went wrong, check $TEST_ERROR_FILES$TEST_500 $ERROR_FILES_500_AMOUNT errors :($WHITE";
else
	echo "$SUPER_GREEN Really good, $ERROR_FILES_500_AMOUNT errors$WHITE";
fi;

echo "$GREEN Files are ready to be tested!$WHITE"