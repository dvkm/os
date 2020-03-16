print_hex:
    ; manipulate chars at HEX_OUT to reflect DX
    pusha
    mov bx, 5
.loop:
    cmp bx, 2
    jl .done

    mov cx, dx
    and cx, 0x000f
    
    call to_char

    mov [HEX_OUT + bx], cl

    shr dx, 4
    sub bx, 1
    jmp .loop

.done:
    mov bx, HEX_OUT
    call println
    popa
    ret

to_char:
    cmp cx, 0xa
    jl .num
    sub cx, 0xa
    add cx, 'a'
    ret
.num:
    add cx, '0'
    ret

HEX_OUT: db '0x0000', 0
