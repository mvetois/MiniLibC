BITS 64
section .text
global memcpy

memcpy:
    xor rcx, rcx

while:
    cmp rcx, rdx
    je return
    mov al, BYTE [rsi+rcx]
    mov BYTE [rdi+rcx], al
    inc rcx
    jmp while

return:
    mov rax, rdi
    ret