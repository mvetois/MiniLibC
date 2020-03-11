BITS 64
section .text
global strpbrk

strpbrk:
    xor rcx, rcx

while:
    mov al, BYTE [rdi + rcx]
    cmp BYTE [rdi + rcx], 0
    je return_zero
    inc rcx
    xor r8, r8

while_sub:
    cmp BYTE [rsi + r8], 0
    je while
    cmp al, BYTE [rsi + r8]
    je return
    inc r8
    jmp while_sub

return:
    sub rcx, 1
    add rdi, rcx
    mov rax, rdi
    ret

return_zero:
    mov rax, 0
    ret
