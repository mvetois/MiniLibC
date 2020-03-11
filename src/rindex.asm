BITS 64
section .text
global rindex

rindex:
    xor rax, rax

end_str:
    cmp BYTE [rdi], 0
    je while
    inc rdi
    jmp end_str

while:
    cmp sil, 0
    je return
    dec rdi
    cmp BYTE [rdi], sil
    je return
    cmp BYTE [rdi], 0
    je  return_zero
    jmp while

return:
    mov rax, rdi
    ret

return_zero:
    mov rax, 0
    ret
