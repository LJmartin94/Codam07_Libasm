;# **************************************************************************** #
;#                                                                              #
;#                                                         ::::::::             #
;#    ft_strdup.s                                        :+:    :+:             #
;#                                                      +:+                     #
;#    By: lindsay <lindsay@student.codam.nl>           +#+                      #
;#                                                    +#+                       #
;#    Created: 2021/02/18 17:04:19 by lindsay       #+#    #+#                  #
;#    Updated: 2021/02/18 17:04:29 by lindsay       ########   odam.nl          #
;#                                                                              #
;# **************************************************************************** #

section .data
extern _ft_strlen
extern _malloc
extern _ft_strcpy
extern ___error
; Defining registers with friendly variable names:
%define RET rax
%define FST rdi
%define SND	rsi

%define VAL rdi

section .bss

section .text

global _ft_strdup
_ft_strdup:
	push FST			; Push ptr to original string to stack
	call _ft_strlen		; Get length of original string
	inc RET				; Increment RET by 1 for Null terminator 
	mov FST, RET		; Move RET to first argument
	; align stack?
	call _malloc		; Malloc space for strlen + 1 length
	; align stack?
	;need to check errno to see if malloc encountered an error?
	mov FST, RET		; Move ptr returned by malloc into 1ST argument
	pop SND				; Pop original string from stack into 2ND argument
	call _ft_strcpy		; Call strcpy to cpy 2ND into 1ST
	ret 				; Return the destination given by strcpy

	error:
	;jc error			; Check the carry flag for a syscall error
	push RET						; Push syscall ret to stack (errno val)
	;sub rsp, 8						; Align stack before function call
	call ___error					; Get errno location, save ptr in RET
	;add rsp, 8						; Re-align stack after function call
	pop VAL							; Fetch errno val from stack into VAL
	mov [RET], VAL					; Move VAL into errno loc pointed to by RET
	mov RET, -1						; Make return -1
	ret								; Return


;  char *strdup(const char *s1);
;  The strdup() function allocates sufficient memory for a copy of the string s1, does the copy, and returns a
;  pointer to it.  The pointer may subsequently be used as an argument to the function free(3).
;  If insufficient memory is available, NULL is returned and errno is set to ENOMEM.