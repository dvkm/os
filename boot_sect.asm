[org 0x7c00]

mov bx, boot_string     ; store  the  value  to  print in dx
call println            ; call  the  function

mov bx, exit_string     ; store  the  value  to  print in dx
call println            ; call  the  function

jmp $                   ; Jump  forever.

%include "print.asm"
%include "print_hex.asm"
; %include "disk_load.asm"

; Global variables
boot_string:
    db "Booting OS...", 0

exit_string:
    db "Exiting OS...", 0

; Padding  and  magic  BIOS  number.    
times  510-($-$$) db 0
dw 0xaa55