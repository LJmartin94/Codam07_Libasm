;# **************************************************************************** #
;#                                                                              #
;#                                                         ::::::::             #
;#    ft_write.s                                         :+:    :+:             #
;#                                                      +:+                     #
;#    By: lindsay <lindsay@student.codam.nl>           +#+                      #
;#                                                    +#+                       #
;#    Created: 2021/02/18 17:04:25 by lindsay       #+#    #+#                  #
;#    Updated: 2021/02/18 17:14:02 by lindsay       ########   odam.nl          #
;#                                                                              #
;# **************************************************************************** #

section .data
extern __errno_location
; Defining user-friendly register and syscall names:
%define WRITE 1
%define SYS rax
%define RET rax

%define FD rdi
%define BUF rsi
%define LEN rdx

%define VAL rdi

section .bss

section .text

global ft_write
ft_write:
	mov SYS, WRITE					; Select the write system call
	syscall							; Perform syscall
	cmp RET, 0						; Compare ret val to 0
	jl error						; Jump if negative, indicates error
	ret 							; Otherwise return the value in rax

	error:
	neg RET							; Negate return val of failed syscall
	push RET						; Push current value to stack (errno val)
	;sub rsp, 8						; Align stack before function call
	call __errno_location wrt ..plt	; Get errno location, save ptr in RET
	;add rsp, 8						; Re-align stack after function call
	pop VAL							; Fetch errno val from stack into VAL
	mov [RET], VAL					; Move VAL into errno loc pointed to by RET
	mov RET, -1						; Make return -1
	ret								; Return