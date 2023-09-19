#!/usr/bin/env bash

# Checks and creates directories for 500 integers
test $TEST_OUTPUT_FILES$TEST_500 | mkdir $TEST_OUTPUT_FILES$TEST_500
test $TEST_ERROR_FILES$TEST_500 | mkdir $TEST_ERROR_FILES$TEST_500
test $TEST_SEQUENCES$TEST_500 | mkdir $TEST_SEQUENCES$TEST_500

echo "${YELLOW}Testing 15 times with 500 random integers$WHITE"
echo "${SUPER_RED}Be patient, it takes some time$WHITE"
sleep 1;

# Generates integers between -5000 and 5000 and shuffles it and select 15 integers from it,
# then redirect this sequence to a file called test_500_sequence(number).txt, the number in the
# file name means really which file it is, if is 1 it means first, 2 is second, and so on.
# It also takes in each iteration and redirect each sequence to the test_500_numbers_output(number).txt
for i in $(seq 1 15); do
	RANDOM_SEQ_500=$(seq -5000 5000 | shuf -n 500)
	echo "$RANDOM_SEQ_500" > $TEST_SEQUENCES$TEST_500$FILE_NAME_500_SEQUENCE$i$FILE_END;
	./$PROGRAM_NAME $RANDOM_SEQ_500 > $TEST_OUTPUT_FILES$TEST_500$FILE_NAME_500_OUTPUT$i$FILE_NAME_END 2>$TEST_ERROR_FILES$TEST_500$FILE_NAME_500_ERROR$i$FILE_NAME_END;
	result=$(./$PROGRAM_NAME $RANDOM_SEQ_500 | ./$CHECKER $RANDOM_SEQ_500);
	if [[ "$result" = "OK" && "$IS_FULL" = "YES" ]]; then
		echo "Test_500: ${i}º$GREEN OK$WHITE";
	elif [ "$result" = "KO" ]; then
		echo "Test_500: ${i}º$RED KO$WHITE";
	fi;
done

# This block of code tests if there is some error log written in the error files, if not it delete the file, else keeps it.
# This is for the 15 files.
for i in $(seq 1 15); do
	LINES=$(wc -l < "$TEST_ERROR_FILES$TEST_500$FILE_NAME_500_ERROR$i$FILE_NAME_END");
	if [ "$LINES" -eq 0 ]; then
		rm "$TEST_ERROR_FILES$TEST_500$FILE_NAME_500_ERROR$i$FILE_NAME_END";
	else
		ERROR_FILES_500_AMOUNT=$(($ERROR_FILES_500_AMOUNT + 1))
	fi;
done

# This block of code checks whether there is or not at least on error file in the error directory.
# This is for the 15 files.
if [ "$(find $TEST_ERROR_FILES$TEST_500 -type f -name ".txt" | wc -l )" -gt "0" ]; then
	echo "${SUPER_RED}Something went wrong, check $TEST_ERROR_FILES$TEST_500 $ERROR_FILES_500_AMOUNT errors :($WHITE";
else
	echo "${SUPER_GREEN}Really good, $ERROR_FILES_500_AMOUNT compilation errors$WHITE";
fi;