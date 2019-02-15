; multi-segment executable file template.

data segment
    isim db '*$'
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
    
     mov cx,5
     git:
     mov dh,1 
    
    basla:
    call k
    call yaz
    inc dl
    inc dh
    cmp dh,5
    jne basla
    
    basla2: 
   
    call k
    call yaz
    inc dl
    dec dh
    cmp dh,1 
    jne basla2
    loop git  
    
     
    k proc
        mov ah,02h
        mov bh,00h ;sayfa
        int 10h
        ret
         k endp
    yaz proc
        push dx 
        lea dx,isim
        mov ah,09h
        int 21h
        pop dx
        ret
        yaz endp
    
  
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
