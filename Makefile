# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: limartin <limartin@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/07/21 21:07:36 by limartin      #+#    #+#                  #
#    Updated: 2021/02/17 17:53:21 by lindsay       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = cub3D

SRC_PATH = ./srcs/

INCL_PATH = ./srcs/

CC = gcc

CFLAGS = -Wall -Wextra -Werror -O3

HEADER_FILES = $(INCL_PATH)ft_cub3d.h

SRC		= $(SRC_PATH)ft_cub3dmain.c \
		$(SRC_PATH)ft_bmp.c \
		$(SRC_PATH)ft_constructors.c \
		$(SRC_PATH)ft_error_checker.c \
		$(SRC_PATH)ft_parser_part1.c \
		$(SRC_PATH)ft_parser_part2.c \
		$(SRC_PATH)ft_map.c \
		$(SRC_PATH)ft_floodfill.c \
		$(SRC_PATH)ft_window.c \
		$(SRC_PATH)ft_raycaster.c \
		$(SRC_PATH)ft_colourwixel.c \
		$(SRC_PATH)ft_sprites_part1.c \
		$(SRC_PATH)ft_sprites_part2.c \
		$(SRC_PATH)ft_keyhook.c \
		$(SRC_PATH)ft_movement.c \
		$(SRC_PATH)ft_mlx.c \
		$(SRC_PATH)ft_quit.c \
		$(SRC_PATH)get_next_line.c \
		$(SRC_PATH)utils_part1.c

#Object files
OBJ := ${SRC:%.c=%.o}

#Avoid relinking bonus
ifdef WITH_BONUS
COMPILE_OBJECTS = $(OBJ)
else
COMPILE_OBJECTS = $(OBJ)
endif

#Specify OS for MLX (Mac default)
ifdef FOR_LINUX
MLX_DIR = mlx_linux
MLX_LIB = libmlx.a
INCLUDE_MLX_HEADERS = /usr/include
LINK_LIBRARY = -L/usr/lib -lXext -lX11 -lm -lz
OS_FLAG = LINUX=1
endif

ifndef FOR_LINUX
MLX_DIR = mlx
MLX_LIB = libmlx.dylib
INCLUDE_MLX_HEADERS = .
LINK_LIBRARY = -framework OpenGL -framework AppKit
OS_FLAG = MAC=1
endif

all: $(NAME)

$(NAME): $(COMPILE_OBJECTS)
	$(CC) -o $(NAME) $(COMPILE_OBJECTS) -L$(MLX_DIR) -lmlx $(LINK_LIBRARY) \
	$(CFLAGS) -D $(OS_FLAG)

%.o: %.c $(HEADER_FILES) $(MLX_LIB)
	$(CC) -o $@ -c $< $(CFLAGS) -O3 -I$(INCLUDE_MLX_HEADERS) -I./$(MLX_DIR) \
	-I $(INCL_PATH) -D $(OS_FLAG)

$(MLX_LIB):
	@make -C ./$(MLX_DIR)
	@cp ./$(MLX_DIR)/$(MLX_LIB) $(MLX_LIB)

bonus:
	@ $(MAKE) WITH_BONUS=1

linux:
	@ $(MAKE) FOR_LINUX=1 all

clean:
	@make clean -C ./mlx
	@make clean -C ./mlx_linux
	@rm -f ./mlx_linux/Makefile.gen
	rm -f $(OBJ)
	rm -f libmlx.a

fclean: clean
	rm -f $(NAME)
	rm -f snapshot.bmp
	rm -f libmlx.dylib

re: fclean all

linuxre: fclean linux

.PHONY: all bonus linux linuxre clean fclean re

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: limartin <limartin@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/29 18:20:12 by limartin          #+#    #+#              #
#    Updated: 2019/11/28 03:30:39 by limartin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

SRC_PATH = ./

INCL_PATH = ./

CC = gcc

FLAGS = -Wall -Wextra -Werror

SRC		= $(SRC_PATH)ft_memset.c \
		$(SRC_PATH)ft_bzero.c \
		$(SRC_PATH)ft_memcpy.c \
		$(SRC_PATH)ft_memccpy.c \
		$(SRC_PATH)ft_memmove.c \
		$(SRC_PATH)ft_memchr.c \
		$(SRC_PATH)ft_memcmp.c \
		$(SRC_PATH)ft_strlen.c \
		$(SRC_PATH)ft_isalpha.c \
		$(SRC_PATH)ft_isdigit.c \
		$(SRC_PATH)ft_isalnum.c \
		$(SRC_PATH)ft_isascii.c \
		$(SRC_PATH)ft_isprint.c \
		$(SRC_PATH)ft_toupper.c \
		$(SRC_PATH)ft_tolower.c \
		$(SRC_PATH)ft_strchr.c \
		$(SRC_PATH)ft_strrchr.c \
		$(SRC_PATH)ft_strncmp.c \
		$(SRC_PATH)ft_strlcpy.c \
		$(SRC_PATH)ft_strlcat.c \
		$(SRC_PATH)ft_strdup.c \
		$(SRC_PATH)ft_strnstr.c \
		$(SRC_PATH)ft_atoi.c \
		$(SRC_PATH)ft_calloc.c \
		$(SRC_PATH)ft_substr.c \
		$(SRC_PATH)ft_strjoin.c \
		$(SRC_PATH)ft_strtrim.c \
		$(SRC_PATH)ft_split.c \
		$(SRC_PATH)ft_itoa.c \
		$(SRC_PATH)ft_strmapi.c \
		$(SRC_PATH)ft_putchar_fd.c \
		$(SRC_PATH)ft_putstr_fd.c \
		$(SRC_PATH)ft_putendl_fd.c \
		$(SRC_PATH)ft_putnbr_fd.c

SRC_B	= $(SRC_PATH)ft_lstnew_bonus.c \
		$(SRC_PATH)ft_lstadd_front_bonus.c \
		$(SRC_PATH)ft_lstsize_bonus.c \
		$(SRC_PATH)ft_lstlast_bonus.c \
		$(SRC_PATH)ft_lstadd_back_bonus.c \
		$(SRC_PATH)ft_lstdelone_bonus.c \
		$(SRC_PATH)ft_lstclear_bonus.c \
		$(SRC_PATH)ft_lstiter_bonus.c \
		$(SRC_PATH)ft_lstmap_bonus.c

ADS		= #Additional functions go here

#Temporary files
SRCTEMP = ${SRC:%.c=%.c~}

SRCTEMB = ${SRC_B:%.c=%.c~}

ADSTEMP = ${ADS:%.c=%.c~}

#Object files
OBJ := ${SRC:%.c=%.o}

BOBJ := ${SRC_B:%.c=%.o}

ADSOBS	= ${ADS:%.c=%.o}

#Avoid relinking
ifdef WITH_BONUS
COMPILE_OBJECTS = $(OBJ) $(BOBJ)
else
COMPILE_OBJECTS = $(OBJ)
endif

all: $(NAME)

%.o: %.c
	$(CC) $(FLAGS) -c -o $@ $< -I $(INCL_PATH)

$(NAME): $(COMPILE_OBJECTS)
	ar rc $(NAME) $(COMPILE_OBJECTS)

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
