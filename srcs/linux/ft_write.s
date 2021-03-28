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

section .bss

section .text

global ft_write
ft_write:
	mov SYS, WRITE	; Select the write system call
	syscall			; Perform syscall
	cmp RET, 0
	jl error
	ret 			; Return the value in rax

	error:
	neg RET			; Negate return val of failed syscall
	push RET		; Push value to stack (errno val)
	;sub rsp, 8
	call __errno_location	; Get errno location
	;add rsp, 8
	; Get stack val into loc provided by errno
	pop rdi			; fetch errno value from stack into rdi
	mov [RET], rdi	; move errno val into errno loc  
	mov RET, -1		; Make return -1
	ret