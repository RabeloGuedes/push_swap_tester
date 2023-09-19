#!/usr/bin/env bash

# Checks and creates directories for 3 integers
test $TEST_OUTPUT_FILES$TEST_3 | mkdir $TEST_OUTPUT_FILES$TEST_3
test $TEST_ERROR_FILES$TEST_3 | mkdir $TEST_ERROR_FILES$TEST_3
test $TEST_SEQUENCES$TEST_3 | mkdir $TEST_SEQUENCES$TEST_3

echo "${YELLOW}Testing 100 times with 3 random integers$WHITE";
sleep 1;

# Generates integers between -5000 and 5000 and shuffles it and select 3 integers from it,
# then redirect this sequence to a file called test_3_sequence(number).txt, the number in the
# file name means really which file it is, if is 1 it means first, 2 is second, and so on.
# It also takes in each iteration and redirect each sequence to the test_3_numbers_output(number).txt
for i in $(seq 1 100); do
	RANDOM_SEQ_3=$(seq -5000 5000 | shuf -n 3)
	echo "$RANDOM_SEQ_3" > $TEST_SEQUENCES$TEST_3$FILE_NAME_3_SEQUENCE$i$FILE_END;
	./$PROGRAM_NAME $RANDOM_SEQ_3 > $TEST_OUTPUT_FILES$TEST_3$FILE_NAME_3_OUTPUT$i$FILE_NAME_END 2>$TEST_ERROR_FILES$TEST_3$FILE_NAME_3_ERROR$i$FILE_NAME_END;
	result=$(./$PROGRAM_NAME $RANDOM_SEQ_3 | ./$CHECKER $RANDOM_SEQ_3);
	if [[ "$result" = "OK" && "$IS_FULL" = "YES" ]]; then
		echo "Test_3: ${i}º$GREEN OK$WHITE";
	elif [ "$result" = "KO" ]; then
		echo "Test_3: ${i}º$RED KO$WHITE";
	fi;
done

# This block of code tests if there is some error log written in the error files, if not it delete the file, else keeps it.
# This is for the 100 files.
for i in $(seq 1 100); do
	LINES=$(wc -l < "$TEST_ERROR_FILES$TEST_3$FILE_NAME_3_ERROR$i$FILE_NAME_END");
	if [ "$LINES" -eq 0 ]; then
		rm "$TEST_ERROR_FILES$TEST_3$FILE_NAME_3_ERROR$i$FILE_NAME_END";
	else
		ERROR_FILES_3_AMOUNT=$(($ERROR_FILES_3_AMOUNT + 1))
	fi;
done

# This block of code checks whether there is or not at least on error file in the error directory.
# This is for the 100 files.
if [ "$(find $TEST_ERROR_FILES$TEST_3 -type f -name ".txt" | wc -l )" -gt "0" ]; then
	echo "${SUPER_RED}Something went wrong, check $TEST_ERROR_FILES$TEST_3 $ERROR_FILES_3_AMOUNT errors :($WHITE";
else
	echo "${SUPER_GREEN}Really good, $ERROR_FILES_3_AMOUNT compilation errors$WHITE";
fi;