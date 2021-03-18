;# **************************************************************************** #
;#                                                                              #
;#                                                         ::::::::             #
;#    ft_strcpy.s                                        :+:    :+:             #
;#                                                      +:+                     #
;#    By: lindsay <lindsay@student.codam.nl>           +#+                      #
;#                                                    +#+                       #
;#    Created: 2021/02/18 17:04:17 by lindsay       #+#    #+#                  #
;#    Updated: 2021/02/18 17:04:30 by lindsay       ########   odam.nl          #
;#                                                                              #
;# **************************************************************************** #

section .data
extern _ft_strlen

section .bss

section .text

global _ft_strcpy
_ft_strcpy:
	call _ft_strlen
	mov rcx, rax	; Initialise our index to the val returned by ft_strlen
	mov rax, rsi	; Move 'dest' RSI to the return val register RAX
	loop:			; Copy string
	;{
		mov rsi+rcx, byte [rdi+rcx]	; Bad syntax. RSI = Dest, RDI = src
		cmp rcx, 0
		je exit
		dec rcx
	;}
	exit:
	ret ; Return the value in rax
	
	;mov byte [rsi], 'a' ; Put char 'a' in dest