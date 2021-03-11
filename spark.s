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
