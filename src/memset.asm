BITS 64
section .text
global memset

memset:
    xor rcx, rcx
    jmp while
inc:
    inc rcx

while:
    cmp rcx, rdx
    je return
    mov BYTE [rdi+rcx], sil
    jmp inc

return:
    mov rax, rdi
    ret