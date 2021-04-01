;# **************************************************************************** #
;#                                                                              #
;#                                                         ::::::::             #
;#    ft_read.s                                          :+:    :+:             #
;#                                                      +:+                     #
;#    By: lindsay <lindsay@student.codam.nl>           +#+                      #
;#                                                    +#+                       #
;#    Created: 2021/02/18 17:04:07 by lindsay       #+#    #+#                  #
;#    Updated: 2021/02/18 17:21:15 by lindsay       ########   odam.nl          #
;#                                                                              #
;# **************************************************************************** #

section .data
extern ___error
; Defining user-friendly register and syscall names:
%define READ 0x2000003
%define SYS rax
%define RET rax

%define FD rdi
%define BUF rsi
%define LEN rdx

%define VAL rdi

section .bss

section .text

global _ft_read
_ft_read:
	mov SYS, READ					; Select the read system call
	syscall							; Perform syscall
	jc error						; Check the carry flag for a syscall error
	ret 							; Otherwise return the value in rax

	error:
	push RET						; Push current value to stack (errno val)
	;sub rsp, 8						; Align stack before function call
	call ___error					; Get errno location, save ptr in RET
	;add rsp, 8						; Re-align stack after function call
	pop VAL							; Fetch errno val from stack into VAL
	mov [RET], VAL					; Move VAL into errno loc pointed to by RET
	mov RET, -1						; Make return -1
	ret								; Return