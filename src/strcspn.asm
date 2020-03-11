BITS 64
section .text
global strcspn

strcspn:
    xor rcx, rcx

while:
    xor r8, r8
    mov al, BYTE [rdi + rcx]
    cmp BYTE [rdi + rcx], 0
    je return_zero
    inc rcx

while_two:
    cmp al, BYTE [rsi + r8]
    je return
    cmp BYTE [rsi + r8], 0
    je while
    inc r8
    jmp while_two

return:
    sub rcx, 1
    mov rax, rcx
    ret

return_zero:
    mov rax, rcx
    ret