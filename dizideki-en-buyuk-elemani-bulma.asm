; multi-segment executable file template.

data segment
    dizi db 3,4,5,6,2 
    enbuyuk db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

   lea si, dizi
   mov bl,[si]
   mov cx,4
   dongu:
    inc si
    cmp bl,[si]
    jb degis
    devam:
    loop dongu
   jmp son
   
   degis:
    mov bl,[si]
    jmp devam 
   
   son:
   mov enbuyuk,bl
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
