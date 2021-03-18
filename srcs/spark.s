section .data
; text db "Hello, world!", 0xa
; ;var2 db "Something else", 0xa
; .len equ $ - text


section .text
;global _start
;_start:
	; mov rax, 1
	; mov rdi, 1
	; mov rsi, text
	; mov rdx, text.len
	; syscall
	; mov rax, 60
	; syscall

global compare
compare:
	cmp rdi, rsi
	je zero
	jl negative 
	; jg positive
	positive: mov rax, 1
	ret
	zero: mov rax, 0
	ret
	negative: mov rax, -1
	ret





; DATA Registers (ABCD - X): EAX - AX - AH & AL
; AX - primary accumulator (input/output for arithmetic operands)
; BX - base register, can be used in indexed addressing
; CX - count register, store e.g. loop count in iterative operations
; DX - data register, also an input output register (used in conjunction with AX)

; POINTER Registers (ISB - P): ESP - SP
;

; section .data
; ; The data section is used for declaring initialized data or constants. 
; ; This data does not change at runtime.

; msg db 'Hello, world!', 0xa  ;string to be printed
; len equ $ - msg     ;length of the string

; section .bss
; ; The bss section is used for declaring variables. 

; section .text
; ; The text section contains the actual code.

; 	global _start     ;must be declared for linker (ld)
; _start:	            ;tells linker entry point
;    mov	edx,len     ;message length
;    mov	ecx,msg     ;message to write
;    mov	ebx,1       ;file descriptor (stdout)
;    mov	eax,4       ;system call number (sys_write)
;    int	0x80        ;call kernel
	
;    mov	eax,1       ;system call number (sys_exit)
;    int	0x80        ;call kernel