uses ncrt;
type num50=array[1..100] of byte;
     num2=array[1..2] of byte;
     var x,y:num50;
     i,k:integer;
     jj:num2;
function log(x:integer):integer;
var i,j:integer;
begin
j:=0;
while x>0 do begin
j:=j+1;
x:=x div 10;
end;
log:=j;
end;
procedure mult(i:num2);
var m,n:integer;
begin
for n:=1 to 50 do begin
y[n]:=0;
end;
for n:=1 to 2 do begin
for m:=1 to 100 do begin
y[m]:=y[m]+(x[(m+n)-1]*i[n]);
if (y[m]>10) and (m<100) then begin;y[m-1]:=y[m-1]+(y[m] div 10);y[m]:=y[m] mod 10;end;
{gotoxy (1,1);
writeln (m);}
end;
end;
x:=y;
end;
begin
for i:=1 to 100 do begin
x[i]:=0;
end;
x[1]:=1;
for i:=1 to 50 do begin
jj[1]:=i mod 10;
jj[2]:=i div 10;
mult (jj);
end;
clrscr;
write ('50! = ');
k:=0;
for i:=100 downto 1 do begin
if x[i]<>0 then begin;write(x[i]);k:=1;end;
if (x[i]=0) and (k=1) then begin;write(x[i]);end;
end;
writeln;
end.