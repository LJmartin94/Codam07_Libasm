;# **************************************************************************** #
;#                                                                              #
;#                                                         ::::::::             #
;#    ft_strlen.s                                        :+:    :+:             #
;#                                                      +:+                     #
;#    By: lindsay <lindsay@student.codam.nl>           +#+                      #
;#                                                    +#+                       #
;#    Created: 2021/02/18 17:04:22 by lindsay       #+#    #+#                  #
;#    Updated: 2021/02/18 17:45:47 by lindsay       ########   odam.nl          #
;#                                                                              #
;# **************************************************************************** #

section .data

section .bss
;len db

section .text

global _ft_strlen
_ft_strlen:
	mov rax, 0 ; Move value 0 to register AX
	ret ; Return the value in rax