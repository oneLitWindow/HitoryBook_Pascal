        begin
        asm
        mov ah,02
        mov bh,00
        mov dl,00
        mov dh,00
        int 10h
        mov ah,06
        mov al,00
        MOV BH,12
        mov cl,00 
        mov ch,00
        mov dl,79
        mov dh,24
        int 10h
        mov ah,01
        mov ch, 8
        mov cl, 7
        int 10h
        end;
        end.