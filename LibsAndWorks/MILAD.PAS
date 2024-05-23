uses ncrt;

procedure rightwrite(s:string);
begin
gotoxy(81-length(s),wherey);
write(s);
end;


procedure rrightwriteln(s:real);
var s2:string;
begin
str(s:0:3,s2) ;
gotoxy(81-length(s2),wherey);
writeln(s2);
end;


procedure rightwriteln(s:string);
begin
gotoxy(81-length(s),wherey);
writeln(s);
end;

procedure ghazanfar(var i:integer);
var c:char;
    s:string;
    j,j1:integer;
begin
s:='';
repeat
c:=readkey;
if (c>='0') and (c<='9') and (length(s)<3) then s:=s+c;
if c=#8 then begin
if length(s)=1 then s:='';
if length(s)>1 then s:=copy(s,1,length(s)-1);
gotoxy(79-length(s),wherey);
write(' ');
end;
if length(s)>0 then begin
gotoxy(80-length(s),wherey);
write(s);
end;
until (c=#13);
writeln;
val (s,j,j1);
i:=j;
end;



var
     num:array[1..10] of integer;
     i,sum:integer;
     avg:real;

begin
     clrscr;
     rightwriteln(' ¢¡ô‘÷ù“');
     rightwriteln(' !¢‘ş“öî ¢¤ ¤ ø›ª÷¢ –¤õ÷');
     for i:=1 to 10 do
         begin
         ghazanfar(num[i]);
         rightwriteln('ı¢ã“ù¤õ÷');
         sum:=num[i]+sum;
         end;
         avg:=sum/i;
         rightwriteln(' !!! öî ñ‘û  øó¢ãõ');
         rrightwriteln(avg);

     readln;

end.