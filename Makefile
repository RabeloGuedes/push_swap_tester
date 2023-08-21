NAME = push_swap
SCRIPTS_PATH = ./shell_scripts/
DIRS = test_error_files test_output_files test_sequence

all: $(NAME)

$(NAME): fclean
	@export IS_FULL="NO" && export SINGLE_TEST="ALL" && bash $(SCRIPTS_PATH)run_tests.sh
# @norminette  

full: fclean
	@export IS_FULL="YES" && export SINGLE_TEST="ALL" && bash $(SCRIPTS_PATH)run_tests.sh

test_3: fclean
	@export IS_FULL="NO" && export SINGLE_TEST="3" && bash $(SCRIPTS_PATH)run_tests.sh

test_5: fclean
	@export IS_FULL="NO" && export SINGLE_TEST="5" && bash $(SCRIPTS_PATH)run_tests.sh

test_100: fclean
	@export IS_FULL="NO" && export SINGLE_TEST="100" && bash $(SCRIPTS_PATH)run_tests.sh
	
test_500: fclean
	@export IS_FULL="NO" && export SINGLE_TEST="500" && bash $(SCRIPTS_PATH)run_tests.sh

clean:
	@rm -rf $(DIRS)

fclean: clean
	@rm -rf $(NAME)

re: fclean all
