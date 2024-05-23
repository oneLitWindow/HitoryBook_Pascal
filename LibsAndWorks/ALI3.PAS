program Arya;
uses ncrt;
const
     a=512;
var
     look:array[1..a] of integer;
     salaki,s:string;
     m,n,i,k,u,j,h,g,v:longint;
     e:integer;
     r:boolean;
     c,w:char;
{*****************************}
function farsinum(t:string):string;
var i:integer;
    s1:string;
begin
     s1:=t;
     for i:=1 to length(t) do
     begin
          case t[i] of
               '1':s1[i]:='Å';
               '2':s1[i]:='Ç';
               '3':s1[i]:='É';
               '4':s1[i]:='Ñ';
               '5':s1[i]:='Ö';
               '6':s1[i]:='Ü';
               '7':s1[i]:='á';
               '8':s1[i]:='à';
               '9':s1[i]:='â';
               '0':s1[i]:='Ä';
          end;
     end;
     farsinum:=s1;
end;
{*****************************}
function getanum:string;
var i:array[1..10] of integer;
    c:char;
    s:string;
    x,y:integer;
begin
     x:=wherex;
     y:=wherey;
     s:='';
     repeat
           c:=readkey;
           if   ((pos(c,'0123456789')<>0)  or ((c='-')and(s='')))then
           begin
                s:=s+c;
           end;
           if ((c=#8)and (s<>'')) then
           begin
                s:=copy(s,1,length(s)-1);
           end;
           if(((pos(c,'0123456789')=0)) and (c<>#8) or ((c='-')and(s='')))then
           begin
                sound(2200);
                delay(1000);
                nosound;
           end;
           gotoxy (x,y);
           write (farsinum(s),' ',#8);
     until ((c=#27) or (c=#13));
     getanum:=s;
     writeln;
end;
{*****************************}
procedure l1;
begin
     for j:=1 to 40 do begin
          for i:=1 to 24 do begin
          gotoxy(j,i);
          textcolor(10);
          write('∫');
          gotoxy(80-j,25-i);
          write('∫');
          textcolor(1);
          gotoxy(j-1,i);
          write('∫');
          gotoxy(81-j,25-i);
          write('∫');
          end;
          delay(200);
     end;
end;
{*****************************}
procedure t(q:string;h,g,r:integer);
begin
     for i:=1 to length(q) do
     begin
          gotoxy(h-i+length(q),g);
          textcolor(r);
          write (copy(q,1,i));
          delay(100);
     end;
end;
{******************************}
procedure l(q:string;h,g,r:integer);
begin
     q:=' 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 ';
     for i:=1 to length(q) do
     begin
          gotoxy(h,g);
          for j:=(length(q)-i+1) to length(q) do
          begin
               r:=i+j;
               if r>16 then
                  r:=r mod 16;
               if r mod 17=1 then
                  r:=4;
               textcolor(r);
               write(q[j]);
          end;
          delay(70);
     end;
end;
{*****************************}
procedure l2(q:string;h,g,r:integer);
var  d,f:integer;
begin
     q:=' 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 ';
     for i:=1 to length(q) do
     begin
          gotoxy(h,g);
          for j:=(length(q)-i+1) to length(q) do
          begin
               r:=i+j;
               if r>16 then
                  r:=r mod 16;
               if r mod 17=1 then
                  r:=4;
               textcolor(r);
               write(q[j]);
          end;
          delay(70);
     end;
     for i:=1 to 20 do
     begin
          gotoxy(h,g);
          d:=h;
          f:=1;
          for j:=1 to length(q) do
          begin
               d:=d+1;
               f:=f+1;
               r:=i+j;
               if r>16 then
                  r:=r mod 16;
               if r mod 17=1 then
                  r:=4;
               textcolor(r);
               gotoxy(d,g);
               write(q[j]);
               gotoxy(f,4);
               write(q[j]);
          delay(5);
          end;
     end;
end;
{*****************************}
function menu:integer;
begin
    c:=#0;
    i:=1;
    repeat
         gotoxy(66,11);
         if i=1 then begin textbackground(0);textcolor(10);end
         else begin textcolor(11);textbackground(1);end;
         writeln('.˝§ê£ ¢Ó .Å');gotoxy(66,12);
         if i=2 then begin textbackground(0);textcolor(10);end
         else begin textcolor(11);textbackground(1);end;
         writeln('.˝§ê¢§ì ¢Ó.Ç'); gotoxy(71-5,13);
         if i=3 then begin textbackground(0);textcolor(10);end
         else begin textcolor(11);textbackground(1);end;
         writeln('     .ö¯§°.É');textbackground(1);
         c:=readkey;
         if c=chr(72) then i:=i-1;
         if c=chr(80) then i:=i+1;
         if i>3 then i:=1;
         if i<1 then i:=3;
    until c=chr(13);
    menu:=i;
end;
{*****************************}
begin
     textmode(3);
     textbackground(1);
     textcolor(11);
     clrscr;
     u:=0;
     n:=0;
     i:=0;
     k:=0;
     e:=0;
     j:=0;
     l('rwe',1,4,1);
     t('**** ë˛§ç **** ',33 ,5,11);
     t('****  ˆëì§˙ı ¯ ˘¢˜™°ì ¢˜¯ê¢° Ùë˜ ˘ì  **** ',19,6,12);
     t('!!¢˛¢ıç ©¯° ë˛§ç ˘ıë˜§ì ˘ì äÙëÛ® ',46,8,14);
     t('.ßÓ„Ûëì ë˛ ¢˛˜Ó ¢Ó ê§ ˆëó ˘ê¯°Û¢ ¢ê¢‰ê ¢˛˜ê¯ó ¸ı ˘ıë˜§ì ˆ˛ê Ø®¯ó ëı™ ',10,9,14);
     t('.˝§ê£ ¢Ó .Å',66,11,10);
     t('.˝§ê¢§ì ¢Ó.Ç' ,66,12,11);
     t('.ö¯§°.É',71,13,11);
     for j:=1 to 50 do
     begin
          gotoxy(1,15);
          write('                                                                                                    ');
          gotoxy(1,16);
          write('                                                                                                    ');
          gotoxy(1,17);
          write('                                                                                                    ');
          gotoxy(1,18);
          write('                                                                                                    ');
          gotoxy(1,19);
          writeln('                                                                                                    ');
          m:=menu;
          if m=3 then
             break;
          t(':¢˛˛ëı˜ ¢§ê¯ ê§§‡˜ ¢§¯ı ¢¢‰ ëÍØÛ',46,15,4);
          gotoxy(1,16);
          s:=getanum;
          u:=length(s);
          if (s[1]='-') then
          begin
               r:=true;
               for i:=1 to u  do
                   s[i]:=s[i+1];
               u:=u-1;
          end;
          for i:=1 to u do
          begin
               w:=s[i];
               val(w,n,e);
               if m=1 then
                  k:=(n+(u mod 10)) mod 10;
               if m=2 then
                  k:=(n+10-(u mod 10)) mod 10;
               look[(u+1)-i]:=k;
          end;
          textcolor(11);
          for i:=1 to u do
          begin
               if ((i=1) and (r=true))then
               begin
                    r:=false;
                    write ('-');
               end;
               str (look[i],salaki);
               write(farsinum(salaki));
          end;
          readkey;
     end;
     l2('dhf',1,15,1);
     l1;
end.
