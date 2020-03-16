[org 0x7c00]
KERNEL_OFFSET equ 0x1000

    mov bx, boot_string     ; store  the  value  to  print in dx
    call println            ; call  the  function

    mov bp, 0x9000          ; set the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call println

    call load_kernel
    call switch_to_pm


    mov bx, exit_string     ; store  the  value  to  print in dx
    call println            ; call  the  function

    jmp $                   ; Jump  forever.

%include "print.asm"
%include "print_hex.asm"
%include "gdt.asm"
%include "print_pm.asm"
%include "switch_to_pm.asm"
%include "disk_load.asm"

[bits 16]
load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call println

    mov bx, KERNEL_OFFSET
    mov dh, 16
    mov dl, [BOOT_DRIVE]
    call disk_load
    ret

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_pm
    call KERNEL_OFFSET
    jmp $

; Global variables
boot_string:
    db "Booting OS...", 0

exit_string:
    db "Exiting OS...", 0

BOOT_DRIVE db 0
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory", 0

; Padding  and  magic  BIOS  number.    
times  510-($-$$) db 0
dw 0xaa55