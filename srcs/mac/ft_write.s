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
extern ___error
; Defining user-friendly register and syscall names:
%define WRITE 0x2000004
%define SYS rax
%define RET rax

%define FD rdi
%define BUF rsi
%define LEN rdx

%define VAL rdi

section .bss

section .text

global _ft_write
_ft_write:
	mov SYS, WRITE					; Select the write system call
	syscall							; Perform syscall
	jc error						; Check the carry flag for a syscall error
	ret 							; Otherwise return the value in rax

	error:
	push RET						; Push syscall ret to stack (errno val)
	call ___error					; Get errno location, save ptr in RET
	pop VAL							; Fetch errno val from stack into VAL
	mov [RET], VAL					; Move VAL into errno loc pointed to by RET
	mov RET, -1						; Make return -1
	ret								; Return
