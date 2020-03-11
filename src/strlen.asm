BITS 64
section .text
global strlen

strlen:
    xor ecx, ecx
    jmp while

inc:
    inc ecx

while:
    movsx rdx, ecx
    mov sil, BYTE [rdi+rdx]
    cmp sil, 0
    jne inc
    mov eax, ecx
    ret