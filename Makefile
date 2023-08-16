NAME = push_swap_tester

CC = cc

FLAGS = -Wall -Wextra -Werror

SRC_FILES = push_swap_tester.c

OBJS_FILES = $(SRC_FILES:.c=.o)

all: $(NAME)

$(NAME): $(notdir $(OBJS_FILES))
	@ar rc $(NAME) $(notdir $(OBJS_FILES))
	@norminette  

$(notdir $(OBJS_FILES)): $(SRC_FILES)
	@$(CC) -c $(CCFLAGS) -I ./inc $(SRC_FILES)

clean:
	@rm -rf $(notdir $(OBJS_FILES))

fclean: clean
	@rm -rf $(NAME)

re: fclean all
