print:
    pusha
    mov ah, 0x0e
.loop:
    mov al, [bx]
    add bx, 1
    cmp al, 0
    je .done
    int 0x10
    jmp .loop
.done:
    popa
    ret

println:
    pusha
    call print
    mov bx, newline
    call print
    popa
    ret

newline:
    db 13, 10, 0