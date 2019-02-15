; multi-segment executable file template.

data segment
    sayi db 4 dup(0)
    temp db 0
    temp2 db 0
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

   mov cx,4 
   lea si,sayi
   dongu:    
    mov ah, 1
    int 21h
    sub al,30h
    mov [si],al
    inc si
    loop dongu 
    
    lea si,sayi
    mov cx,03h
    dongu2:
    lea si,sayi
    push cx
    mov cx,3
    dongu3:
    
    mov al,[si]
    cmp al,[si+1]
    ja buyuk
    gel:
    inc si
    loop dongu3 
     pop cx
    loop dongu2
    
    jmp son
    
    buyuk:
    mov al,[si+1]
    mov ah,[si]
    mov [si],al 
    mov [si+1],ah
    
    jmp gel
    son:
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
