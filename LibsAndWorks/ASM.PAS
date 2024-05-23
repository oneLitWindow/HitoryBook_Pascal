        uses ncrt;
        procedure resetcursor;
        begin
        asm
        mov ah,02
        mov bh,00
        mov dl,00
        mov dh,00
        int 10h
        end;
        end;

        procedure clrscr(X, Y : byte);
        begin
        x:=x+(y*16);
        asm
        mov ah,06
        mov al,00
        MOV BH, X
        mov cl,00
        mov ch,00
        mov dl,79
        mov dh,24
        int 10h
        end;
        end;

        procedure cursorsize(X, Y : byte);
        begin
        asm
        mov ah,01
        mov ch, x
        mov cl, y
        int 10h
        end;
        end;

begin
resetcursor;
clrscr(9,0);
cursorsize(0,8);
readln;
end.
