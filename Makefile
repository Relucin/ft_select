INCLUDES	+= ft_select
INCLUDES	:= $(addprefix srcs/, $(INCLUDES))
INCLUDES	:= $(addsuffix .o, $(INCLUDES))
CC			:= gcc
FLAGS		+= -Wall -Wextra -Werror -Ilibft/includes/ -Iincludes/
FLAGS		+= -g
NAME		:= ft_select

.PHONY: clean fclean re all

all: $(NAME)

$(NAME): $(INCLUDES) libft/libft.a
	@echo 'Building $(NAME)'
	@$(CC) $(FLAGS) $(FRAME) $^ -o $@

%.o: %.c
	$(CC) $(FLAGS) -c $^ -o $@

libft/libftprintf.a:
	@make -C libft/

rclean:
	@make -C libft/ fclean
	@make -C mlx/ clean

clean:
	@echo 'Removing $(NAME)--object files'
	@rm -rf $(INCLUDES)

fclean: clean
	@echo 'Removing $(NAME)'
	@rm -rf $(NAME)

re: fclean all
