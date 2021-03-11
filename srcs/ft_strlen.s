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

; DATA Registers (ABCD - X): EAX - AX - AH & AL
; AX - primary accumulator (input/output for arithmetic operands)
; BX - base register, can be used in indexed addressing
; CX - count register, store e.g. loop count in iterative operations
; DX - data register, also an input output register (used in conjunction with AX)

; POINTER Registers (ISB - P): ESP - SP
;

section .data
; The data section is used for declaring initialized data or constants. 
; This data does not change at runtime.

section .bss
; The bss section is used for declaring variables. 

section .text
; The text section contains the actual code.

	global _start     ;must be declared for linker (ld)
_start:	            ;tells linker entry point
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg db 'Hello, world!', 0xa  ;string to be printed
len equ $ - msg     ;length of the string