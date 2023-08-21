#!/usr/bin/env bash

# Define color variables using tput
export BLACK=$(tput setaf 0);
export RED=$(tput setaf 1);
export GREEN=$(tput setaf 2);
export YELLOW=$(tput setaf 3);
export BLUE=$(tput setaf 4);
export MAGENTA=$(tput setaf 5);
export CYAN=$(tput setaf 6);
export WHITE=$(tput setaf 7);

# Reset color variable
export RESET=$(tput sgr0);

# Define color with hard codes
export SUPER_RED=$(tput setaf 9);
export SUPER_GREEN=$(tput setaf 10);
export SUPER_YELLOW=$(tput setaf 11);
export SUPER_BLUE=$(tput setaf 12);
export SUPER_MAGENTA=$(tput setaf 13);
export SUPER_CYAN=$(tput setaf 14);

# Define the program name
export PROGRAM_NAME="push_swap"

# Define the path to the tests directories
export TEST_OUTPUT_FILES="${TESTER_PATH}/test_output_files/"
export TEST_ERROR_FILES="${TESTER_PATH}/test_error_files/"
export TEST_SEQUENCES="${TESTER_PATH}/test_sequence/"

# Define the name of the diferents tests
export TEST_3="test_3/"
export TEST_5="test_5/"
export TEST_100="test_100/"
export TEST_500="test_500/"

# Define the name of the files with 3 integers
export FILE_NAME_3_SEQUENCE="test_3_sequence"
export FILE_NAME_3_OUTPUT="test_3_numbers_output"
export FILE_NAME_5_ERROR="test_3_numbers_error"

# Define the name of the files with 5 integers
export FILE_NAME_5_SEQUENCE="test_5_sequence"
export FILE_NAME_5_OUTPUT="test_5_numbers_output"
export FILE_NAME_5_ERROR="test_5_numbers_error"

# Define the name of the files with 100 integers
export FILE_NAME_100_SEQUENCE="test_100_sequence"
export FILE_NAME_100_OUTPUT="test_100_numbers_output"
export FILE_NAME_100_ERROR="test_100_numbers_error"

# Define the name of the files with 500 integers
export FILE_NAME_500_SEQUENCE="test_500_sequence"
export FILE_NAME_500_OUTPUT="test_500_numbers_output"
export FILE_NAME_500_ERROR="test_500_numbers_error"

export FILE_NAME_END=".txt"

# Define variables to count the number of error files
export ERROR_FILES_3_AMOUNT=0
export ERROR_FILES_5_AMOUNT=0
export ERROR_FILES_100_AMOUNT=0
export ERROR_FILES_500_AMOUNT=0
