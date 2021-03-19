# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: limartin <limartin@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/07/21 21:07:36 by limartin      #+#    #+#                  #
#    Updated: 2021/03/19 16:48:28 by lindsay       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC_PATH = ./srcs/

INCL_PATH = ./incl/

CC = nasm

#CFLAGS = -Wall -Wextra -Werror -fsanitize=address -g

HEADER_FILES = $(INCL_PATH)ft_libasm.h

SRC		= $(SRC_PATH)ft_strlen.s \
	$(SRC_PATH)ft_strcpy.s \
	$(SRC_PATH)ft_strcmp.s \
	$(SRC_PATH)ft_write.s \
	$(SRC_PATH)ft_read.s \
	$(SRC_PATH)ft_strdup.s \
	$(SRC_PATH)spark.s \


#Object files
OBJ := ${SRC:%.s=%.o}

all: $(NAME)

test:
	gcc -o tester ft_tester.c -L. -lasm -I $(INCL_PATH)

$(NAME): $(OBJ)
	ar -rcs $(NAME) $(OBJ)
	# ld -m elf_x86_64 -s -o $(NAME) $(OBJ)
#$(CFLAGS)

%.o: %.s $(HEADER_FILES)
	# $(CC) -o $@ -f macho64 $< -I $(INCL_PATH)
	$(CC) -o $@ -f elf64 $< -I $(INCL_PATH)

bonus:
	@ $(MAKE)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	rm -f tester

re: fclean all

.PHONY: all bonus clean fclean re

#LIBFT:

# all: $(NAME)

# %.o: %.c
# 	$(CC) $(FLAGS) -c -o $@ $< -I $(INCL_PATH)

# $(NAME): $(OBJ)
# 	ar rc $(NAME) $(OBJ)

# bonus:
# 	@ $(MAKE) WITH_BONUS=1 all

# adds: $(OBJ) $(BOBJ) $(ADSOBS)
# 	ar rc $(NAME) $(OBJ) $(ADSOBS) $(BOBJ)

# clean:
# 	rm -f $(OBJ) $(BOBJ) $(ADSOBS) $(SRCTEMP) $(SRCTEMB) $(ADSTEMP) \
# 	.DS_Store $(SRC_PATH).DS_Store $(INCL_PATH).DS_Store Makefile~ \
# 	test libft.h~ *.c#

# fclean: clean
# 	rm -f $(NAME)

# re: fclean all

# .PHONY: all clean fclean re
