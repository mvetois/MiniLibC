BITS 64
section .text
global strcmp

strcmp:
    xor rbx, rbx
    xor rcx, rcx

compare:
    mov byte bl, [rsi + rcx]
    mov dl, BYTE [rsi + rcx]
    cmp byte [rdi + rcx], bl
    jne return
    cmp byte bl, 0x00
    je return
    inc rcx
    jmp compare

return:
    xor rdx, rdx
    mov byte dl, [rdi + rcx]
    sub rbx, rdx
    neg rbx
    mov rax, rbx
    ret