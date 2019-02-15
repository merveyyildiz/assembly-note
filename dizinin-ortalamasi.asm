; multi-segment executable file template.

data segment
    sayilar db 2,4,6,5,8
    toplam db ?
    ort db ?
    bol5 db 5
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

    lea bx, sayilar
    mov cx,5
    dongu:
    mov al,[bx]
    inc bx
    add toplam,al
    loop dongu
    
    mov ax,0
    mov al,toplam
    div bol5
    mov ort, al
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
