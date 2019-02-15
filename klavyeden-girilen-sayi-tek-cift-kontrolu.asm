; multi-segment executable file template.

data segment
  string1 db "cift$"
  string2 db "tek$"
ends

stack segment
   
ends

code segment
start:
; set segment registers:
  mov ax, data
  mov ds,ax
  
  mov ah,01
  int 21h
  
  mov dl,2
  div dl
  cmp ah,0
  je ciftt:
  
  mov ah,09
  lea dx,string2
  int 21h
  jmp son
  
  ciftt:
  mov ah,09
  lea dx,string1
  int 21h
  
  son:
  mov ax,4c00h
  int 21h
       
ends

end start ; set entry point and stop the assembler.
