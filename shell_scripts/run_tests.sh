#!/usr/bin/env bash

# Executes all the necessary scripts


export TESTER_PATH="$(pwd)";
export SHELL_SCRIPTS_PATH="shell_scripts/";
. "${SHELL_SCRIPTS_PATH}put_variables_on_terminal.sh";
echo "${SUPER_YELLOW}Warning: ${SUPER_RED}Be aware that this tester does not\nuses ${SUPER_YELLOW}valdring ${SUPER_RED} or ${SUPER_YELLOW}leaks ${SUPER_RED} to verify ${SUPER_YELLOW}memory\nleaks${SUPER_RED}. You should do it by your self!${RESET}";
if [ "$(find "$TESTER_PATH" -type f -name "checker*" | wc -l)" -eq 0 ]; then
	echo "${SUPER_YELLOW}Warning: ${SUPER_RED}No ${SUPER_GREEN}checker ${SUPER_RED}was found, in order to test your project properly,\nturn into a checker file to the root of this project and name it checker,\ndo not forget to give it execution permission with chmod!\n${SUPER_YELLOW}Example: chmod +x checker${RESET}";
	exit;
else
	if [ "$(uname -m)" = "x86_64" ]; then
		export CHECKER="checker_linux";
	else
		export CHECKER="checker_macOS";
	fi;
fi;

. "${SHELL_SCRIPTS_PATH}checks_tools.sh";
if [ "$(which shuf)" != "" ];
	then . "${SHELL_SCRIPTS_PATH}get_push_swap_path.sh";
		bash "${SHELL_SCRIPTS_PATH}run_make.sh";
		bash "${SHELL_SCRIPTS_PATH}create_dirs.sh";
		if [ "$SINGLE_TEST" = "3" ]; then
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_3.sh;
			bash "${SHELL_SCRIPTS_PATH}"test_output_3_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "5" ]; then
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_5.sh;
			bash "${SHELL_SCRIPTS_PATH}"test_output_5_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "100" ]; then
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_100.sh;
			bash "${SHELL_SCRIPTS_PATH}"test_output_100_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "500" ]; then
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_500.sh;
			bash "${SHELL_SCRIPTS_PATH}"test_output_500_random_numbers.sh;
		elif [ "$SINGLE_TEST" = "ALL" ]; then
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_3.sh;
			sleep 2;
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_5.sh;
			sleep 2;
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_100.sh;
			sleep 2;
			bash "${SHELL_SCRIPTS_PATH}"create_test_files_500.sh;
			. "${SHELL_SCRIPTS_PATH}"test_output_3_random_numbers.sh;
			if [ "$NEXT_TEST" = "YES" ];
				then . "${SHELL_SCRIPTS_PATH}"test_output_5_random_numbers.sh;
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
