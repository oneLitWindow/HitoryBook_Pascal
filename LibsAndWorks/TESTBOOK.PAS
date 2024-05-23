uses ncrt;
 type arec=record
      name:string;
      code:integer;
      mojood:boolean;
      end;
 var  amod:array[1..5] of arec;
      bookfile:file of arec;
      c:char;
      i:integer;
      j:arec;
begin
     assign(bookfile,'ali.txt');
     rewrite(bookfile);
     for i:=1 to 5 do
     begin
     clrscr;
     gotoxy(4,33);
     write('Enter',i:2,' book name: ');
     readln(amod[i].name);
     gotoxy(5,33);
     write('Enter',i:2,' book code: ');
     readln(amod[i].code);
     gotoxy(6,33);
     write('Is this',i:2,' book lended? (y/n): ');
     c:=readkey;
     if c=#121 then amod[i].mojood:=true
     else if c=#110 then amod[i].mojood:=false;
     write(bookfile,amod[i])
     end;
     clrscr;
     for i:=0 to 4 do begin
     seek(bookfile,i);
     read(bookfile,j);
     writeln;
     writeln(i+1:2,' name : ',j.name);
     writeln('   code : ',j.code);
     writeln('   lended : ',j.mojood);
     end;
     readln;
end.





