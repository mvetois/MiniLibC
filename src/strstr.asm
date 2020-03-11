BITS 64
section .text
global strstr

strstr:
    mov rax, rdi
    cmp BYTE [rsi], 0
    jne while
    cmp BYTE [rax], 0
    jne while
    ret

while:
    xor rcx, rcx
    cmp BYTE [rax], 0
    je return_zero

while_two:
    mov r8b, BYTE [rax]
    cmp BYTE [rsi + rcx], r8b
    jne increment
    cmp BYTE [rax], 0
    je increment
    inc rax
    inc rcx
    jmp while_two

increment:
    cmp BYTE [rsi + rcx], 0
    je return
    inc rax
    jmp while

return:
    sub rax, rcx
    ret

return_zero:
    xor rax, rax
    ret
