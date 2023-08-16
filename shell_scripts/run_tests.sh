#!/usr/bin/env bash

# Executes all the necessary scripts

export TESTER_PATH="$(pwd)";
export SHELL_SCRIPTS_PATH="$TESTER_PATH/shell_scripts/";
source "${SHELL_SCRIPTS_PATH}put_variables_on_terminal.sh";
if [ "$(find "$TESTER_PATH" -type f -name "checker" | wc -l)" -eq 0 ]; then
	echo "${SUPER_YELLOW}Warning: ${SUPER_RED}No ${SUPER_GREEN}checker ${SUPER_RED}was found, in order to test your project properly,\nturn into a checker file to the root of this project and name it checker,\ndo not forget to give it execution permission with chmod!\n${SUPER_YELLOW}Example: chmod +x checker${RESET}";
	exit;
fi;
source "${SHELL_SCRIPTS_PATH}checks_tools.sh";
if [ "$(which shuf)" != "" ];
	then source "${SHELL_SCRIPTS_PATH}get_push_swap_path.sh";
		sh "${SHELL_SCRIPTS_PATH}run_make.sh";
		sh "${SHELL_SCRIPTS_PATH}create_dirs.sh";
		if [ "$SINGLE_TEST" = "3" ]; then
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_3.sh;
			sh "${SHELL_SCRIPTS_PATH}"test_output_3_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "5" ]; then
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_5.sh;
			sh "${SHELL_SCRIPTS_PATH}"test_output_5_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "100" ]; then
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_100.sh;
			sh "${SHELL_SCRIPTS_PATH}"test_output_100_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "500" ]; then
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_500.sh;
			sh "${SHELL_SCRIPTS_PATH}"test_output_500_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "ALL" ]; then
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_3.sh;
			sleep 2;
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_5.sh;
			sleep 2;
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_100.sh;
			sleep 2;
			sh "${SHELL_SCRIPTS_PATH}"create_test_files_500.sh;
			source "${SHELL_SCRIPTS_PATH}"test_output_3_random_numbers.sh;
			if [ "$NEXT_TEST" = "YES" ];
				then source "${SHELL_SCRIPTS_PATH}"test_output_5_random_numbers.sh;
					if [ "$NEXT_TEST" = "YES" ];
						then sh "${SHELL_SCRIPTS_PATH}"test_output_100_random_numbers.sh;
							sh "${SHELL_SCRIPTS_PATH}"test_output_500_random_numbers.sh;
					else
						echo "${SUPER_RED}Review your algorithm!${RESET}";
					fi;
			else
				echo "${SUPER_RED}Review your algorithm!${RESET}";
			fi;
		fi;
	echo "${SUPER_RED}Cleaning the push_swap project!";
	sleep 1;
	make fclean -s --directory="$PUSH_SWAP_PATH";
fi;
