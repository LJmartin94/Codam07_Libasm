# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: limartin <limartin@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/07/21 21:07:36 by limartin      #+#    #+#                  #
#    Updated: 2021/02/18 14:58:50 by lindsay       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC_PATH = ./srcs/

INCL_PATH = ./incl/

CC = gcc

CFLAGS = -Wall -Wextra -Werror -fsanitize=address -g

HEADER_FILES = $(INCL_PATH)ft_libasm.h

SRC		= $(SRC_PATH)ft_strlen.s \
	$(SRC_PATH)ft_strcpy.s \
	$(SRC_PATH)ft_strcmp.s \
	$(SRC_PATH)ft_write.s \
	$(SRC_PATH)ft_read.s \
	$(SRC_PATH)ft_strdup.s \


#Object files
OBJ := ${SRC:%.s=%.o}

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(CFLAGS)

%.o: %.c $(HEADER_FILES) $(MLX_LIB)
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INCL_PATH)

bonus:
	@ $(MAKE)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re

#LIBFT:

all: $(NAME)

%.o: %.c
	$(CC) $(FLAGS) -c -o $@ $< -I $(INCL_PATH)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)

bonus:
	@ $(MAKE) WITH_BONUS=1 all

adds: $(OBJ) $(BOBJ) $(ADSOBS)
	ar rc $(NAME) $(OBJ) $(ADSOBS) $(BOBJ)

clean:
	rm -f $(OBJ) $(BOBJ) $(ADSOBS) $(SRCTEMP) $(SRCTEMB) $(ADSTEMP) \
	.DS_Store $(SRC_PATH).DS_Store $(INCL_PATH).DS_Store Makefile~ \
	test libft.h~ *.c#

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re