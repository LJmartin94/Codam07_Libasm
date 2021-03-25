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

section .bss

section .text

global _ft_write
_ft_write:
	mov SYS, WRITE	; Select the write system call
	syscall			; Perform syscall
	jc error		; Check the carry flag for a syscall error
	ret 			; Return the value in rax

	error
	mov RET, -1
	ret

	; sub rsp, 8
	; call ___error	; Set errno if error occurred.
	; add rsp, 8