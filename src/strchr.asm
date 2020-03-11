BITS 64
section .text
global strchr

strchr:
    xor rcx, rcx

while:
    cmp BYTE [rdi+rcx], sil
    je return
    cmp BYTE [rdi+rcx], 0
    je error
    inc rcx
    jmp while

error:
    xor rax, rax
    ret

return:
    mov rax, rdi
    add rax, rcx
    ret