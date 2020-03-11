BITS 64
section .text
global memmove

memmove:
    cmp rdx, 0
    je return
    xor rcx, rcx
    jmp write

write:
    cmp rcx, rdx
    je read
    movsx rbx, BYTE [rsi+rcx]
    push rbx
    inc rcx
    jmp write

read:
    dec rcx
    pop rbx
    mov BYTE [rdi+rcx], bl
    cmp rcx, 0
    je return
    jmp read

return:
    mov rax, rdi
    ret