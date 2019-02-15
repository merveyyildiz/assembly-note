; multi-segment executable file template.

data segment
    sayi db 0 
    fact db 1       
    tmp db 0
    bol db 10
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

     mov ah,01
     int 21h 
     sub al,30h
     mov sayi, al
     
     mov ax,0001
     mov bl,1
     mov cl,sayi
     dongu:
        mul bl
        inc bl
        cmp cl,1
        je cik
        loop dongu
        cik:
        
        mov fact,al
        div bol
        mov bh,ah
        cmp al,10
        jae ucbasamak
        mov bl,al
        add bh,30h
        add bl,30h
        mov ah,02 
        mov dl,bl
        int 21h  
        mov ah,02
        mov dl,bh
        int 21h 
        
        jmp son
        
        ucbasamak:
        mov tmp,ah
        add tmp,30h
        
        mov ah,00
        div bol
        mov bh,ah
        mov bl,al
        add bh,30h
        add bl,30h
        mov ah,02
        mov dl,bl
        int 21h
        mov ah,02
        mov dl,bh
        int 21h
        mov ah,02
        mov dl,tmp
        int 21h
        
        son:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
