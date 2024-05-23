uses graph,ncrt;
const max=10;
var i:array[1..10] of integer;
    a:array[1..10] of real;
    x:array[1..max] of integer;
    y:array[1..max] of integer;
    q:array[1..max] of integer;
    s:array[1..max] of string;
    degree:double;
    myx,myy:double;
    drew:boolean;
function pow(i:double;p:integer):double;
var j:integer;
begin
for j:=2 to p do
i:=i*i;
pow:=i;
end;
function sgn(i:double):integer;
begin
if (i>0) then sgn:=1;
if (i<0) then sgn:=-1;
if (i=0) then sgn:=0;
end;
procedure makee(xx:double;yy:double;var ex:double;var ey:double);
var j:integer;
    rrr,r,dx,dy:double;
begin
ex:=0;
ey:=0;
for j:=1 to i[3] do begin
dx:=xx-x[j];
dy:=yy-y[j];
r:=(dx*dx)+(dy*dy);
rrr:=(r*r*r)/100;
ey:=ey+(dy)*(( ( q[j] ) / (rrr)   ));
ex:=ex+(dx)*(( ( q[j] ) / (rrr)   ));
end;
ey:=sgn(q[i[1]])*ey;
ex:=sgn(q[i[1]])*ex;
end;
procedure drawv(xx:double;yy:double);
var shib,ex,ey,xxx,yyy,ee:double;
    xoo,yoo,xo,yo:integer;
    isset:boolean;
    zarib:integer;
begin
zarib:=1;
xxx:=xx;
yyy:=yy; {9712224}
xo:=trunc(xxx);
yo:=trunc(yyy);
isset:=false;
while (not keypressed) do
begin
if (trunc(xxx)<>xoo)or (trunc(yyy)<>yoo) then putpixel(trunc(xxx),trunc(yyy),4);
xoo:=trunc(xxx);
yoo:=trunc(yyy);
makee(xxx,yyy,ex,ey);
{shib:=ey/ex;}
{yyy:=yyy+}
ey:=ey;
ex:=ex;
ee:=abs(ex)+abs(ey);
if (not isset) then begin
zarib:=trunc(0.1/abs(ee));
if (zarib=0) then zarib:=1;
isset:=true;
end;


xxx:=xxx+(-ey*zarib);
yyy:=yyy+(ex*zarib);
if ((getpixel(trunc(xxx),trunc(yyy))=4)and((trunc(xxx)<>xo)or(trunc(yyy)<>yo))) then break;
xo:=trunc(xxx);
yo:=trunc(yyy);
end;
{if (readkey=#27) then halt;}
end;

procedure drawepix(xx:double;yy:double);
var shib,ex,ey,xxx,yyy,dx,dy,ee:double;
    isset:boolean;
    xo,yo,zarib:integer;
c:char;
begin
zarib:=1;
isset:=false;
xxx:=xx;
yyy:=yy; {9712224}
while ((1=1) or (not keypressed)) do
begin
if ((getpixel(trunc(xxx),trunc(yyy))=2)and((trunc(xxx)<>xo)or(trunc(yyy)<>yo))) then break;
if (trunc(xxx)<>xo)or (trunc(yyy)<>yo) then putpixel(trunc(xxx),trunc(yyy),2);
xo:=trunc(xxx);
yo:=trunc(yyy);
makee(xxx,yyy,ex,ey);
ee:=abs(ex)+abs(ey);
{if ((ee<0.001)and(not isset)) then begin
zarib:=trunc(0.1/abs(ee));
if (zarib=0) then zarib:=1;
isset:=true;
end;}

{shib:=ey/ex;}
{yyy:=yyy+}
xxx:=xxx+(ex*zarib);
yyy:=yyy+(ey*zarib);
if (((trunc(dx)<>trunc(xxx))or(trunc(dy)<>trunc(yyy)))and(not drew)and(trunc(dx+dy)mod 10=0)) then begin
drawv(xxx,yyy);
end;
dx:=xxx;
dy:=yyy;
if (keypressed) then begin
c:=readkey;
if (c=#13) then drawv(xxx,yyy);
if (c=#27) then halt;
if (c=#32) then break;
end;
end;
{if (readkey=#27) then halt;}
end;



begin
i[1]:=3;{detect;{installuserdriver('svga256',nil);}
i[2]:=1;
clrscr;
textcolor (14);
writeln ('Enter positions and Colons (0 to abort:)');
for i[3]:=1 to max do begin
textcolor (15);
write ('Enter X',i[3],': ');
textcolor (10);
readln(x[i[3]]);
if x[i[3]]<=0 then begin;i[3]:=i[3]-1;break;end;
textcolor (15);
write ('Enter Y',i[3],': ');
textcolor (10);
readln(y[i[3]]);
if y[i[3]]<=0 then begin;i[3]:=i[3]-1;break;end;
textcolor (15);
write ('Enter Q',i[3],': ');
textcolor (10);
readln(q[i[3]]);
if q[i[3]]=0 then begin;i[3]:=i[3]-1;break;end;
textcolor (9);
writeln ('-----------------');
end;
{writeln (i[3]);
readkey;}
if i[3]=0 then halt;
initgraph(i[1],i[2],'..\bgi');
for i[1]:=1 to i[3] do begin
if (q[i[1]]<0) then begin;s[1]:='-';i[2]:=12;end else begin;i[2]:=10;s[1]:='+';end;
setcolor (i[2]);
circle (x[i[1]],y[i[1]],5);
settextstyle (0,0,1);
str(q[i[1]],s[2]);
outtextxy (x[i[1]]+5,y[i[1]]+5,s[2]);
setcolor (15);
outtextxy (x[i[1]]-3,y[i[1]]-3,s[1]);
end;
for i[1]:=1 to i[3] do begin
drew:=false;
for i[2]:=1 to 10 do begin
degree:=(i[2]/10)*(pi*2);
myx:=x[i[1]]-(7*cos(degree));
myy:=y[i[1]]-(7*sin(degree));
putpixel(trunc(myx),trunc(myy),15);
drawepix(myx,myy);
putpixel(trunc(myx),trunc(myy),15);
drew:=true;
end;
end;
outtextxy (0,0,'END! - Amin Safinejad 8453308');
readkey;
end.