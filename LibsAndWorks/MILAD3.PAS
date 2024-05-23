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
gotoxy(80,wherey);
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
   array1:array[1..10] of integer;
   i,j,n,t:integer;
begin
    clrscr;
    rightwriteln('Œ¢ş÷î ¢¤ø ı¥‘¨’—¤õı¤“ ¢şûø¡üõ ¢¢ä ‘— ¢÷');
    ghazanfar(n);
    rightwriteln('!!! ¢ş÷î ¢¤ø ı¥‘¨ ’—¤õ –ú› ¤ ¢ø¡ ¢¢ä ‘ê¯ó');
    i:=0;
    j:=0;
    for i:=1 to n do
        ghazanfar(array1[i]);

        for i:=1 to n-1 do
        for j:=1 to n-i do
          if array1[j]>array1[j+1] then begin
            t:=array1[j];
            array1[j]:=array1[j+1];
            array1[j+1]:=t;
          end;

    for i:=1 to n do
        writeln(array1[i]);

    readln;

end.