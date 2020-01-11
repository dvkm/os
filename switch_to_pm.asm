[bits 16]
; Switch to protected mode
switch_to_pm:
    cli                         ; Turn off interrupts until switched to protected mode
    
    lgdt [gdt_descriptor]       ; Load global descriptor table. It defines the protected mode segments
    
    mov eax, cr0                ; set first bit of control register
    or eax, 0x1                 ; 0001 in binary
    mov cr0, eax
    
    jmp CODE_SEG:init_pm        ; Make a far jump ( i.e. to a new segment ) to our 32 - bit
                                ; code. This also forces the CPU to flush its cache of
                                ; pre - fetched and real - mode decoded instructions , which can
                                ; cause problems.
    

[bits 32]
; Initialise registers and the stack once in PM.
init_pm:
    mov ax, DATA_SEG            ; In PM now and old segments are meaningless
    mov ds, ax                  ; So we point our segment register to the
    mov ss, ax                  ; data selectors in GDT
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000            ; Update our stack position so it is right at the top of the free space
    mov esp, ebp

    call BEGIN_PM
