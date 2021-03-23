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
extern ft_strlen
; Defining registers with friendly variable names:
%define RET rax
%define INX rcx
%define DST rdi
%define SRC rsi
%define CHR r10b

section .bss

section .text

global ft_strcpy
ft_strcpy:
	call ft_strlen				; Fetch the length of SRC string
	mov INX, RET				; Index = the return val from ft_strlen
	mov RET, DST				; Return val = Destination passed as arg
	loop:						; Copy string from back to front
	;{
		mov CHR, byte [SRC+INX]	; Move character from source to buffer
		mov byte [DST+INX], CHR ; Move character from buffer to destination
		cmp INX, 0				; Check if beginning of string is reached
		je exit					; Quit if it has
		dec INX					; Otherwise decrement index
		jmp loop				; And begin from the start again
	;}
	exit:
	ret 						; Return the destination of the copy