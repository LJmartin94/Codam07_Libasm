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

section .text

global _ft_strlen
_ft_strlen:
	mov rcx, 0						; Initialise our counter to 0
	loop:							; Find null terinator
	;{
		cmp byte [rdi+rcx], 0x0		; Test char of arg in RDI plus index of RCX is NULL
		je match					; Leave loop if yes
		inc rcx						; Otherwise increment our index - the counter register RCX
		jmp loop					; and go back to start of loop
	;}
	match:
	mov rax, rcx					; Move the index RCX into the return value register RAX
	ret								; Return the value in RAX