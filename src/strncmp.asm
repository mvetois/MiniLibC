BITS 64
section .text
global strncmp

strncmp:
    xor rax, rax
    cmp rdx, 0
    je return_zero
    dec rdx

while:
    mov al, BYTE[rdi]
    cmp BYTE[rsi], al
    jne return
    cmp BYTE[rdi], 0
    je return_zero
    cmp rdx, 0
    je return_zero
    dec rdx
    inc rsi
    inc rdi
    jmp while

return_zero:
    xor rax, rax
    ret

return:
    xor ecx, ecx
    mov cl, BYTE[rsi]
    sub eax, ecx
    ret
