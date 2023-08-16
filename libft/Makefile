CC = cc
CCFLAGS = -Wall -Wextra -Werror
NAME = libft.a
SRC_PATH = src/
CHAR_PATH = src/char/
CONVERTER_PATH = src/converter/
LISTS_PATH = src/lists/
MEMORY_PATH = src/memory/
PRINTF_PATH = src/printf/
STRINGS_PATH = src/strings/
GNL_PATH = src/gnl/
ARRAY_PATH = src/array/
MATH_PATH = src/math/

STRINGS =	$(STRINGS_PATH)ft_putendl_fd.c $(STRINGS_PATH)ft_putnbr_fd.c\
			$(STRINGS_PATH)ft_putstr_fd.c $(STRINGS_PATH)ft_split.c\
			$(STRINGS_PATH)ft_strchr.c $(STRINGS_PATH)ft_strdup.c\
			$(STRINGS_PATH)ft_striteri.c $(STRINGS_PATH)ft_strjoin.c\
			$(STRINGS_PATH)ft_strlcat.c $(STRINGS_PATH)ft_strlcpy.c\
			$(STRINGS_PATH)ft_strlen.c $(STRINGS_PATH)ft_strmapi.c\
			$(STRINGS_PATH)ft_strncmp.c $(STRINGS_PATH)ft_strnstr.c\
			$(STRINGS_PATH)ft_strrchr.c  $(STRINGS_PATH)ft_strtrim.c\
			$(STRINGS_PATH)ft_substr.c

CHAR =		$(CHAR_PATH)ft_isalnum.c $(CHAR_PATH)ft_isalpha.c $(CHAR_PATH)ft_isascii.c\
			$(CHAR_PATH)ft_isdigit.c $(CHAR_PATH)ft_isprint.c $(CHAR_PATH)ft_putchar_fd.c\
			$(CHAR_PATH)ft_islower.c $(CHAR_PATH)ft_isupper.c $(CHAR_PATH)ft_isspace.c

CONVERTER = $(CONVERTER_PATH)ft_atoi.c $(CONVERTER_PATH)ft_itoa.c $(CONVERTER_PATH)ft_tolower.c\
			$(CONVERTER_PATH)ft_toupper.c $(CONVERTER_PATH)ft_abs_value.c $(CONVERTER_PATH)ft_atoll.c\
			$(CONVERTER_PATH)ft_str_capitalizer.c $(CONVERTER_PATH)ft_putnbr_base.c $(CONVERTER_PATH)ft_atoi_base.c

LISTS =		$(LISTS_PATH)ft_lstadd_back.c $(LISTS_PATH)ft_lstadd_front.c\
			$(LISTS_PATH)ft_lstclear.c $(LISTS_PATH)ft_lstdelone.c $(LISTS_PATH)ft_lstiter.c\
			$(LISTS_PATH)ft_lstlast.c $(LISTS_PATH)ft_lstmap.c $(LISTS_PATH)ft_lstnew.c\
			$(LISTS_PATH)ft_lstsize.c

MEMORY =	$(MEMORY_PATH)ft_bzero.c $(MEMORY_PATH)ft_calloc.c $(MEMORY_PATH)ft_memchr.c\
			$(MEMORY_PATH)ft_memcmp.c $(MEMORY_PATH)ft_memcpy.c $(MEMORY_PATH)ft_memmove.c\
			$(MEMORY_PATH)ft_memset.c

PRINTF =	$(PRINTF_PATH)ft_format_checker.c $(PRINTF_PATH)ft_print_address.c $(PRINTF_PATH)ft_print_hex.c\
			$(PRINTF_PATH)ft_print_int.c $(PRINTF_PATH)ft_print_strchr.c $(PRINTF_PATH)ft_print_uint.c\
			$(PRINTF_PATH)ft_printf.c

GNL = 		$(GNL_PATH)get_next_line.c $(GNL_PATH)get_next_line_utils.c

ARRAY =		$(ARRAY_PATH)ft_rev_int_tab.c $(ARRAY_PATH)ft_sort_int_tab.c

MATH =		$(MATH_PATH)ft_factorial.c $(MATH_PATH)ft_power.c $(MATH_PATH)ft_sqrt.c

SRC_FILES = $(STRINGS) $(CHAR) $(CONVERTER) $(LISTS)\
			$(MEMORY) $(PRINTF) $(GNL) $(ARRAY) $(MATH)

OBJS_FILES = $(SRC_FILES:.c=.o)

RM = rm -rf

all: $(NAME)

$(NAME): $(notdir $(OBJS_FILES))
	@ar rc $(NAME) $(notdir $(OBJS_FILES))

$(notdir $(OBJS_FILES)): $(SRC_FILES)
	@$(CC) -c $(CCFLAGS) -I ./inc $(SRC_FILES)

clean:
	@$(RM) $(notdir $(OBJS_FILES))

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
