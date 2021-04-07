;# **************************************************************************** #
;#                                                                              #
;#                                                         ::::::::             #
;#    ft_strcmp.s                                        :+:    :+:             #
;#                                                      +:+                     #
;#    By: lindsay <lindsay@student.codam.nl>           +#+                      #
;#                                                    +#+                       #
;#    Created: 2021/02/18 17:04:13 by lindsay       #+#    #+#                  #
;#    Updated: 2021/02/18 17:04:32 by lindsay       ########   odam.nl          #
;#                                                                              #
;# **************************************************************************** #

section .data
; Defining registers with friendly variable names:
%define RET rax
%define INX rcx
%define S1 rdi
%define S2 rsi
%define CHR r10b

section .bss

section .text

global ft_strcmp
ft_strcmp:
	mov INX, 0					; Initialise index to 0
	loop:
	;{
		mov CHR, byte [S1+INX]	; Copy the character to compare from S1 to buf
		cmp CHR, byte [S2+INX]	; Compare S1 char to S2 char
		jne	not_equal			; If S1[x] != S2[x] compare them more closely
		cmp CHR, 0x0			; Check for null terminator
		je equal				; Quit if null terminator found
		inc INX					; Else increment index
		jmp loop				; And begin from the start again
	;}

	not_equal:
	sub CHR, byte [S2+INX]		; Subtract S2 from S1 as unsigned char 
    jnc positive 				; if no substraction overflow, S1 > S2
	
	negative:					; else S1 < S2
	mov RET, -1					; Make ret -1
	ret							; Return

	positive:
	mov RET, 1					; Make ret 1
	ret							; Return

	equal:
	mov RET, 0					; Make ret 0 
	ret							; Return	