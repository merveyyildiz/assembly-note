; multi-segment executable file template.

data segment
    sayi db 21,42,5,17,8,9,51,12,32,3
    bol db 10
    sayac db 0
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
    
    lea si,sayi
    mov cx,10 
    mov ax,00h
    dongu:    
    add al,[si]
    inc si
    loop dongu
    
    div bol
    mov cx,10
    lea si,sayi
    dongu2:
    cmp al,[si]
    jb buyuk
    inc si
    loop dongu2
    jmp son:
    
    buyuk:
    inc sayac
    inc si
    loop dongu2
    son:
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
