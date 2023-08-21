#!/usr/bin/env bash

GET_PATH_RETRIES=0;

read -p "${SUPER_GREEN}Where is the push_swap file ? ${BLUE}Write the path to the root of your project: ${RESET}" PUSH_SWAP_PATH;
PUSH_SWAP_PATH="${PUSH_SWAP_PATH/#\~/${HOME}}";
PUSH_SWAP_PATH="${PUSH_SWAP_PATH/#\$HOME/${HOME}}";

# Attempts to get the push_swap path, up to 3 retries
while [[ "$(find "$PUSH_SWAP_PATH" -maxdepth 1 -type f -name "Makefile" 2>/dev/null | wc -l)" -eq 0 && "$GET_PATH_RETRIES" -lt 3 ]];
do
	GET_PATH_RETRIES=`expr $GET_PATH_RETRIES + 1`;
	echo "${SUPER_RED}Either you didn't write the correct path or in the root of your project there is no Makefile!${RESET}";
	echo "${SUPER_YELLOW}${GET_PATH_RETRIES}${SUPER_RED} try of 3 retries!${RESET}";
	read -p "${SUPER_GREEN}Where is the push_swap file ? ${BLUE}Write the path to the root of your project: ${RESET}" PUSH_SWAP_PATH;
	PUSH_SWAP_PATH="${PUSH_SWAP_PATH/#\~/${HOME}}";
	PUSH_SWAP_PATH="${PUSH_SWAP_PATH/#\$HOME/${HOME}}";
done;

# In case of success, by get the path, it executes the run_make script
if [[ "$GET_PATH_RETRIES" -eq 3 && "$(find "$PUSH_SWAP_PATH" -maxdepth 1 -type f -name "Makefile" 2>/dev/null | wc -l)" -eq 0 ]];
	then echo "${SUPER_RED}Sorry, you exceeded your retries!${RESET}";
		exit;
else
	export PUSH_SWAP_PATH;
fi;