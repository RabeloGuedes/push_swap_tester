#!/usr/bin/env bash

# Checks and creates directories
test $TEST_OUTPUT_FILES | mkdir $TEST_OUTPUT_FILES
test $TEST_ERROR_FILES | mkdir $TEST_ERROR_FILES
test $TEST_SEQUENCES | mkdir $TEST_SEQUENCES
