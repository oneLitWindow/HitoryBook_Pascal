{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
unit ketabs2;
interface
uses textef,easyer,mousedrv,ncrt,dos,screen,kdbtype;
var
sr,alakis:string;
    mode:byte;
    ii:array[1..10] of integer;
    i:integer;
    prt:integer;
    jj:array[1..10] of integer;

const
memberlistord:integer=1;
memberliststartord:longint=0;
editis:boolean=false;
insertrefresh:boolean=false;
godflag:integer=0;
ktbflag:integer=0;
godtest:integer=0;
desc:string='';
desco:string='';
insertis:boolean=false;
numberofbooks:longint=0;
totalbooks:longint=0;
      startlistord:longint=0;
      startlistordo:longint=0;
      listordo:longint=1;
      listord:longint=1;
      name:string='';
      bgroup:string10='';
      statue:string='';
      bnumb:string6='';
            sortme:string='numberonly';
      beforeopens= '¦ø¢£¤¥¯àğîõ÷—‘ó“ş¨ª›Ÿ¡úãçêì™¬®•ÿ';
      englishkeyb= ' `1234567890-=~!@#$%^&*()_+qwertyuiop[]asd×fghjkl;''zxcvbnm,|ßÜİ./QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?\';
            farsiz= ' •‚ƒ„…†‡ˆ‰€-=”!"/$%:Š*()‹+®¬™ìêçãú¡Ÿ›ª¨şş“ó‘—÷õîğà¯¥¤£¢øäèû./­«˜ëéåáù šœ©§ı’ñ–öôíïà¯[];¢<>Œ¦';
            endeds= ' ”‚ƒ„…†‡ˆ‰€-=”!"/$%:Š*()‹+­«˜ëéæâù šœ©§üı’ñ‘–öôíïà¯¥¤£¢øáåù./­«˜ëéåáù šœ©§ı’ñ–öôíïà¯[];¢<>Œ¦';
         endopens= '¯àğîõ÷—ó“ş¨ª›Ÿ¡ûúèäãçêì™¬®•';
  days : array [0..6] of String[9] =
    (' ù“÷ªíş ',' ù“÷ªø¢ ',' ù“÷ªù¨ ','ù“÷ª¤‘ú','ù“÷ªš÷• ','  ùãõ›  ','  ù“÷ª  ');
  days2 : array [0..6] of String[1] =
    ('ı','¢','§','œ','”','š','©');
procedure membermenu;
function notexist1(defined:booktype):boolean;
function englishnum(s:string):integer;
function get60str(str60:string60):string60;
function get8dgt(str8:string8):string8;
function validdate(d:string8):boolean;
function date:string8;
function time:string8;
function dateget(flag:boolean;d:string8):string8;
function farsinum(s:string):string;
function farsinum1(s:char):char;
function fixof(s,adds:string;len:integer):string;
procedure fixla(var s:string);
procedure endopend(var name1:string);
function beforeopen(s:string):boolean;
function getstring(thisbook:booktype;x,y,xlength,ylength,fcolor,bcolor:integer;neop:boolean):string;
function farsi(s:string):string;
{procedure deletemenu(thisbook:booktype);}
function Zerof(w : integer) : String;
procedure writetime;
function endopen(s:string):boolean;
procedure editmenu(var thisbook:booktype);
procedure selectmenu;
procedure sortmenu(var sortorder:string);
function validchar(c:char):boolean;
function choose(choices:string;beginx,beginy:integer;color:integer) : integer;
function endend(s:string):string;
procedure fixbeginproblem(var s:string;name1:string);

implementation
function englishnum(s:string):integer;
var s1,s2:string;
    t:integer;
begin
s2:='';
for t:=1 to length(s) do begin
s1:=copy(s,t,1);
if s1= '€' then s2:=s2+'0' else
if s1= '' then s2:=s2+'1' else
if s1= '‚' then s2:=s2+'2' else
if s1= 'ƒ' then s2:=s2+'3' else
if s1= '„' then s2:=s2+'4' else
if s1= '…' then s2:=s2+'5' else
if s1= '†' then s2:=s2+'6' else
if s1= '‡' then s2:=s2+'7' else
if s1= 'ˆ' then s2:=s2+'8' else
if s1= '‰' then s2:=s2+'9' else s2:=s2+s1;
end;
englishnum:=vali(s2);
end;
function date:string8;
var y,m,d,dow:word;
begin
getdate (y,m,d,dow);
date:=fixof(farsinum(stri(y mod 100)),'€',2)+'/'+fixof(farsinum(stri(m)),'€',2)+'/'+fixof(farsinum(stri(d)),'€',2) ;
end;
function time:string8;
var y,m,d,dow:word;
begin
gettime (y,m,d,dow);
time:=fixof(farsinum(stri(y)),'€',2)+':'+fixof(farsinum(stri(m)),'€',2)+':'+fixof(farsinum(stri(d)),'€',2) ;
end;
function dateget(flag:boolean;d:string8):string8;
var i,io:integer;
    s:string;
    c:char;
    dold:string8;
    x,y:integer;
    ss:cursor;
    validated:boolean;
begin
x:=wherex;
y:=wherey;
{repeat}
validated:=false;
ss.SetCursor(3470);
if (dtrims(d)='') or (dtrims(d)='<ESC>') then d:=date;
s:='-';
c:=#255;
while keypressed do readkey;
dold:='00000000';
i:=1;
repeat
        if (leftbuttonpressed) then begin
        ii[9]:=mousetx;
        ii[10]:=mousety;
        if (mousetx>1) and (mousetx<33) and (mousety=20) then begin;c:=#27;break;end;
        if (ii[10]=6) or (ii[10]=7) then begin
         if (mousetx>01) and (mousetx<07) then begin;mode:=6;break;end;
         if (mousetx>07) and (mousetx<18) then begin;mode:=5;break;end;
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
         if (mousetx>26) and (mousetx<33) then begin;mode:=2;break;end;
         if (mousetx>33) and (mousetx<64) then begin;mode:=1;break;end;
        end;
        {insert ok } if (ii[9]>56) and (ii[9]<64) and (ii[10]=08) then
                        begin;c:=#13;end;
        end;


        if (((mousex/8)+1>56) and ((mousex/8)+1<64) and (trunc(mousey/8)+1=8)) or (prt=56)then textbackground(4)
                                                                                  else textbackground(2);
        gotoxy(57,8);
        textcolor (14);
if editis then begin
        write(' ©ş¤');
        textcolor(11);
        write('ş');
        textcolor (14);
        write('ø');
   end else begin
        write(' ùê‘');
        textcolor(11);
        write('®');
        textcolor (14);
        write(' ');
end;

        if (mousetx>1) and (mousetx<33) and (mousety=20) then textbackground(4)
                                                                                 else textbackground(2);
        gotoxy(2,20);
        textcolor (14);
        if editis then write('      ©ş¤şø ıø÷õ ¥ šø¤¡      ') else
                       write('    ö¢¤î ùê‘® ıø÷õ ¥ šø¤¡    ');



if not keypressed then s:='-';
if not keypressed then c:=#255;
if keypressed then c:=readkey;
if (c=#0) and (keypressed) then begin;c:=readkey;s:=#0+c;end;
if c=#8 then begin;d[i]:='€';i:=i-1;end;
if (s=#0+#75) then i:=i-1;
if (s=#0+#77) then i:=i+1;
if ((s=#0+#75) or (c=#8)) and ((i=3)or(i=6)) then i:=i-1;
if ((s=#0+#77) or (c=#8)) and ((i=3)or(i=6)) then i:=i+1;
if i<1 then i:=8;
if i>8 then i:=1;
if dtrims(d[i])='' then d[i]:='€';
textcolor(15);
textbackground(0);
if pos(c,'0123456789')<>0 then begin;d[i]:=farsinum1(c);end;
if d<>dold then begin
for io:=1 to 8 do begin
if (io=3) or (io=6) then textcolor(9) else textcolor(15);
gotoxy(x+io-1,y);
write(d[io]);
end;
dold:=d;
end;
if pos(c,'0123456789')<>0 then i:=i+1;
if ((i=3)or(i=6)) then i:=i+1;
gotoxy(x+i-1,y);
if (not keypressed) then delay(50);
ss.SetCursor($2000);
writetime;
 ss.SetCursor(8)    ;
until (c=#27) or (c=#9) or (c=#13) or (s=#0+#15);
textcolor(15);
textbackground(1);
for io:=1 to 8 do begin
gotoxy(x+io-1,y);
write(d[io]);
end;
if c=#13 then d[3]:='\';
if (c=#27) then d:='';
gotoxy(x,y);
if c<>#27 then begin
validated:=validdate(d);
if not validated then d:='';
end;
if (c=#27) then begin;validated:=true;d:='<ESC>';end;
dateget:=d;
{halt;}
{until validated;}
end;
function validdate(d:string8):boolean;
var i:integer;
    c:char;
    s:string;
    f:boolean;
    x,y:integer;
year,month,day:integer;
ss:cursor;
begin
ss.SetCursor($2000);
x:=wherex;
y:=wherey;
f:=true;
year:=2000+englishnum(copy(d,1,2));
month:=englishnum(copy(d,4,2));
day:=englishnum(copy(d,7,2));
if (month>12) or (month<1) then f:=false;
if (day>31) or (day<1) then f:=false;
if (year<2005) or (year>2099) then f:=false;
validdate:=f;
if f=false then begin
                gotoxy(x,y);
                textcolor(14);
                textbackground(4);
                write (' ù‘“—ª ');
                       {00/00/00}
                sound(100);
                delay(100);
                nosound;
                delay(1500);
                textcolor(15);
                textbackground(1);
                gotoxy(x,y);
                write ('        ');
                       {00/00/00}
                end;
{writeln (year,',',month,',',day);
halt;}
ss.SetCursor(3470);
end;
function get8dgt(str8:string8):string8;
var x,y,i:integer;
    s1:string;
    ss:string8;
    c:char;
    scr:cursor;
begin
s1:='';
ss:=str8;
x:=wherex;
y:=wherey;
repeat
        if (leftbuttonpressed) then begin
        ii[9]:=mousetx;
        ii[10]:=mousety;
        if (mousetx>1) and (mousetx<33) and (mousety=20) then begin;c:=#27;break;end;
        if (ii[10]=6) or (ii[10]=7) then begin
         if (mousetx>01) and (mousetx<07) then begin;mode:=6;break;end;
         if (mousetx>07) and (mousetx<18) then begin;mode:=5;break;end;
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
         if (mousetx>26) and (mousetx<33) then begin;mode:=2;break;end;
         if (mousetx>33) and (mousetx<64) then begin;mode:=1;break;end;
        end;
        {insert ok } if (ii[9]>56) and (ii[9]<64) and (ii[10]=08) then
                        begin;c:=#13;end;
        end;


        if (((mousex/8)+1>56) and ((mousex/8)+1<64) and (trunc(mousey/8)+1=8)) or (prt=56)then textbackground(4)
                                                                                  else textbackground(2);
        gotoxy(57,8);
        textcolor (14);
if editis then begin
        write(' ©ş¤');
        textcolor(11);
        write('ş');
        textcolor (14);
        write('ø');
   end else begin
        write(' ùê‘');
        textcolor(11);
        write('®');
        textcolor (14);
        write(' ');
end;

        if (mousetx>1) and (mousetx<33) and (mousety=20) then textbackground(4)
                                                                                 else textbackground(2);
        gotoxy(2,20);
        textcolor (14);
        if editis then write('      ©ş¤şø ıø÷õ ¥ šø¤¡      ') else
                       write('    ö¢¤î ùê‘® ıø÷õ ¥ šø¤¡    ');

c:=#255;
scr.setcursor($2000);
writetime;
textbackground(0);
textcolor(15);
if keypressed then c:=readkey;
s1:=c;
if (c=#0) and (keypressed) then begin;c:=readkey;s1:=s1+c;end;
if (pos(c,'1234567890')<>0) and (length(ss)<8) then ss:=ss+farsinum(c);
if ss='€' then ss:='';
if c=#8 then begin
if length(ss)=1 then ss:='';
if length(ss)>1 then ss:=copy(ss,1,length(ss)-1);
end;
gotoxy(x,y);
write (fixof(ss,'€',8));
gotoxy(x+7,y);
{scr.SetCursor(3470);}
 scr.SetCursor(8);
if not keypressed then delay (50);
until (c=#27) or (c=#13) or (s1=#0+#15) or (c=#9);
if c=#27 then ss:='-';
textbackground(1);
textcolor(15);
gotoxy(x,y);
textcolor(9);
write ('€€€€€€€€');
gotoxy((x)+(8-length(ss)),y);
write (ss);
get8dgt:=ss;
end;

function get60str(str60:string60):string60;
var c:char;
    s,s1:string;
    cur:cursor;
    y:integer;
begin
y:=wherey;
              cur.setcursor($2000);
           window(1,1,80,25);
              s1:=str60;
           textbackground(0);
           gotoxy(3,y);
           write (fixof(s1,' ',60));
           textbackground(1);
              write (' ');
              s:='';
              c:=#255;
              repeat
              c:=#255;
              s:=c;
              if keypressed then begin
              c:=readkey;s:=c;
              end;
              if (c=#0) and (keypressed) then begin;c:=readkey;s:=s+readkey;end;
              writetime;
              textcolor(15);

              fixbeginproblem(s,s1);
{              gotoxy(1,1);
              write (farsi(s));}
              if (beforeopen(farsi(s))) and (not endopen(s1)) then endopend(s1);
              if (not beforeopen(farsi(s))) then s1:=endend(s1);
        {M}   if (validchar(c)) and (length(s1)<60) and (length(s)=1) then s1:=farsi(s)+(s1);
              if (c=#8) and (length(s1)>0) then begin
        {O}   if (copy(s1,1,1)='ò') then begin
              if length(s1)=1 then s1:='ó';
        {D}   if length(s1)>1 then s1:='ó'+copy(s1,2,length(s1)-1);
              end else begin
        {E}   s1:=copy(s1,2,length(s1)-1);
              end;
        {1}   end;
              if (s='h') then fixla(s1);



           textbackground(0);
           gotoxy(3,y);
           write (fixof(endend(s1),' ',60));
           cur.SetCursor(3470);
           if 62-length(s1)>2 then gotoxy(62-length(s1),y) else gotoxy(63-length(s1),y);
           textbackground(1);
        delay(30);
              cur.setcursor($2000);
        if (leftbuttonpressed) then begin
        ii[9]:=mousetx;
        ii[10]:=mousety;
        if (mousetx>1) and (mousetx<33) and (mousety=20) then begin;c:=#27;break;end;
        if (ii[10]=6) or (ii[10]=7) then begin
         if (mousetx>01) and (mousetx<07) then begin;mode:=6;break;end;
         if (mousetx>07) and (mousetx<18) then begin;mode:=5;break;end;
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
         if (mousetx>26) and (mousetx<33) then begin;mode:=2;break;end;
         if (mousetx>33) and (mousetx<64) then begin;mode:=1;break;end;
        end;
        {insert ok } if (ii[9]>56) and (ii[9]<64) and (ii[10]=08) then
                        begin;c:=#13;end;
        end;


        if (((mousex/8)+1>56) and ((mousex/8)+1<64) and (trunc(mousey/8)+1=8)) or (prt=56)then textbackground(4)
                                                                                  else textbackground(2);
        gotoxy(57,8);
        textcolor (14);
if editis then begin
        write(' ©ş¤');
        textcolor(11);
        write('ş');
        textcolor (14);
        write('ø');
   end else begin
        write(' ùê‘');
        textcolor(11);
        write('®');
        textcolor (14);
        write(' ');
end;

        if (mousetx>1) and (mousetx<33) and (mousety=20) then textbackground(4)
                                                                                 else textbackground(2);
        gotoxy(2,20);
        textcolor (14);
        if editis then write('      ©ş¤şø ıø÷õ ¥ šø¤¡      ') else
                       write('    ö¢¤î ùê‘® ıø÷õ ¥ šø¤¡    ');

        {end;}

        until (c=#27) or (c=#13) or (c=#9) or (s=#0+#15);
           s1:=dtrims(endend(s1));
           if c=#27 then s1:='';
           textbackground(1);
           gotoxy(3,y);
           write (fixof(endend(s1),' ',60));
           if c=#27 then s1:='<ESC>';
           get60str:=s1;
end;




function farsinum1(s:char):char;
var s1,s2:char;
    t:integer;
begin
s2:=#0;
t:=1;
s1:=s;
if s1= '0' then s2:='€' else
if s1= '1' then s2:='' else
if s1= '2' then s2:='‚' else
if s1= '3' then s2:='ƒ' else
if s1= '4' then s2:='„' else
if s1= '5' then s2:='…' else
if s1= '6' then s2:='†' else
if s1= '7' then s2:='‡' else
if s1= '8' then s2:='ˆ' else
if s1= '9' then s2:='‰' else s2:=s1;
farsinum1:=s2;
end;
function farsinum(s:string):string;
var s1,s2:string;
    t:integer;
begin
s2:='';
for t:=1 to length(s) do begin
s1:=copy(s,t,1);
if s1= '0' then s2:=s2+'€' else
if s1= '1' then s2:=s2+'' else
if s1= '2' then s2:=s2+'‚' else
if s1= '3' then s2:=s2+'ƒ' else
if s1= '4' then s2:=s2+'„' else
if s1= '5' then s2:=s2+'…' else
if s1= '6' then s2:=s2+'†' else
if s1= '7' then s2:=s2+'‡' else
if s1= '8' then s2:=s2+'ˆ' else
if s1= '9' then s2:=s2+'‰' else s2:=s2+s1;
end;
farsinum:=s2;
end;
function fixof(s,adds:string;len:integer):string;
var i,j,k:integer;
begin
repeat
if length(s)<len then s:=adds+s;
until length(s)>=len;
fixof:=s;
end;
procedure fixla(var s:string);
begin
if length(s)>1 then if copy(s,1,2)='‘ó' then begin
if length(s)=2 then s:='ò' else s:='ò'+copy(s,3,length(s)-2);
end;
end;
procedure endopend(var name1:string);
begin
if pos(copy(name1,1,1),endeds) <> 0 then begin
if length(name1)=1 then name1:=copy(farsiz,pos(name1,endeds),1);
if length(name1)>1 then name1:=copy(farsiz,pos(copy(name1,1,1),endeds),1)+copy(name1,2,length(name1)-1);
end;
end;
function beforeopen(s:string):boolean;
begin
if length(s)>1 then s:=copy(s,1,1);
beforeopen:=(pos(s,beforeopens)<>0);
end;
function getstring(thisbook:booktype;x,y,xlength,ylength,fcolor,bcolor:integer;neop:boolean):string;
var ss:cursor;
s:string;
c:char;
bookok:boolean;
definedbook:booktype;
ij,xx,yy:integer;
label endneop;
begin
{desc:=dtrims(definedbook.description);}
{esc:=''{'!¢¦÷üê¬ öşõ .ù¢÷÷ø¡‘şù¢÷¤şğ–÷‘õ ı¤“ô‘çş•   ¢÷÷‘õ ü¯“¤ü“  ñ‘¨õ ü—Ÿ ‘şø '+
      '’‘—î ’ó‘¯õ áø÷ ş®ø— Šù¢÷¨şø÷ô‘÷ ñ™õ ü—‘äò¯¢ş÷î ¢¤ø ¤¢ø¡  ùø¡ó¢ –‘äò¯ ¢ş÷ø— üõ  ü¯¡'+
      '‚„€ –‘Ÿş®ø— öş ¤¢Š–¨ ¤¢“‘—îıùõ‘÷¤“ ¤¢ ’‘—î   –‘Ÿş®ø— ı¤“ù÷øõ÷ ö—õ íşöş'};
{esco:='';}
if neop then begin;desc:=thisbook.description;definedbook.description:='';s:='';goto endneop;end;
        textcolor(fcolor);
        textbackground(bcolor);

xx:=x+xlength;
yy:=y;
ij:=0;
for ij:=1 to 240 do begin
xx:=xx-1;
if xx<65 then begin;yy:=yy+1;xx:=x+xlength-1;end;
gotoxy(xx,yy);
write(' ');
end;

        repeat
        ss.SetCursor($2000);
        if not keypressed then prt:=port[$60] else prt:=0;
        writetime;
{        if name  <>namo    then begin;write ('                              ');namo   :=name;  end;}
        textcolor(fcolor);
        textbackground(bcolor);
xx:=x+xlength;
yy:=y;
ij:=0;
for ij:=1 to length(desc) do begin
xx:=xx-1;
if xx<65 then begin;yy:=yy+1;xx:=x+xlength-1;end;
gotoxy(xx,yy);
write(copy(endend(desc),(length(desc)-ij)+1,1));
end;
if length(desc)<240 then begin
xx:=xx-1;
if xx<65 then begin;yy:=yy+1;xx:=x+xlength-1;end;
gotoxy(xx,yy);
write(' ');

end;
        ss.SetCursor($3470);

{        gotoxy(64-length(name),7);
write (endend(name));}
        s:='';
        c:=#255;
        if keypressed then c:=readkey;
        s:=c;
        if c=#0 then begin;s:=#0;c:=readkey;s:=s+c;end;
        {insert ok }   if s=#0+#32 then begin;c:=#13;end;
             textbackground(1);
        if (leftbuttonpressed) then begin
        ii[9]:=mousetx;
        ii[10]:=mousety;
        if (mousetx>1) and (mousetx<33) and (mousety=20) then begin;c:=#27;break;end;
        if (ii[10]=6) or (ii[10]=7) then begin
         if (mousetx>01) and (mousetx<07) then begin;mode:=6;break;end;
         if (mousetx>07) and (mousetx<18) then begin;mode:=5;break;end;
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
        {if (mousetx>--) and (mousetx<--) then begin;mode:=-;break;end;}
         if (mousetx>26) and (mousetx<33) then begin;mode:=2;break;end;
         if (mousetx>33) and (mousetx<64) then begin;mode:=1;break;end;
        end;
        {insert ok } if (ii[9]>56) and (ii[9]<64) and (ii[10]=08) then
                        begin;c:=#13;end;
        end;


        if (((mousex/8)+1>56) and ((mousex/8)+1<64) and (trunc(mousey/8)+1=8)) or (prt=56)then textbackground(4)
                                                                                  else textbackground(2);
        gotoxy(57,8);
        textcolor (14);
if editis then begin
        write(' ©ş¤');
        textcolor(11);
        write('ş');
        textcolor (14);
        write('ø');
   end else begin
        write(' ùê‘');
        textcolor(11);
        write('®');
        textcolor (14);
        write(' ');
end;
        if (mousetx>1) and (mousetx<33) and (mousety=20) then textbackground(4)
                                                                                 else textbackground(2);
        gotoxy(2,20);
        textcolor (14);
        if editis then write('      ©ş¤şø ıø÷õ ¥ šø¤¡      ') else
                       write('    ö¢¤î ùê‘® ıø÷õ ¥ šø¤¡    ');

        if (c=#13) then begin;getstring:=endend(desc);

                                     end;
        {M}
        {O}
        {D}
        {E}
              fixbeginproblem(s,desc);
              if (beforeopen(farsi(s))) and (not endopen(desc)) then endopend(desc);
              if (not beforeopen(farsi(s))) then desc:=endend(desc);
        {M}   if (validchar(c)) and (length(desc)<240) and (length(s)=1) then desc:=farsi(s)+(desc);
              if (c=#8) and (length(desc)>0) then begin
        {O}   if (copy(desc,1,1)='ò') then begin
              if length(desc)=1 then desc:='ó';
        {D}   if length(desc)>1 then desc:='ó'+copy(desc,2,length(desc)-1);
              end else begin
        {E}   desc:=copy(desc,2,length(desc)-1);
              end;
        {1}   end;
              if (s='h') then fixla(desc);
        if c=#219 then c:=#255;

        gotoxy(xx,yy);
        ss.SetCursor(3470);
        delay(30);
        if (s=#9) then begin;getstring:=desc+'^';break;end;
        if s=#0+#15 then begin;getstring:=desc+'"';break;end;
        if (c=#13) then begin;getstring:=desc+'|';break;desc:='';end;
        if (c=#27) then begin;desc:='<NONE>';getstring:=dtrims(definedbook.description);break;end;
        until 1=2;
        desc:=dtrims(desc);
        if (c=#27) then begin;desc:='<NONE>';getstring:='<NONE>';end;
        if c<>#27 then c:=#255;
        if desc<>'<NONE>' then definedbook.description:=desc else desc:=dtrims(definedbook.description);
endneop:
textcolor(15);
textbackground(0);
xx:=80;
yy:=09;
xlength:=1;
x:=65;
ij:=0;
for ij:=1 to length(desc) do begin
xx:=xx-1;
if xx<65 then begin;yy:=yy+1;xx:=79;end;
gotoxy(xx,yy);
write(copy(endend(desc),(length(desc)-ij)+1,1));
end;

end;
function Zerof(w : integer) : String;
var
 s2,s1, s : String;
 t:integer;
begin
  Str(w:0,s);
  if Length(s) = 1 then
    s := '0' + s;
s2:='';
for t:=1 to length(s) do begin
s1:=copy(s,t,1);
if s1= '0' then s2:=s2+'€' else
if s1= '1' then s2:=s2+'' else
if s1= '2' then s2:=s2+'‚' else
if s1= '3' then s2:=s2+'ƒ' else
if s1= '4' then s2:=s2+'„' else
if s1= '5' then s2:=s2+'…' else
if s1= '6' then s2:=s2+'†' else
if s1= '7' then s2:=s2+'‡' else
if s1= '8' then s2:=s2+'ˆ' else
if s1= '9' then s2:=s2+'‰' else s2:=s2+s1;
end;
  Zerof := s2;
end;
procedure fixbeginproblem(var s:string;name1:string);
begin
if (s='h') then if not endopen(copy(name1,1,1)) then s:=    '|';
if (s='y') then if not endopen(copy(name1,1,1)) then s:='Ü';
if (s='u') then if not endopen(copy(name1,1,1)) then s:=    'ß';
if (s='i') then if not endopen(copy(name1,1,1)) then s:='İ';
end;
function endopen(s:string):boolean;
begin
if length(s)>1 then s:=copy(s,1,1);
endopen:=(pos(s,endopens)<>0);
end;
function endend(s:string):string;
var s1,s2,s3:string;
    i1,i2:integer;
begin
s1:='';
if s<>'' then s1:=copy (s,1,1);
s2:=s1;
if (s2<>'') and (pos(s1,farsiz)<>0) then s2:=copy(endeds,pos(s1,farsiz),1);
if s2='ü' then begin
if length(s)>1 then if (not endopen(copy(s,2,1))) then s2:='ı';
if length(s)=1 then s2:='ı'
end;

if s2='‘' then begin
if length(s)>1 then if (not endopen(copy(s,2,1))) then s2:='';
if length(s)=1 then s2:=''
end;

if length(s)>1 then s1:=s2+copy(s,2,length(s)-1);
if length(s)=1 then s1:=s2;
if s='' then s1:='';
endend:=s1;
end;
function validchar(c:char):boolean;
begin
validchar:=(pos(upcase(c),englishkeyb)<>0);
end;
function farsi(s:string):string;
var i:array[1..10] of integer;
    s1,s2,s3:string;
begin
s3:='';
for i[1]:=1 to length(s) do begin
s1:=copy(s,i[1],1);
i[2]:=pos(s1,englishkeyb);
if i[2]<>0 then s2:=copy(farsiz,i[2],1) else s2:=s1;
s3:=s3+s2;
end;
farsi:=s3;
end;

procedure selectmenu;
var
i:integer;
begin
textbackground(4);
gotoxy(10,20);
textcolor(5);
write('’‘¡—÷');
{i:=choose ('',,,);}
showmouse;
end;

procedure sortmenu(var sortorder:string);
var
i:integer;
begin
textbackground(4);
textcolor(5);
gotoxy(2,20);
write('’ş—¤—ù“');
{i:=choose ('',,,);}
showmouse;
end;
function choose(choices:string;beginx,beginy:integer;color:integer) : integer;
var i:array[1..10] of integer;
    io:integer;
    choice:array[0..20] of string;
    whereseparate:array[0..20] of integer;
    separatesnumb:integer;
    s22,s23,s,s1,s2:string;
    jk:integer;
    c:char;
    ss:cursor;
    xx,yy,selected,biggest:integer;
    finished:boolean;
    label recheck;
begin
io:=0;
showmouse;
jk:=0;
if copy (choices,1,1)='*' then begin;jk:=1;choices:=copy(choices,2,length(choices)-1);color:=5;end;
ss.SetCursor($2000);
xx:=wherex;
yy:=wherey;
i[3]:=0;
choice[0]:='<ESC>';
separatesnumb:=0;
choices:=choices+',';
whereseparate[0]:=0;
for i[1]:=1 to length(choices) do begin
s:=copy(choices,i[1],1);
if s='Š' then begin;s:=',';choices[i[1]]:=',';end;
if (s=',')then begin;separatesnumb:=separatesnumb+1;whereseparate[separatesnumb]:=i[1];end;
end;
biggest:=0;
for i[1]:=1 to separatesnumb do begin
i[2]:=whereseparate[i[1]]-whereseparate[i[1]-1]+1;
choice[i[1]]:=copy(choices,whereseparate[i[1]-1]+1,i[2]-2);
if color=1 then begin;textbackground(7);textcolor(00);end;
if color=2 then begin;textbackground(1);textcolor(15);end;
if color=3 then begin;textbackground(2);textcolor(15);end;
if color=4 then begin;textbackground(4);textcolor(14);end;
if color=5 then begin;textbackground(0);textcolor(11);end;
if length(choice[i[1]])>biggest then biggest:=length(choice[i[1]]);
end;
if color=1 then begin;textbackground(7);textcolor(00);end;
if color=2 then begin;textbackground(1);textcolor(14);end;
if color=3 then begin;textbackground(2);textcolor(14);end;
if color=4 then begin;textbackground(4);textcolor(12);end;
if color=5 then begin;textbackground(0);textcolor(11);end;
if color<>5 then begin
for i[1]:=1 to biggest+2 do begin
gotoxy(beginx+i[1]+1,beginy);
write('Í');
gotoxy(beginx+i[1]+1,beginy+separatesnumb+1);
write('Í');
end;
end else begin
for i[1]:=1 to biggest do begin
gotoxy(beginx+i[1],beginy);
write('Í');
gotoxy(beginx+i[1],beginy+separatesnumb+1);
write('Í');
end;
end;
for i[1]:=1 to separatesnumb do begin
gotoxy(beginx,beginy+i[1]);
if color<>5 then write(' º') else write('º');
if color<>5 then gotoxy(beginx+biggest+4,beginy+i[1]) else gotoxy(beginx+biggest+1,beginy+i[1]);
if color<>5 then write('º ') else  write('º');
end;
gotoxy(beginx,beginy);
if color<>5 then write(' É') else write('É');
if color<>5 then gotoxy(beginx+biggest+4,beginy) else gotoxy(beginx+biggest+1,beginy);
if color<>5 then write('»',#4) else begin;textcolor(13);write('»');textcolor(11);end;
gotoxy(beginx,beginy+separatesnumb+1);
if color<>5 then write(' È') else write('È');
if color<>5 then gotoxy(beginx+biggest+4,beginy+separatesnumb+1) else gotoxy(beginx+biggest+1,beginy+separatesnumb+1);
if color<>5 then write('¼ ') else write('¼');
for i[1]:=1 to separatesnumb do begin
if color=1 then begin;textbackground(7);textcolor(00);end;
if color=2 then begin;textbackground(1);textcolor(15);end;
if color=3 then begin;textbackground(2);textcolor(15);end;
if color=4 then begin;textbackground(4);textcolor(14);end;
if color=5 then begin;textbackground(0);textcolor(11);end;
recheck:if length(choice[i[1]])<biggest then begin;choice[i[1]]:=' '+choice[i[1]];goto recheck;end;
if color<>5 then gotoxy((beginx+3+biggest)-length(choice[i[1]]),beginy+i[1])
   else gotoxy((beginx+1+biggest)-length(choice[i[1]]),beginy+i[1]);
if jk=0 then write (choice[i[1]]) else
  write (copy(choice[i[1]],1,length(choice[i[1]])-1),copy(choice[i[1]],length(choice[i[1]]),1));
end;
finished:=false;
s:='';
i[1]:=1;
i[2]:=0;
selected:=0;
i[4]:=0;
s:='';
repeat
c:=#255;
if keypressed then c:=readkey;
s:=c;
if c=#0 then s:=c+readkey;
if s=#0+#72 then i[1]:=i[1]-1;
if s=#0+#80 then i[1]:=i[1]+1;
if (s<>'') and (s<>' ') and (s<>'ÿ')and (length(s)=1) and (color=5) and (validchar(c)) then
for i[5]:=1 to separatesnumb do begin
s22:=s;
s23:=endend(copy(choice[i[5]],length(choice[i[5]]),1));
fixbeginproblem(s22,'¢');
s22:=endend(farsi(s22));
{write ('S:',s,'. S22:',s22,'. S23:',s23,'.');
halt;}
if endend(s22)=s23 then begin;selected:=i[5];finished:=true;end;
end;

if (color<>5) and (s<>#255) and (i[1]<>i[2]) then movemousecursor((beginx+biggest+3)*8,(beginy-1)*8);
if (color =5) and (s<>#255) and (i[1]<>i[2]) then movemousecursor((beginx+biggest)*8,(beginy-1)*8);

if i[1]<1 then i[1]:=separatesnumb;
if i[1]>separatesnumb then i[1]:=1;
if i[1]<>i[2] then begin
hidemouse;
i[2]:=i[1];
for i[3]:=1 to separatesnumb do begin
if i[1]<>i[3] then begin
if color=1 then begin;textbackground(7);textcolor(00);end;
if color=2 then begin;textbackground(1);textcolor(15);end;
if color=3 then begin;textbackground(2);textcolor(15);end;
if color=4 then begin;textbackground(4);textcolor(14);end;
if color=5 then begin;textbackground(0);textcolor(11);end;
end else begin
if color=1 then begin;textbackground(2);textcolor(00);end;
if color=2 then begin;textbackground(4);textcolor(14);end;
if color=3 then begin;textbackground(3);textcolor(15);end;
if color=4 then begin;textbackground(2);textcolor(15);end;
if color=5 then begin;textbackground(1);textcolor(15);end;
end;
if color<>5 then gotoxy((beginx+2+biggest)-length(choice[i[3]]),beginy+i[3])
   else gotoxy((beginx+biggest+1)-length(choice[i[3]]),beginy+i[3]);
if color<>5 then write (' ',choice[i[3]],' ') else begin
{write (choice[i[3]]);}
if jk=0 then write (choice[i[3]]) else begin
  write (copy(choice[i[3]],1,length(choice[i[3]])-1));
textcolor(12);
write (copy(choice[i[3]],length(choice[i[3]]),1));
end;end;
end;
showmouse;
end;
if s=#13 then begin;selected:=i[1];finished:=true;end;
if s=#27 then begin;selected:=0000;finished:=true;end;
if s=#09 then begin;selected:=-001;finished:=true;end;
if s=#0+#15 then begin;selected:=-002;finished:=true;end;
if  (color<>5) and (mousetx>beginx+1) and (mousetx<beginx+biggest+4) and
   (mousety-beginy>=1)          and (mousety-beginy<=separatesnumb)         then i[1]:=mousety-beginy;
if  (color=5) and (mousetx>beginx) and (mousetx<beginx+biggest+1) and
   (mousety-beginy>=1)          and (mousety-beginy<=separatesnumb)         then i[1]:=mousety-beginy;

if leftmb then begin
hidemouse;
if  (color<>5) and  (mousetx>beginx+1) and (mousetx<beginx+biggest+4) then begin
i[4]:=mousety-beginy;
if (i[4]>=1) and (i[4]<=separatesnumb) then begin
i[1]:=i[4];
selected:=i[4];finished:=true;
break;
end;

end;
if  (color=5) and  (mousetx>beginx) and (mousetx<beginx+biggest+1) then begin
i[4]:=mousety-beginy;
if (i[4]>=1) and (i[4]<=separatesnumb) then begin
i[1]:=i[4];
selected:=i[4];finished:=true;
break;
end;

if (color=5) and ((mousety>=beginy-1)and(mousety<=beginy+1)) then begin
 if (mousetx>01) and (mousetx<07) and (beginx<>1) then selected:=-60;
 {if (mousetx>--) and (mousetx<--) then selected:=--;}
 {if (mousetx>--) and (mousetx<--) then selected:=--;}
  if (mousetx>26) and (mousetx<33) then selected:=-20;
  if (mousetx>33) and (mousetx<64) then selected:=-10;
  if (mousetx>07) and (mousetx<18) and (beginx<>7) then selected:=-50;
  if selected<-9 then finished:=true;
end;
if  (color<>5) and (mousetx=beginx+biggest+5) and (mousety-beginy=0) then begin;selected:=0;finished:=true;end;
if  (color=5) and (mousetx=beginx+biggest+1) and (mousety-beginy=0) then begin;selected:=0;finished:=true;end;
end else begin;selected:=0000;finished:=true;end;
end;
writetime;
until finished;

choose:=selected;
gotoxy(xx,yy);
if color=1 then begin;textbackground(7);textcolor(00);end;
if color=2 then begin;textbackground(1);textcolor(15);end;
if color=3 then begin;textbackground(2);textcolor(15);end;
if color=4 then begin;textbackground(4);textcolor(14);end;
if color=5 then begin;textbackground(0);textcolor(11);end;
ss.SetCursor(3470);
movemousecursor((xx*8)-10,(yy*8)-10);
{showmouse;}
end;
procedure writetime;
var
  ss:cursor;
  itmp,x,y:integer;
  h,m,s,p:word;
  yr, mn, dy, dow : Word;
  inthename:string;
  ketabdars:string;
begin
ss.setcursor($2000);
inthename:='¢¡ ô‘÷ ù“';
ketabdars:='/€€ ù¡¨÷ - ¤¢“‘—î';
x:=wherex;
y:=wherey;
textbackground (1);
GetTime(h,m,s,p);
if godflag<1 then godflag:=length(inthename);
if ktbflag<1 then ktbflag:=length(ketabdars);
if (p mod 2=1) and (godtest=0) then begin
      godflag:=godflag-1;godtest:=1;
      ktbflag:=ktbflag-1;
      end;
if copy(inthename,godflag,1)=' ' then godflag:=godflag-1;
if copy(ketabdars,ktbflag,1)=' ' then ktbflag:=ktbflag-1;
if godflag<1 then godflag:=length(inthename);
if ktbflag<1 then ktbflag:=length(ketabdars);
if (p mod 2<>1) then godtest:=0;
gotoxy (69,2);
for itmp:=1 to length(inthename) do begin
if itmp=godflag then textcolor(10) else textcolor(2);
write (copy(inthename,itmp,1));
end;

gotoxy (47,2);
for itmp:=1 to length(ketabdars) do begin
if itmp=ktbflag then textcolor(11) else textcolor(3);
write (copy(ketabdars,itmp,1));
end;

textcolor (14);
gotoxy(2,2);
if h>=12 then write(' ¤¬ä ') else write (' “¬ ');
if h>12 then h:=h-12;
write (zerof(h),':',zerof(m),':',zerof(s));
  textcolor (9);
  write (' - ');
  textcolor (10);
  GetDate(yr,mn,dy,dow);
  Write(zerof(yr), '/', zerof(mn), '/', zerof(dy),' ',days[dow]);
gotoxy(x,y);
end;
function nowdate:string6;
var yr,mn,dy,dow:word;
begin
  textcolor (10);
  GetDate(yr,mn,dy,dow);
nowdate:=(copy(zerof(yr),3,2)+ '/'+ zerof(mn)+ '/'+ zerof(dy));
end;

procedure editmenu(var thisbook:booktype);
        var
        mannumber:longint;
        bookok:boolean;
        xx,yy,ij,i:integer;
        c:char;
        ndefined,definedbook:booktype;
        desc,borrower,brdate,gvdate,bnumbo,bgroupo,statueo,namo,s,stato:string;
        english:boolean;
        ss:cursor;
        submode,modo:integer;
        giveback,bordate,borrownum:borrowerstype;

begin
gotoxy(1,1);
textcolor(15);
{write ('******',vali(thisbook.recnumber));
halt;}
editis:=true;
textbackground(4);
gotoxy(27,20);
textcolor(0);
write('©ş¤');
textcolor(6);
write('ş');
textcolor(0);
write('ø');
        definedbook.statue:=lended;
        for i:=1 to maxreserver do begin
        giveback[i]:='';
        bordate[i]:='';
        borrownum[i]:='';
        definedbook.borrowdate[i]:='';
        definedbook.borrower[i]:='';
        definedbook.givebackdate[i]:='';
        end;
        definedbook.statue:=lost;
        definedbook.lostmsg:='';
        definedbook.lostdate:='';
        definedbook.statue:=repair;
        definedbook.repairmsg:='';

{if defined<>'' then }{i:=choose ('’‘—î öş ©ş¤şøŠ‘ûùø¤ğ ©ş¤şø',12,21,1);{ else}
                    {i:=choose ('‘ûùø¤ğ ©ş¤şø',14,21,1)}
        definedbook.statue:=thisbook.statue;
     if thisbook.statue=lended then begin
            for i:=1 to maxreserver do begin
            giveback[i]:=thisbook.givebackdate[i];
            bordate[i]:=thisbook.borrowdate[i];
            borrownum[i]:=thisbook.borrower[i];
            definedbook.borrowdate[i]:=thisbook.borrowdate[i];
            definedbook.borrower[i]:=thisbook.borrower[i];
            definedbook.givebackdate[i]:=thisbook.givebackdate[i];
            end;
     end;
     if thisbook.statue=lost then begin
        definedbook.lostmsg:=thisbook.lostmsg;
        definedbook.lostdate:=thisbook.lostdate;
     end;
     if thisbook.statue=repair then definedbook.repairmsg:=thisbook.repairmsg;
        insertrefresh:=true;
        listord:=1;               
        desc:=getstring(thisbook,1,1,1,1,1,1,true);
        desc:=thisbook.description;
        definedbook.description:=thisbook.description;

        bookok:=true;
        insertis:=true;
        textbackground(4);
        gotoxy(18,20);
        textcolor(0);
        write('©ş¤ş');
        textcolor(6);
        write('ø');
{        drawframe(2);}
        begin
{        drawframe(2);}
        ss.SetCursor($2000);
        definedbook.name:=thisbook.name;
        definedbook.number:=thisbook.number;
        definedbook.group:=thisbook.group;
        definedbook.description:=thisbook.description;
        definedbook.statue:=thisbook.statue;
        ndefined.name:='';
        ndefined.number:='';
        ndefined.group:='';
        ndefined.statue:=notdefined;

{        list10build(ndefined);
        list10read;
        list10write;}
        {numberofbooks:=totalbooks;}
        modo:=1;
        c:=#255;
        s:='';
        name   :=thisbook.name;
        namo   :='';

        borrower:=thisbook.borrower[1];
        brdate:=thisbook.borrowdate[1];
        gvdate:=thisbook.givebackdate[1];
        bnumb  :=thisbook.number;
        bnumbo :=thisbook.number;

        bgroup :=thisbook.group;
        bgroupo:=bgroup;

        case thisbook.statue of
           normal    :statue:=' ¤®‘Ÿ';
           lended    :statue:='–÷‘õ';
           repair    :statue:='¤şõã—';
           lost      :statue:='¢øìêõ';
        end;
        stato:=statue;
        english:=false;
        mode:=1;
        submode:=1;
        mannumber:=vall(thisbook.number);
        desc:=thisbook.description;
{        write('***',desc);
        halt;}
        definedbook.recnumber:=thisbook.recnumber;
        repeat
        ss.SetCursor($2000);
        gotoxy(51,20);
        textcolor(15);
        textbackground(1);
        write('             ');
        gotoxy(35,20);
        {write(fixof(farsinum(thisbook.number),'€',6));}
        if not keypressed then prt:=port[$60] else prt:=0;
        writetime;
        textcolor(15);
        textbackground(0);
        gotoxy(34,7);
        if name  <>namo    then begin;write ('                              ');namo   :=name;  end;
        gotoxy(27,7);
        if bnumb <>bnumbo  then begin;write ('      ')                        ;bnumbo :=bnumb; end;
        gotoxy(8,7);
        if bgroup<>bgroupo then begin;write ('          ')                    ;bgroupo:=bgroup;end;
        gotoxy(2,7);
        if statue<>statueo then begin;write ('     ')                         ;statueo:=statue;end;

        gotoxy(64-length(name),7);
        if english then write (name) else write (endend(name));

        gotoxy(33-6,7);
        write(fixof(farsinum(bnumb),'€',6));
        gotoxy(18-length(bgroup),7);
        if length(bgroup)>1 then begin
        write(copy(bgroup,1,length(bgroup)-1));
        textcolor(12);
        write(copy(bgroup,length(bgroup),1));
        textcolor(15);
        end;

        gotoxy(7-length(statue),7);
        if length(statue)>1 then begin
        write(copy(statue,1,length(statue)-1));
        textcolor(12);
        write(copy(statue,length(statue),1));
        textcolor(15);
        end;
        s:='';
        c:=#255;
        if keypressed then c:=readkey;
        s:=c;
        if c=#0 then begin;s:=#0;c:=readkey;s:=s+c;end;

        if (mode=1) and (s=#0+#34) then english:=true;
        if (mode=1) and (s=#0+#20) then english:=false;
        {insert ok }   if s=#0+#32 then begin;c:=#13;end;

        if mode=1 then begin
             textbackground(1);
if name=' ' then name:='';
             if english then begin
             gotoxy(34,6);

        { M }if (((mousex/8)+1>33) and ((mousex/8)+1<42) and (trunc(mousey/8)+1=6)) or (prt=56) then textbackground(4)
                                                                                    else textbackground(1);
        { O }textcolor (11);write('ü¨ş');
             textcolor (12);write('ó');
        { D }textcolor (11);write('ğ÷');textcolor(15);write(#17);
             textcolor (3);
        { E }if (((mousex/8)+1>42) and ((mousex/8)+1<49) and (trunc(mousey/8)+1=6)) or (prt=56)then textbackground(4)
                                                                                    else textbackground(1);
        { 1 }
             gotoxy(43,6);
             write('ü¨¤‘');
             textcolor (12);
             write('ê');textcolor(9);write(#4);
             end else begin
             if (((mousex/8)+1>33) and ((mousex/8)+1<42) and (trunc(mousey/8)+1=6)) or (prt=56)then textbackground(4)
        { M }                                                                       else textbackground(1);
             gotoxy(34,6);
        { O }textcolor (3);write('ü¨ş');
             textcolor(12);write('ó');
        { D }textcolor (3);write('ğ÷');textcolor(9);write(#4);
             textcolor (11);
        { E }if (((mousex/8)+1>42) and ((mousex/8)+1<49) and (trunc(mousey/8)+1=6)) or (prt=56)then textbackground(4)
                                                                                    else textbackground(1);
        { 1 }gotoxy(43,6);
             write('ü¨¤‘');textcolor(12);write('ê');textcolor(15);write(#17);
             end;
             end else begin
             textcolor(9);
             textbackground(1);
             gotoxy(34,6);
             write ('ü¨şóğ÷',#4,' ü¨¤‘ê',#4);

        end;
        if (leftbuttonpressed) then begin
        ii[9]:=mousetx;
        ii[10]:=mousety;
        if (mousetx>1) and (mousetx<33) and (mousety=20) then c:=#27;
        if (ii[10]=6) or (ii[10]=7) then begin
         if (mousetx>01) and (mousetx<07) then mode:=6;
         if (mousetx>07) and (mousetx<18) then mode:=5;
        {if (mousetx>--) and (mousetx<--) then mode:=-;}
        {if (mousetx>--) and (mousetx<--) then mode:=-;}
         if (mousetx>26) and (mousetx<33) then mode:=2;
         if (mousetx>33) and (mousetx<64) then mode:=1;

        end;
        {gotoxy(19,7);
        write('.');
        halt;}
           if mode=1 then begin
        {M}   {english   } if (ii[9]>33) and (ii[9]<42) and (ii[10]=06) then
        {O}                    begin;name:=endend(name);english:=true;end;
        {D}
        {E}   {farsi     } if (ii[9]>42) and (ii[9]<49) and (ii[10]=06) then
        {1}                    english:=false;
           end;
        {insert ok } if (ii[9]>56) and (ii[9]<64) and (ii[10]=08) then
                        begin;c:=#13;end;
        end;


        if (((mousex/8)+1>56) and ((mousex/8)+1<64) and (trunc(mousey/8)+1=8)) or (prt=56)then textbackground(4)
                                                                                  else textbackground(2);
        gotoxy(57,8);
        textcolor (14);
        write(' ©ş¤' );
        textcolor(11);
        write('ş');
        textcolor (14);
        write('ø');
        if (mousetx>1) and (mousetx<33) and (mousety=20) then textbackground(4)
                                                                                 else textbackground(2);
        gotoxy(2,20);
        textcolor (14);
        write('      ©ş¤şø ıø÷õ ¥ šø¤¡      ');

        if dtrims(statue)='' then statue:='¤®‘Ÿ';
        if dtrims(bgroup)='' then statue:='üõóä';
        if (dtrims(bnumb)='') and (mode<>2) then bnumb:=strl(numberofbooks+1);
        if dtrims(name)='' then bookok:=false else bookok:=true;
        if (c=#13) and (bookok) then begin
                                           if notexist1 (definedbook) then begin
                                           c:=#255;
                                           s:=#255;
                                           thisbook:=definedbook;
                                           desc:=getstring(thisbook,1,1,1,1,1,1,true);
                                           break;
                                    end else c:=#254;
                                    end;
       if (s=#9) then mode:=mode+1;
        if s=#0+#15 then mode:=mode-1;
{        if (mode>7) then begin
        if     (dtrims(statue)<>'–÷‘õ')
           and (dtrims(statue)<>'¢øìêõ')
           and (dtrims(statue)<>'¤şõã—') then mode:=1;
        end;}
{        if mode=8 then halt;}
        if mode>8 then mode:=1;
        if mode<1 then mode:=7;


        {Demo mode Begin}
        if ((mode=3) or (mode=4)) then begin
        if modo<5 then mode:=5 else mode:=2;
        end;
        modo:=mode;

        {if ((mode=2)) then begin
        if modo<3 then mode:=3 else mode:=1;
        end;
        modo:=mode;}
        {Demo mode Ended}

        if mode=1 then begin
        {M}
        {O}
        {D}
        {E}
if name=' ' then name:='';
        {1}   if english then name:=endend(name);
              if not english then fixbeginproblem(s,name);
              if (not english) and (beforeopen(farsi(s))) and (not endopen(name)) then endopend(name);
              if (not english) and (not beforeopen(farsi(s))) then name:=endend(name);
              if (validchar(c)) and (length(name)<30) and (english) and (length(s)=1)then name:=(name)+s;
        {M}   if (validchar(c)) and (length(name)<30) and (not english)and (length(s)=1) then name:=farsi(s)+(name);
              if (c=#8) and (length(name)>0) then begin
        {O}   if (not english) and (copy(name,1,1)='ò') then begin
              if length(name)=1 then name:='ó';
        {D}   if length(name)>1 then name:='ó'+copy(name,2,length(name)-1);
              end else begin
        {E}   if english then name:=endend(copy(name,1,length(name)-1)) else name:=copy(name,2,length(name)-1);
              end;
        {1}   end;
              if (not english) and (s='h') then fixla(name);
        end;
   if mode<>1 then name:=dtrims(name);
        if mode=2 then begin
           if (pos(s,'0123456789')<>0) then begin
           if (length(bnumb)<6) and (bnumb<>'') then bnumb:=bnumb+s;
           if (bnumb='') and (s<>'0') then bnumb:=bnumb+s;
           end;
           if (c=#8) and (length(bnumb)>0) then begin
           if length(bnumb)=1 then bnumb:='';
           if length(bnumb)>1 then bnumb:=copy(bnumb,1,length(bnumb)-1);
           end;
        end;

        if mode=7 then begin
{        mode 7                                 }
{gotoxy(65,9);
write('000000000111111');gotoxy(65,10);
write('123456789012345');}
             textcolor(9);
             textbackground(1);
             gotoxy(34,6);
             write ('ü¨şóğ÷',#4,' ü¨¤‘ê',#4);

        desc:=dtrims(getstring(thisbook,65,9,15,16,15,0,false));
        s:=#255;
        if copy(desc,length(desc),1)='"' then begin;mode:=6;desc:=copy(desc,1,length(desc)-1);c:=#9;end;
        if copy(desc,length(desc),1)='^' then begin;mode:=mode+1;desc:=copy(desc,1,length(desc)-1);end;
        if copy(desc,length(desc),1)='|' then begin;desc:=copy(desc,1,length(desc)-1);c:=#13;s:=#13;mode:=1;end;
        if (mode>7) and (dtrims(statue)<>'–÷‘õ')
                    and (dtrims(statue)<>'¢øìêõ')
                    and (dtrims(statue)<>'¤şõã—')  then mode:=1;
        if desc<>'<NONE>' then definedbook.description:=desc else begin;s:=#27;c:=#27;end;

        if mode>8 then mode:=1;
        end;


        if mode=6 then begin
             gotoxy(2,8);
       {M}  i:=choose('*¤®‘ŸŠ–÷‘õŠ¤şõã—Š¢øìêõ',1,7,5);
           showmouse;
           case i of
        {O} 1:statue:='¤®‘Ÿ';
            2:statue:='–÷‘õ';
        {D} 3:statue:='¤şõã—';
            4:statue:='¢øìêõ';  end;
        {if dtrims(statue)='–÷‘õ' then definedbook.statue:=lended;
        if dtrims(statue)=''      then statue:='¤®‘Ÿ';
        if dtrims(statue)='¤®‘Ÿ'  then definedbook.statue:=normal;
        if dtrims(statue)='¤şõã—' then definedbook.statue:=repair;
        if dtrims(statue)='¢øìêõ' then definedbook.statue:=lost  ;}
            if dtrims(statue)<>dtrims(stato) then begin
        definedbook.statue:=lended;
        for i:=1 to maxreserver do begin
        giveback[i]:='';
        bordate[i]:='';
        borrownum[i]:='';
        definedbook.borrowdate[i]:='';
        definedbook.borrower[i]:='';
        definedbook.givebackdate[i]:='';
        end;
        definedbook.statue:=lost;
        definedbook.lostmsg:='';
        definedbook.lostdate:='';
        definedbook.statue:=repair;
        definedbook.repairmsg:='';
        definedbook.statue:=notdefined;
        stato:=statue;

            end;
            window (2,22,80-18,24);
            textbackground(1);
            clrscr;
            window (1,1,80,25);
        {E}s:='';
           c:=#219;
        {6}if i>-2 then mode:=7;
           if i=-2 then mode:=5;
           {if i=0 then statue:='';}
           if i<-9 then mode:=abs(i)div 10;
           i:=0;
           textbackground(0);
           gotoxy(2,7);
           write ('     ');
           textcolor(15);
        {M}gotoxy(1,7);
           write('º');
        {O}gotoxy(7,7);
           write('³');
        {D}textbackground(1);
           gotoxy(1,8);
        {E}write('Ç');
           gotoxy(7,8);
        {6}write('Å');
           gotoxy(1,19);
           write ('Ç');
           gotoxy(7,19);
           write ('Á');
        {M}gotoxy(2,8);
           write('ÄÄÄÄÄ');
        {O}gotoxy(2,19);
           write('ÄÄÄÄÄ');
        {D}textbackground(1);
           for i:=1 to 10 do begin
        {E}gotoxy(1,8+i);
           textbackground(1);
           write('º     ³');
        ss.SetCursor($2000);
        {list10write;}
        {writeinfo(definedbook,0);}
        ss.SetCursor($3470);
        {6}end;
            window (2,22,80-17,24);
            textbackground(1);
            clrscr;
            window (1,1,80,25);
        end;
        definedbook.name:=dtrims(name);
        definedbook.number:=dtrims(bnumb);
        definedbook.group:=dtrims(bgroup);
        definedbook.statue:=normal;
        if dtrims(statue)='' then statue:='¤®‘Ÿ';
        if dtrims(statue)='–÷‘õ' then definedbook.statue:=lended;
        if dtrims(statue)='¤®‘Ÿ' then definedbook.statue:=normal;
        if dtrims(statue)='¤şõã—' then definedbook.statue:=repair;
        if dtrims(statue)='¢øìêõ' then definedbook.statue:=lost;

if definedbook.statue=repair then begin
textcolor(14);
textbackground(1);
gotoxy(2,22);
write (fixof(definedbook.repairmsg,' ',62));
textcolor(15);

end;

if definedbook.statue=lost then begin
textcolor(15);
textbackground(1);
gotoxy (2,22);
write (fixof(definedbook.lostdate,' ',8),':ö¢ìê  ş¤‘—   ');
textcolor(14);
gotoxy(2,23);
write (fixof(definedbook.lostmsg,' ',62));
textcolor(15);

end;

if definedbook.statue=lended then begin
        window (2,22,63,24);
textbackground(1);
textcolor(15);
write (fixof(definedbook.borrowdate[1],' ',8),':–÷‘õ  ş¤‘—   ');
textcolor(14);
write (fixof(fixof(definedbook.borrower[1],'€',8),' ',25),' :ù¢÷¤şğ –÷‘õ');
sr:='';
for jj[1]:=2 to maxreserver do begin
if (sr<>'') then sr:=fixof(definedbook.borrower[jj[1]],'€',8)+' ø '+sr;
if (sr= '') then sr:=fixof(definedbook.borrower[jj[1]],'€',8)        ;
end;
gotoxy(2,3);
textcolor (9);
write (fixof(sr,' ',60-14)+ ' :ö‘ğ¢÷÷î ø¤¥¤');
textcolor(15);
gotoxy(1,2);
write (fixof(definedbook.givebackdate[1],' ',8),': –¢øä  ş¤‘—   ');
window(1,1,80,25);
end;

{mode 8}
{gotoxy(1,1);
write ('...',statue,'...',mode,'...',submode);}
{end of mode 8}
{¤şõã—}


if (mode=8) and ((dtrims(statue)='¢øìêõ')or(definedbook.statue=lost)) then begin
{        halt;}
        window (2,22,63,24);
        definedbook.statue:=lost;
        textbackground(1);
        if modo<>8 then begin;submode:=1;clrscr;end;
textbackground(1);
gotoxy(1,2);
textcolor(14);
write (fixof(definedbook.lostmsg,' ',62));
textcolor(15);
gotoxy (1,1);
write (fixof(definedbook.lostdate,' ',8),':ö¢ìê  ş¤‘—   ');
window(1,1,80,25);
if submode=1 then begin
gotoxy(2,22);
s:=dateget(true,definedbook.lostdate);
c:=#254;
if s[3]='\' then begin
{c:=#13;}
s[3]:='/';
end;
if (dtrims(s)<>'<ESC>') and (submode=1) then definedbook.lostdate:=s;
if dtrims(s)='<ESC>' then begin;s:=#27;c:=#27;end;
if (s<>#27) then s:='';
{if c=#13 then s:=#13;}
end;
submode:=submode+1;
if submode=2 then begin
gotoxy(2,23);
s:=get60str (definedbook.lostmsg);
if dtrims(s)<>'<ESC>' then definedbook.lostmsg:=s else begin;s:=#27;c:=#27;end;
end;
if submode>2 then mode:=1;
        end;



        if (mode=8) and (dtrims(statue)='–÷‘õ') then begin
        window (2,22,63,24);
        definedbook.statue:=lended;
        textbackground(1);
        if modo<>8 then begin;submode:=1;clrscr;end;
textcolor(15);
write (fixof(definedbook.borrowdate[1],' ',8),':–÷‘õ  ş¤‘—   ');
textcolor(14);
s:=definedbook.borrower[1];
{repeat
if length(s)<25 then s:=' '+s;
until length(s)>=25;}

write (fixof(fixof(definedbook.borrower[1],'€',8),' ',25),' :ù¢÷¤şğ –÷‘õ');
s:='';
for jj[1]:=2 to maxreserver do begin
if (s<>'') then s:=fixof(definedbook.borrower[jj[1]],'€',8)+' ø '+s;
if (s= '') then s:=fixof(definedbook.borrower[jj[1]],'€',8)        ;
end;
gotoxy(2,3);
textcolor (9);
write (fixof(s,' ',60-14)+ ' :ö‘ğ¢÷÷î ø¤¥¤');
textcolor(15);
gotoxy(1,2);
write (fixof(definedbook.givebackdate[1],' ',8),': –¢øä  ş¤‘—   ');
window(1,1,80,25);
if (submode>=1) and (submode<=2) then begin
if submode=1 then gotoxy(2,22);
if submode=2 then gotoxy(2,23);
if submode=1 then s:=dateget(true,definedbook.borrowdate[1]);
if submode=2 then s:=dateget(true,definedbook.givebackdate[1]);
c:=#254;
if s[3]='\' then begin
{c:=#13;}
s[3]:='/';
end;
if (dtrims(s)<>'<ESC>') and (submode=1) then definedbook.borrowdate[1]:=s;
if (dtrims(s)<>'<ESC>') and (submode=2) then definedbook.givebackdate[1]:=s;
if dtrims(s)='<ESC>' then begin;s:=#27;c:=#27;end;
if (s<>#27) then s:='';
{if c=#13 then s:=#13;}
end;
if (submode>=3) and (submode<=5)then begin
if submode=3 then gotoxy(42,22);
if submode=4 then gotoxy(41,24);
if submode=5 then gotoxy(30,24);
if submode=6 then gotoxy(19,24);
if submode=7 then gotoxy(08,24);
s:=get8dgt(definedbook.borrower[submode-2]);
{write ('€€€€€€€€');}
if (dtrims(s)<>'-') then definedbook.borrower[submode-2]:=s;
{halt;}
end;
submode:=submode+1;
if submode>2+maxreserver then mode:=1;
        end;
{###################################################}

if mode<>8 then submode:=1;

if (mode=8) and ((dtrims(statue)='¤şõã—')or(definedbook.statue=repair)) then begin
{        halt;}
        window (2,22,63,24);
        definedbook.statue:=repair;
        textbackground(1);
        if modo<>8 then begin;submode:=1;clrscr;end;
textcolor(14);
textbackground(1);
gotoxy(1,1);
write (fixof(definedbook.repairmsg,' ',62));
textcolor(15);
window(1,1,80,25);
gotoxy(2,22);
s:=get60str (definedbook.repairmsg);
if dtrims(s)<>'<ESC>' then definedbook.repairmsg:=s else begin;s:=#27;c:=#27;end;
      mode:=1;
        end;



        if (mode=5) and (c<>#219) then begin
             gotoxy(7,8);
        {M}  i:=
        choose('*üõóäŠü“û£õ ü÷ş¢Šâ›¤õŠüª¥øõ íõîŠüä‘õ—›Š–çó ï÷û¤êŠü“¢-ö‘õ¤Šü¨‘ş¨Š¢‘¬—ì-ñø•Šüş‘şê¤ç›Šü¡ş¤‘—',   7,7,5);
           showmouse;
           case i of
        {O} 1:bgroup:='üõóä';
            2:bgroup:='ü“û£õ ü÷ş¢';
        {D} 3:bgroup:='â›¤õ';
            4:bgroup:='üª¥øõ íõî';
        {E} 5:bgroup:='üä‘õ—›';
            6:bgroup:='–çó ï÷û¤ê';
        {5} 7:bgroup:='ü“¢-ö‘õ¤';
            8:bgroup:='ü¨‘ş¨';
            9:bgroup:='¢‘¬—ì-ñø•';
           10:bgroup:='üş‘şê¤ç›';
           11:bgroup:='ü¡ş¤‘—';
           end;
           s:='';
           c:=#255;
           if i>-2 then mode:=6;
        {M}if i=-2 then mode:=4;
           {if i=0 then bgroup:='';}
           if i<-9 then mode:=abs(i)div 10;
           i:=0;
        {O}textbackground(0);
           gotoxy(8,7);
        {D}write ('          ');
           textcolor(15);
        {E}gotoxy(7,7);
           write('³');
        {5}gotoxy(18,7);
           write('³');
           textbackground(1);
           gotoxy(7,8);
           write('Å');
           gotoxy(18,8);
           write('Å');
           gotoxy(7,19);
           write ('Á');
        {M}gotoxy(18,19);
           write ('Á');
        {O}gotoxy(8,8);
           write('ÄÄÄÄÄÄÄÄÄÄ');
        {D}gotoxy(8,19);
           write('ÄÄÄÄÄÄÄÄÄÄ');
        {E}textbackground(1);
           for i:=1 to 10 do begin
        {5}gotoxy(7,8+i);
           write('³          ³');
           end;
        ss.SetCursor($2000);
        {list10write;}
        {writeinfo(definedbook,0);}
        ss.SetCursor($3470);
        end;
        if c=#219 then c:=#255;


           if mode =1 then gotoxy(63-length(name),7);
        if mode =2 then gotoxy(32,7);
        if mode =3 then gotoxy(25,7);
        if mode =4 then gotoxy(20,7);
        if mode =5 then gotoxy(17,7);
        if mode =6 then gotoxy(6-length(statue),7);
        ss.SetCursor(3470);
        delay(30);
        definedbook.group:=dtrims(bgroup);
       definedbook.name:=endend(dtrims(name));
        if dtrims(statue)='¤®‘Ÿ' then definedbook.statue:=normal;
        if dtrims(statue)='–÷‘õ'then definedbook.statue:=lended;
        if dtrims(statue)='¤şõã—'then definedbook.statue:=repair;
        if dtrims(statue)='¢øìêõ'then definedbook.statue:=lost;
        definedbook.number:=dtrims(bnumb);
        if c=#27 then break;
        if (c=#13) and (bookok) then begin
                                           c:=#255;
                                           s:=#255;
                                           thisbook:=definedbook;
                                           desc:=getstring(thisbook,1,1,1,1,1,1,true);
                                           break;
                                     end;

           until 1=2;
insertis:=false;
        end;

editis:=false;
{write ('*********',vall(thisbook.recnumber));
halt;}
end;
function notexist1(defined:booktype):boolean;
var tempbook:booktype;
    k,j,l:longint;
    ss:cursor;
    reference:file of booktype;
begin
assign (reference,'database.kdd');
reset(reference);
seek(reference,0);
textbackground(2);
textcolor(16);
gotoxy(34,8);
write (' ...¢ş÷î ¤“¬ ‘ê¯ó             ');
                  k:=filesize(reference);
while not eof(reference) do begin
read(reference,tempbook);
                  l:=filepos(reference);
                  if l<1000 then begin
                        textcolor(14);
                        gotoxy(52,8);
                        write (fixof(farsinum(strl(l)),'€',6),' ');
                        textcolor(15);
                        j:=round((l / k)*100);
                        write (fixof(farsinum(strl(j)),'€',3),'%');
                  end else if l mod 1000=0 then begin
                        textcolor(14);
                        gotoxy(52,8);
                        write (fixof(farsinum(strl(l)),'€',6),' ');
                        textcolor(15);
                        j:=round((l / k)*100);
                        gotoxy(59,8);
                        write (fixof(farsinum(strl(j)),'€',3),'%');
                  end;

{gotoxy(1,1);
write (tempbook.number,'===',defined.number);}
{gotoxy(1,1);write (tempbook.recnumber,'---',defined.recnumber);}
if (vall(defined.recnumber)<>(filepos(reference)-1))and
   (farsinum(dtrims(tempbook.number))=farsinum(dtrims(defined.number))) then begin
textbackground(1);
textcolor(15);
gotoxy(34,8);
write ('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
textcolor(14);
textbackground(4);
gotoxy(27,7);
write ('ı¤¤î—');
sound (1000);
delay (50);
sound (2000);
delay (50);
sound (3000);
delay (50);
nosound;
for j:=1 to 200 do begin
gotoxy(27+5,7);
ss.setcursor(8);
if not (keypressed or leftbuttonpressed) then delay (50) else break;
ss.setcursor($2000);
writetime;
ss.setcursor($2000);
textcolor(14);
textbackground(4);
gotoxy(27,7);
if j mod 80<40 then write ('ı¤¤î—') else write (fixof(farsinum(defined.number),'€',6));
end;
notexist1:=false;
break;
end else notexist1:=true;
end;
textbackground(1);
textcolor(15);
gotoxy(34,8);
write ('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');

textcolor(15);
textbackground(0);
gotoxy(27,7);
write(farsinum(fixof(defined.number,' ',6)));
while keypressed do readkey;
close(reference);
end;
procedure drawmemframe;
begin
  window(1,1,80,25);
textcolor (15);
textbackground(1);
gotoxy(1,1);
write('ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍ»');
write('º                                    ³ ¢î ³ /€€ ù¡¨÷ - ¤¢“‘—î ³ ¢¡ ô‘÷ ù“ º');
write('ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹');
write('º                                ù÷‘¡“‘—î ı‘®ä                                º');
write('ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º                                                                              º');
write('º     ÚÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿      º');
write('º     ³ ƒ ’‘—î ³ ‚ ’‘—î ³  ’‘—î ³         üğ¢ø÷‘¡ ô‘÷ø ô‘÷ ³       ¢î ³      º');
write('º     ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄ´      º');for i:=10 to 20 do
write('º     ³        ³        ³        ³                           ³          ³      º');
write('º     ÀÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙ      º');
write('º                                                                              º');
write('ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º                    -ø›—¨›-    -©ş¤şø    -ùê‘®-    --é£Ÿ--                  º');
write('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
gotoxy(34,4);
textcolor(14);
write ('ù÷‘¡“‘—î ı‘®ä');
textcolor(13);
gotoxy(8,8);
write (' ƒ ’‘—î ');
gotoxy(17,8);
write (' ‚ ’‘—î ');
gotoxy(26,8);
write ('  ’‘—î ');
gotoxy(35,8);
write ('         üğ¢ø÷‘¡ ô‘÷ø ô‘÷ ');
gotoxy (63,8);
write('       ¢î ');

writetime;
end;
procedure membermenu;
var memberfile:file of memberstype;
    member,thismember:memberstype;
begin
drawmemframe;
assign (memberfile,'members.kdd');
{reset(memberfile);}
halt;
end;
end.
{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
