{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
unit ketabsup;
{     Interface                                               }interface
uses textef,easyer,mousedrv,ncrt,dos,screen,kdbtype,ketabs2;
function notexist(defined:booktype):boolean;
procedure deletemenu(thisbook:booktype);
procedure updatethisbook;
procedure nodefine(var defined:booktype);
procedure nobookmsg;
procedure endopend(var name1:string);
function getstring(x,y,xlength,ylength,fcolor,bcolor:integer;neop:boolean):string;
procedure adddata(defined:booktype);
procedure readthisbook;
procedure list10build(definedbook:booktype);
procedure list10read;
procedure list10write;
function fixof(s,adds:string;len:integer):string;
procedure writeinfo(thisbook:booktype;row:integer);
procedure listwrite(abookinlist:bookinlisttype;row:integer);
function englishnum(s:string):integer;
function farsinum(s:string):string;
function farsinum1(s:char):char;
procedure menuswrite;
procedure drawframe(fnum:integer);
procedure ketabdar;
{procedure writetime;}
function Zerof(w : integer) : String;
{function farsi(s:string):string;}
function beforeopen(s:string):boolean;
function endend(s:string):string;
function endopen(s:string):boolean;
procedure fixbeginproblem(var s:string;name1:string);
procedure fixla(var s:string);
procedure filemenu;
procedure viewmenu;
procedure toolsmenu;
procedure securitymenu;
procedure helpmenu;
{procedure deletemenu(defined:booktype);}
procedure insertmenu;
procedure refreshdata(sortorder:string;defined:booktype);
procedure shutdown;
{     Implementation                                          }implementation
var
{Book types}
sr,alakis:string;
defined,thisbook,definedo:booktype;
book:booklisttype;
Itemp:array[1..20] of integer;
reference: file of booktype;
bookinlist:array[1..10] of bookinlisttype;
listfile:file of booklisttype;

{Others}
    mode:byte;
    ii:array[1..10] of integer;
    i:integer;
    prt:integer;
    jj:array[1..10] of integer;

const
administrator:boolean=true;
user:string8='';
username:string25='';
userfilecode:longint=-1;
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

procedure nodefine(var defined:booktype);
begin
name:='';
bgroup:='';
statue:='';
bnumb:='';
defined.name:='';
defined.number:='';
defined.group:='';
defined.statue:=notdefined;
defined.description:='';
end;
procedure endopend(var name1:string);
begin
if pos(copy(name1,1,1),endeds) <> 0 then begin
if length(name1)=1 then name1:=copy(farsiz,pos(name1,endeds),1);
if length(name1)>1 then name1:=copy(farsiz,pos(copy(name1,1,1),endeds),1)+copy(name1,2,length(name1)-1);
end;
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
function beforeopen(s:string):boolean;
begin
if length(s)>1 then s:=copy(s,1,1);
beforeopen:=(pos(s,beforeopens)<>0);
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

{procedure writetime;
var
  ss:cursor;
  itmp,x,y:integer;
  h,m,s,p:word;
  yr, mn, dy, dow : Word;
  inthename:string;
  ketabdars:string;
begin
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
end;}

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
procedure fixla(var s:string);
begin
if length(s)>1 then if copy(s,1,2)='‘ó' then begin
if length(s)=2 then s:='ò' else s:='ò'+copy(s,3,length(s)-2);
end;
end;
procedure drawframe(fnum:integer);
var ss:cursor;
    yy,xx,ij:integer;
begin
  window(1,1,80,25);
  ss.Init;
textcolor (15);
textbackground(1);
gotoxy(1,1);
write('ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍ»');
write('º                                    ³ ¢î ³ /€€ ù¡¨÷ - ¤¢“‘—î ³ ¢¡ ô‘÷ ù“ º');
write('ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹');if fnum=1 then
write('º                                          íõî  –ş÷õ  –‘÷‘îõ  ©ş‘õ÷  ù¢÷ø¤•  º');if fnum=2 then
write('º       ¢şş¥êş“ ¤¢“‘—î ö¥¡õ ù“ ’‘—î üûø¡ó¢ ¢¢ã— ¢ş÷ø—üõ ø÷õ öş ¤¢        º');if fnum=3 then
write('º                         ù¢ª ’‘¡—÷ ’‘—î –‘¬¡ªõ ¤şşç—                         º');
write('ÇÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÂÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');if fnum=1 then
write('º–şã®ø³      ùø¤ğ³ ¯³ù¨êì³ ù¤‘õª³ü¨şóğ÷ ü¨¤‘ê ’‘—î ş®ø—/ô‘÷³    ø –‘¬¡ªõ   º');if fnum>1 then
write('º–şã®ø³      ùø¤ğ³ ¯³ù¨êì³ ù¤‘õª³ü¨şóğ÷ ü¨¤‘ê       ’‘—î ô‘÷³    ø –‘¬¡ªõ   º');
write('º     ³          ³  ³    ³      ³                              ³  ’‘—î –‘Ÿş®ø— º');
write('ÇÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÅÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ø›—¨› ÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('º     ³          ³  ³    ³      ³                              ³               º');
write('ÇÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÁÄÄÄÄÁÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´               º');if fnum=1 then
write('º’ş—¤—ù“ ’‘¡—÷ ùê‘® é£Ÿ ©ş¤şø³        :ñî             : –¨şó³               º');if fnum=2 then
write('º    ö¢¤î ùê‘® ıø÷õ ¥ šø¤¡    ³        :ñî                   ³               º');if fnum=3 then
write('º      ©ş¤şø ıø÷õ ¥ šø¤¡      ³                              ³               º');
write('ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´               º');
write('º                                                              ³               º');
write('º                                                              ³               º');
write('º                                                              ³               º');
write('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
writetime;
gotoxy(80,25);
gotoxy(2,4);
textbackground(7);
textcolor (0);
if fnum=1 then begin
write('                                          íõî  –ş÷õ  –‘÷‘îõ  ©ş‘õ÷  ù¢÷ø¤•  ');
gotoxy (76,4);
write ('¤');
gotoxy (69,4);
write ('÷');
gotoxy (62,4);
write ('');
gotoxy (49,4);
write ('–');
gotoxy (45,4);
write ('õ');
end;
textcolor(9);
textbackground(1);
if fnum=2 then write('       ¢şş¥êş“ ¤¢“‘—î ö¥¡õ ù“ ’‘—î üûø¡ó¢ ¢¢ã— ¢ş÷ø—üõ ø÷õ öş ¤¢        ');
if fnum=3 then write('                         ù¢ª ’‘¡—÷ ’‘—î –‘¬¡ªõ ¤şşç—                         ');
gotoxy (69,2);
{textbackground(1);
textcolor (02);
write ('¢¡ ô‘÷ ù“');}
textbackground (1);
textcolor (13);
gotoxy(2,6);
write('–şã®ø');
gotoxy(8,6);
write('      ùø¤ğ');
textcolor(9);
gotoxy(19,6);
write(' ¯');
gotoxy(22,6);
write('ù¨êì');
textcolor(13);
gotoxy(27,6);
write(' ù¤‘õª');
gotoxy(34,6);
if fnum>1 then
write('                      ’‘—î ô‘÷');
if fnum=1 then
write('                ’‘—î ş®ø—/ô‘÷');
gotoxy(34,6);
textcolor (9);
write('ü¨şóğ÷',chr(4));
gotoxy(43,6);
write('ü¨¤‘ê',chr(4));
gotoxy(2,7);
textcolor (15);
textbackground(0);
write('     ³          ³  ³    ³      ³                              ');
if fnum=1 then textbackground(6);
if fnum>1 then  textbackground(1);
if fnum>1 then  textcolor(15);
for i:=1 to 10 do begin
gotoxy(2,i+8);
write('     ³          ³  ³    ³      ³                              ');
end;
textbackground(2);
textcolor (14);
gotoxy(57,8);
if fnum=1 then begin
write(' ø›—¨› ');
textcolor(11);
gotoxy(61,8);
write('¨');
end;
if fnum=2 then write(' ùê‘® ');
if fnum=3 then write(' ©ş¤şø');
textbackground(7);
textcolor(0);
gotoxy(2,20);
if fnum=1 then begin
write ('’ş—¤—ù“ ’‘¡—÷ ùê‘® é£Ÿ ©ş¤şø');
textcolor(6);
gotoxy(8,20);
write('“');
gotoxy(12,20);
write('¡');
gotoxy(20,20);
write('®');
gotoxy(25,20);
write('Ÿ');
gotoxy(31,20);
write('ş');
end;
textbackground(2);
textcolor(14);
if fnum=2 then write ('    ö¢¤î ùê‘® ıø÷õ ¥ šø¤¡    ');
if fnum=3 then write ('      ©ş¤şø ıø÷õ ¥ šø¤¡      ');
if keypressed then readkey;
textbackground(7);
textcolor(0);
if fnum=1 then list10read;
if fnum<>3 then list10write;
if fnum=1 then readthisbook;
if fnum=1 then writeinfo(thisbook,listord);
if fnum>1 then begin
textbackground(0);
xx:=80;
yy:=9;
ij:=0;
for ij:=1 to 240 do begin
xx:=xx-1;
if xx<65 then begin;yy:=yy+1;xx:=79;end;
gotoxy(xx,yy);
write(' ');
end;
end;
end;

procedure filemenu;
var
i:integer;
begin
textbackground(4);
gotoxy(72,4);
textcolor(0);
write('ù¢÷ø');
textcolor(6);
write('¤');
textcolor(0);
write('•');

i:=choose ('¤“¤‘î ¤şşç—Ššø¤¡',61,5,1);
           showmouse;
if i=2 then shutdown;
end;

procedure viewmenu;
var
i:integer;
begin
textbackground(4);
gotoxy(65,4);
textcolor(0);
write('©ş‘õ');
textcolor(6);
write('÷');
i:=choose ({'‘û’‘—îŠ}'ù÷‘¡“‘—î ı‘®ä',50,5,1);
           showmouse;

if i=1 then membermenu;
end;

procedure toolsmenu;
var
i:integer;
begin
textbackground(4);
gotoxy(56,4);
textcolor(5);
write('–‘÷‘îõ');
{i:=choose ('',,,);}
           showmouse;
end;

procedure securitymenu;
var
i:integer;
begin
textbackground(4);
gotoxy(49,4);
textcolor(5);
write('–ş÷õ');

{i:=choose ('',,,);}
           showmouse;
end;

procedure helpmenu;
var
i:integer;
begin
textbackground(4);
gotoxy(44,4);
textcolor(0);
write('í');
textcolor(6);
write('õ');
textcolor(0);
write('î');

i:=choose ('ù¢÷¨şø÷ ù¤‘“¤¢',27,5,1);
           showmouse;
end;



procedure refreshdata(sortorder:string;defined:booktype);
begin
if sortorder<>'.' then readthisbook;
if sortorder<>'.' then writeinfo(thisbook,listord);
if (dtrims(defined.name)<>'') or (dtrims(defined.number)<>'') or (dtrims(defined.group)<>'')or (defined.statue<>notdefined)or
   (numberofbooks=0)or(totalbooks=0) or(numberofbooks<>totalbooks)or(insertrefresh) or (numberofbooks<11) then begin
insertrefresh:=false;
list10build(defined);
{write ('...',defined.name,'...');
readln;}
list10read;
list10write;
if sortorder<>'.' then readthisbook;
if sortorder<>'.' then writeinfo(thisbook,listord);
end;
end;


procedure menuswrite;
begin
textbackground(7);
gotoxy(72,4);
textcolor(0);
write('ù¢÷ø');
textcolor(6);
write('¤');
textcolor(0);
write('•');
gotoxy(65,4);
textcolor(0);
write('©ş‘õ');
textcolor(6);
write('÷');
gotoxy(56,4);
textcolor(5);
write('–‘÷‘îõ');
gotoxy(49,4);
textcolor(5);
write('–ş÷õ');
gotoxy(44,4);
textcolor(0);
write('í');
textcolor(6);
write('õ');
textcolor(0);
write('î');
gotoxy(27,20);
textcolor(0);
write('©ş¤');
textcolor(6);
write('ş');
textcolor(0);
write('ø');
gotoxy(23,20);
textcolor(0);
write('é£');
textcolor(6);
write('Ÿ');
gotoxy(17,20);
textcolor(0);
write('ùê‘');
textcolor(6);
write('®');
textcolor(0);
write('');
gotoxy(10,20);
textcolor(5);
write('’‘¡—÷');
textcolor(5);
gotoxy(2,20);
write('’ş—¤—ù“');
textcolor(9);
textbackground(1);
gotoxy(34,6);
write ('ü¨şóğ÷',#4,' ü¨¤‘ê',#4);
textbackground(2);
gotoxy(57,8);
textcolor (14);
write(' ø›—');
textcolor(11);
write('¨');
textcolor (14);
write('› ');

end;

procedure shutdown;
var ss:cursor;
begin
hidemouse;
ss.SetCursor($2000);
sound (8000);
delay (50);
sound (5000);
delay (50);
sound (4000);
delay (50);
sound (3000);
delay (50);
sound (2000);
delay (50);
sound (1000);
delay (50);
nosound;
clscr;
textbackground(0);
textcolor(7);
clrscr;
ss.SetCursor(3470);
sound (4000);
delay (50);
sound (2000);
delay (50);
sound (1000);
delay (50);
nosound;
while keypressed do readkey;
halt;
end;
{---------------------------------------------------------------------------}
procedure ketabdar;
var c:char;
    definedbook:booktype;
    bnumbo,bgroupo,statueo,namo,s:string;
    english:boolean;
    ss:cursor;
    modo:integer;
    databasefile:searchrec;
begin
insertis:=false;
ss.SetCursor($2000);
numberofbooks:=0;
assign(reference,'database.kdd');
findfirst ('database.kdd',anyfile,databasefile);
if (doserror=2) or (doserror=18) then rewrite (reference) else reset(reference);
assign(listfile,'list.kdl');
rewrite (listfile);
drawframe(1);
{halt;}
{initialize}
definedo.name:='';
definedo.number:='';
definedo.group:='';
definedo.statue:=notdefined;
definedo.description:='';

definedbook.name:='';
definedbook.number:='';
definedbook.group:='';
definedbook.statue:=notdefined;
list10build(definedbook);
list10read;
list10write;
readthisbook;
writeinfo(thisbook,1);
modo:=1;
c:=#255;
s:='';
name   :='';
namo   :='';

bnumb  :='';
bnumbo :='';

bgroup :='';
bgroupo:='';

statue :='';
statueo:='';

english:=false;
mode:=1;
repeat
insertis:=false;
ss.SetCursor($2000);
textcolor(15);
textbackground(1);
gotoxy(51,20);
write(fixof(farsinum(strl(numberofbooks)),'€',6));
gotoxy(35,20);
write(fixof(farsinum(strl(totalbooks)),'€',6));
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

gotoxy(33-length(bnumb),7);
write(farsinum(bnumb));
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
{edit    }   if (s=#0+#32) and (numberofbooks<>0)then begin;drawframe(3);readthisbook;
                              nodefine(defined);{menuswrite;}editmenu(thisbook);
                              updatethisbook;
                              drawframe(1);
                              refreshdata(sortme,defined);end;
{del     }   if (s=#0+#25) and (numberofbooks<>0)  then begin;nodefine(defined);menuswrite;deletemenu(thisbook);
                              drawframe(1);refreshdata(sortme,defined);end;
{ins     }   if (s=#0+#16) or (s=#0+#82)then begin;nodefine(defined);menuswrite;
                                             insertmenu;menuswrite;list10write;writeinfo(thisbook,listord);
                                             ;drawframe(1);refreshdata(sortme,defined);end;
{select  }{  if s=#0+#24 then begin;menuswrite;selectmenu         ;drawframe(1);                           ;end;}
{sort    }{  if s=#0+#33 then begin;menuswrite;sortmenu           ;drawframe(1);refreshdata(sortme,defined);end;}
{help    }   if s=#0+#38 then begin;menuswrite;helpmenu           ;drawframe(1);                           ;end;
{tools   }{  if s=#0+#35 then begin;menuswrite;toolsmenu          ;drawframe(1);                           ;end;}
{security}{  if s=#0+#36 then begin;menuswrite;securitymenu       ;drawframe(1);                           ;end;}
{view    }   if s=#0+#37 then begin;menuswrite;viewmenu           ;drawframe(1);                           ;end;
{file    }   if s=#0+#47 then begin;menuswrite;filemenu           ;drawframe(1);                           ;end;
{search  }   if s=#0+#31 then begin;menuswrite;c:=#13;end;

if mode=1 then begin
if name=' ' then name:='';
     textbackground(1);
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
if name=' ' then name:='';
{M}   {english   } if (ii[9]>33) and (ii[9]<42) and (ii[10]=06) then
{O}                    begin;name:=endend(name);english:=true;end;
{D}
{E}   {farsi     } if (ii[9]>42) and (ii[9]<49) and (ii[10]=06) then
{1}                    english:=false;
   end;

{edit      } if (ii[9]>26) and (ii[9]<33) and (ii[10]=20) and (numberofbooks<>0) then
                begin;drawframe(3);readthisbook;{menuswrite;}editmenu(thisbook);
                updatethisbook;drawframe(1);refreshdata(sortme,defined);end;

{del       } if (ii[9]>22) and (ii[9]<26) and (ii[10]=20)  and (numberofbooks<>0) then
                begin;nodefine(defined);menuswrite;deletemenu(thisbook);drawframe(1);refreshdata(sortme,defined);end;

{ins       } if (ii[9]>16) and (ii[9]<22) and (ii[10]=20) then
                begin;nodefine(defined);menuswrite;insertmenu;list10write;writeinfo(thisbook,listord);
         ;drawframe(1);refreshdata(sortme,defined);end;

{select    }{if (ii[9]>09) and (ii[9]<16) and (ii[10]=20) then
                begin;menuswrite;selectmenu         ;drawframe(1);refreshdata;               ;end;}

{sort      }{if (ii[9]>01) and (ii[9]<09) and (ii[10]=20) then
                begin;menuswrite;sortmenu           ;drawframe(1);refreshdata(sortme,defined);end;}

{help      } if (ii[9]>43) and (ii[9]<47) and (ii[10]=04) then
                begin;menuswrite;helpmenu    ;drawframe(1);                            ;end;

{tools     }{if (ii[9]>55) and (ii[9]<63) and (ii[10]=04) then
                begin;menuswrite;toolsmenu   ;drawframe(1);refreshdata;               ;end;}

{security  }{if (ii[9]>48) and (ii[9]<54) and (ii[10]=04) then
                begin;menuswrite;securitymenu;drawframe(1);                           ;end;}

{view      } if (ii[9]>64) and (ii[9]<70) and (ii[10]=04) then
                begin;menuswrite;viewmenu    ;drawframe(1);                           ;end;

{file      } if (ii[9]>71) and (ii[9]<78) and (ii[10]=04) then
                begin;menuswrite;filemenu    ;drawframe(1);                           ;end;

{search    } if (ii[9]>56) and (ii[9]<64) and (ii[10]=08) then
                begin;menuswrite;c:=#13;end;
end;


if (((mousex/8)+1>56) and ((mousex/8)+1<64) and (trunc(mousey/8)+1=8)) or (prt=56)then textbackground(4)
                                                                          else textbackground(2);
gotoxy(57,8);
textcolor (14);
write(' ø›—');
textcolor(11);
write('¨');
textcolor (14);
write('› ');

if (((mousex/8)+1>71) and ((mousex/8)+1<78) and (trunc(mousey/8)+1=4)) or (prt=56)then textbackground(4)
                                                                          else textbackground(7);
gotoxy(72,4);
textcolor(0);
write('ù¢÷ø');
textcolor(6);
write('¤');
textcolor(0);
write('•');
if (((mousex/8)+1>64) and ((mousex/8)+1<70) and (trunc(mousey/8)+1=4)) or (prt=56)then textbackground(4)
                                                                          else textbackground(7);
gotoxy(65,4);
textcolor(0);
write('©ş‘õ');
textcolor(6);
write('÷');

if (((mousex/8)+1>48) and ((mousex/8)+1<54) and (trunc(mousey/8)+1=4)) or (prt=56)then textbackground(4)
                                                                          else textbackground(7);
gotoxy(49,4);
textcolor(5);
write('–ş÷õ'{—});
if (((mousex/8)+1>55) and ((mousex/8)+1<63) and (trunc(mousey/8)+1=4)) or (prt=56)then textbackground(4)
                                                                          else textbackground(7);
gotoxy(56,4);
textcolor(5);
write('–‘÷‘îõ'{});

if (((mousex/8)+1>43) and ((mousex/8)+1<47) and (trunc(mousey/8)+1=4)) or (prt=56)then textbackground(4)
                                                                       else textbackground(7);
gotoxy(44,4);
textcolor(0);
write('í');
textcolor(6);
write('õ');
textcolor(0);
write('î');

if (((mousex/8)+1>26) and ((mousex/8)+1<33) and (trunc(mousey/8)+1=20)) or (prt=56)then textbackground(4)
                                                                           else textbackground(7);
gotoxy(27,20);
textcolor(0);
write('©ş¤');
textcolor(6);
write('ş');
textcolor(0);
write('ø');

if (((mousex/8)+1>22) and ((mousex/8)+1<26) and (trunc(mousey/8)+1=20)) or (prt=56)then textbackground(4)
                                                                           else textbackground(7);
gotoxy(23,20);
textcolor(0);
write('é£');
textcolor(6);
write('Ÿ');

if (((mousex/8)+1>16) and ((mousex/8)+1<22) and (trunc(mousey/8)+1=20)) or (prt=56)then textbackground(4)
                                                                           else textbackground(7);
gotoxy(17,20);
textcolor(0);
write('ùê‘');
textcolor(6);
write('®');
textcolor(0);
write('');
if (((mousex/8)+1>9) and ((mousex/8)+1<16) and (trunc(mousey/8)+1=20)) or (prt=56)then textbackground(4)
                                                                           else textbackground(7);
gotoxy(10,20);
textcolor(5);
write('’‘¡—÷'{¡});
if (((mousex/8)+1>1) and ((mousex/8)+1<9) and (trunc(mousey/8)+1=20)) or (prt=56)then textbackground(4)
                                                                      else textbackground(7);
gotoxy(2,20);
textcolor(5);
write('’ş—¤—ù“'{“});
if dtrims(statue)='' then defined.statue:=notdefined;
if (c=#13) and (mode<>7) then begin
              listord:=1;
              startlistord:=0;
              refreshdata(sortme,defined);
              if numberofbooks=0 then begin
              nobookmsg;
              thisbook.description:='';
              defined:=definedo;
              end;
              if numberofbooks>0 then definedo:=defined;
              {drawframe(1);}name:=endend(name);

              while (numberofbooks=0) and (totalbooks<>0) do begin
              listord:=1;
              startlistord:=0;
              refreshdata(sortme,defined);
              if numberofbooks=0 then begin
              nobookmsg;
              thisbook.description:='';
              defined:=definedo;
              end;
              if numberofbooks>0 then definedo:=defined;
              {drawframe(1);}name:=endend(name);
              end;
              end;
if (s=#9) then mode:=mode+1;
if s=#0+#15 then mode:=mode-1;
if mode>7 then mode:=1;
if mode<1 then mode:=7;
{Demo mode Begin}
if ((mode=3) or (mode=4)) then begin
if modo<5 then mode:=5 else mode:=2;
end;
modo:=mode;
{Demo mode Ended}
if (copy(name,1,1)='ú') and (not endopen(copy(name,2,1))) then name:=('û'+copy(name,2,length(name)-1));
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
   if (mode=7) and (numberofbooks=0) and (modo<4) then mode:=6;
   if (mode=7) and (numberofbooks=0) and (modo>3) then mode:=1;

if mode=7 then begin
   if (s=#13) and (numberofbooks<>0)  then begin;drawframe(3);readthisbook;nodefine(defined);{menuswrite;}editmenu(thisbook);
                              updatethisbook;drawframe(1);
                              refreshdata(sortme,defined);end;

   if s=#0+#72 then listord:=listord-1;
   if s=#0+#73 then listord:=listord-50;
   if s=#0+#80 then listord:=listord+1;
   if s=#0+#81 then listord:=listord+50;
   if s=#0+#132 then listord:=listord-100;
   if s=#0+#118 then listord:=listord+100;
   if s=#0+#79 then begin;listord:=10;startlistord:=numberofbooks-10;end;
   if s=#0+#71 then begin;listord:=1;startlistord:=0;end;
   if numberofbooks=1 then begin;listord:=1;startlistord:=0;startlistordo:=0;end;
{   if listord+startlistord>numberofbooks-9 then listord:=numberofbooks-startlistord;}

   if listord<-70 then begin;listord:=1;startlistord:=startlistord-500;end;
   if listord>70 then begin;listord:=10;startlistord:=startlistord+500;end;
   if listord<-15 then begin;listord:=1;startlistord:=startlistord-50;end;
   if listord>29 then begin;listord:=10;startlistord:=startlistord+50;end;
   if listord>numberofbooks then listord:=numberofbooks;
   if listord<01 then begin;listord:=01;startlistord:=startlistord-1;end;
   if listord>10 then begin;listord:=10;startlistord:=startlistord+1;end;
   if startlistord>numberofbooks-10 then startlistord:=numberofbooks-10;
   if startlistord<00 then startlistord:=00;

{write (startlistord,numberofbooks);
delay(1000);}
   if (startlistord<>startlistordo)then begin
   list10read;
   list10write;
   readthisbook;
   writeinfo(thisbook,listord);
   startlistordo:=startlistord;
   end;
   if listord<>listordo then begin;list10write;readthisbook;writeinfo (thisbook,listord);listordo:=listord;end;

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
{E}s:='';
   c:=#219;
{6}if i>-2 then mode:=7;
   if i=-2 then mode:=5;
   if i=0 then statue:='';
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
{D}textbackground(6);
   for i:=1 to 10 do begin
{E}gotoxy(1,8+i);
   textbackground(1);
   write('º');
   textbackground(6);
   write('     ³');
ss.SetCursor($2000);
list10write;
writeinfo(thisbook,listord);
if mode<>7 then ss.SetCursor($3470);
{6}end;
end;
definedbook.name:=dtrims(name);
definedbook.number:=dtrims(bnumb);
definedbook.group:=dtrims(bgroup);
definedbook.statue:=notdefined;
if dtrims(statue)='–÷‘õ' then definedbook.statue:=lended;
if dtrims(statue)='¤®‘Ÿ' then definedbook.statue:=normal;
if dtrims(statue)='¤şõã—' then definedbook.statue:=repair;
if dtrims(statue)='¢øìêõ' then definedbook.statue:=lost;
if dtrims(statue)='' then definedbook.statue:=notdefined;
if (mode=5) and (c<>#219) then begin
     gotoxy(7,8);
{M}  i:=choose('*üõóäŠü“û£õ ü÷ş¢Šâ›¤õŠüª¥øõ íõîŠüä‘õ—›Š–çó ï÷û¤êŠü“¢-ö‘õ¤Šü¨‘ş¨Š¢‘¬—ì-ñø•Šüş‘şê¤ç›Šü¡ş¤‘—',   7,7,5);
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
   if i=0 then bgroup:='';
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
{E}textbackground(6);
   for i:=1 to 10 do begin
{5}gotoxy(7,8+i);
   write('³          ³');
   end;
if mode<>7 then ss.SetCursor($2000);
list10write;
writeinfo(thisbook,listord);
ss.SetCursor($3470);
end;
if c=#219 then c:=#255;


{if (bnumb<>'') or (name<>'') or (bgroup<>'') or (statue<>'') then defined:=bnumb+''+endend(name)+''+bgroup+''+statue;}
{   gotoxy(2,2);
   write (defined);}
   if c=#27 then begin;menuswrite;filemenu;drawframe(1);end;
if mode =1 then gotoxy(63-length(name),7);
if mode =2 then gotoxy(32,7);
if mode =3 then gotoxy(25,7);
if mode =4 then gotoxy(20,7);
if mode =5 then gotoxy(17,7);
if mode =6 then gotoxy(6-length(statue),7);
if mode<>7 then ss.SetCursor(3470);
delay(30);
defined.group:=dtrims(bgroup);
defined.name:=dtrims(endend(name));
if dtrims(statue)='¤®‘Ÿ' then defined.statue:=normal;
if dtrims(statue)='–÷‘õ'then defined.statue:=lended;
if dtrims(statue)='¤şõã—'then defined.statue:=repair;
if dtrims(statue)='¢øìêõ'then defined.statue:=lost;
defined.number:=dtrims(bnumb);
insertis:=false;
   until 1=2;
end;

procedure listwrite(abookinlist:bookinlisttype;row:integer);
var s:string;
begin
if row<1 then row:=1;
textbackground(6);
textcolor(15);
gotoxy(02,8+row);
if insertis then begin
textbackground(1);
write('     ');
textcolor(15);
write('³');
end else begin
case abookinlist.statue of
notdefined:write('     ³');
   normal :write(' ¤®‘Ÿ³');
   lended :write('–÷‘õ³');
   repair :write('¤şõã—³');
   lost   :write('¢øìêõ³');
end;
end;
if insertis then textcolor(1);
gotoxy(08,8+row);write(fixof(abookinlist.group,' ',10));
textcolor(15);
write('³  ³    ³');
if insertis then textcolor(1);
gotoxy(27,8+row);write(farsinum(fixof(abookinlist.number,'€',6)));
textcolor(15);
write('³');
if insertis then textcolor(1);
gotoxy(34,8+row);write(fixof(abookinlist.name,' ',30));
{halt;}
end;

procedure writeinfo(thisbook:booktype;row:integer);
var s:string;
 myi,myx,myy:integer;
 bookok:boolean;
begin
bookok:=true;
if dtrims(thisbook.name)='' then bookok:=false;
if dtrims(thisbook.number)='' then bookok:=false;
if dtrims(thisbook.group)='' then bookok:=false;
if (thisbook.statue)=notdefined then bookok:=false;
if row<0 then row:=1;
if row<>0 then begin
textcolor(15);
if bookok then textbackground(4);
gotoxy(02,8+row);
case thisbook.statue of
notdefined :write('     ³');
normal :write(' ¤®‘Ÿ³');
lended :write('–÷‘õ³');
repair :write('¤şõã—³');
lost   :write('¢øìêõ³');
end;
gotoxy(08,8+row);
write(fixof(thisbook.group,' ',10),'³  ³    ³');
gotoxy(27,8+row);write(farsinum(fixof(thisbook.number,'€',6)),'³');
gotoxy(34,8+row);write(fixof(thisbook.name,' ',30));
end;
if insertis then textbackground(0) else textbackground(1);
textcolor(15);
window(65,9,79,24);
clrscr;
s:=fixof(thisbook.description,' ',225);
myx:=15;
myy:=1;
for myi:=1 to 225 do begin
gotoxy(myx,myy);
if myy<18 then write(copy(s,(length(s)+1)-myi,1));
myx:=myx-1;
if myx<1 then begin;myx:=15;myy:=myy+1;end;
end;
textbackground(1);window(2,22,63,24);
clrscr;
if thisbook.statue=lended then begin
write (fixof(thisbook.borrowdate[1],' ',8),':–÷‘õ  ş¤‘—   ');
textcolor(14);
s:=thisbook.borrower[1];
repeat
if length(s)<25 then s:=' '+s;
until length(s)>=25;

write (fixof(fixof(thisbook.borrower[1],'€',8),' ',25),' :ù¢÷¤şğ –÷‘õ');
s:='';
for jj[1]:=2 to maxreserver do begin
if (not insertis) then begin
if (s<>'') and (dtrims(thisbook.borrower[jj[1]])<>'') then s:=fixof(thisbook.borrower[jj[1]],'€',8)+' ø '+s;
if (s= '') and (dtrims(thisbook.borrower[jj[1]])<>'') then s:=fixof(thisbook.borrower[jj[1]],'€',8)        ;
end;
if (dtrims(thisbook.borrower[jj[1]])= '') and (insertis) then begin
if (s<>'') then s:=fixof(thisbook.borrower[jj[1]],'€',8)+' ø '+s;
if (s= '') then s:=fixof(thisbook.borrower[jj[1]],'€',8)        ;
end;
end;
gotoxy(2,3);
textcolor (9);
if (dtrims(s)<>'') or (insertis) then write (fixof(s,' ',60-14)+ ' :ö‘ğ¢÷÷î ø¤¥¤');
textcolor(15);
gotoxy(1,2);
write (fixof(thisbook.givebackdate[1],' ',8),': –¢øä  ş¤‘—   ');
end;
if thisbook.statue=lost then begin
write (fixof(thisbook.lostdate,' ',8),':ö¢ìê  ş¤‘—   ');
textcolor(14);
gotoxy (1,2);
write (fixof(thisbook.lostmsg,' ',62));
textcolor(15);
end;
if thisbook.statue=repair then begin
textcolor(14);
gotoxy (1,1);
write (fixof(thisbook.repairmsg,' ',62));
textcolor(15);
end;

window(1,1,80,25);
{gotoxy(2,24);
textcolor(0);
textbackground(1);
if bookok then write (fixof(farsinum(thisbook.recnumber),'€',6));
textcolor(15);}
end;
function fixof(s,adds:string;len:integer):string;
var i,j,k:integer;
begin
repeat
if length(s)<len then s:=adds+s;
until length(s)>=len;
fixof:=s;
end;
procedure list10write;
var tempbook:bookinlisttype;
begin
{booklistview}
tempbook.name:='                              ';
tempbook.number:='      ';
tempbook.group:='          ';
tempbook.statue:=notdefined;
itemp[2]:=10;
if (itemp[2])>numberofbooks then itemp[2]:=numberofbooks;
{write (itemp[2],'Salam kfdsjaflkjs');
delay(500);}
if itemp[2]>10 then itemp[2]:=10;
for itemp[1]:=1 to itemp[2] do begin
listwrite(bookinlist[itemp[1]],itemp[1]);
end;
for itemp[1]:=itemp[2]+1 to 10 do begin
listwrite(tempbook,itemp[1]);
end;
{end of blistview}
end;
procedure list10read;
begin
{end of blistview}
 for itemp[1]:=1 to 10 do begin
 bookinlist[(itemp[1])].name:='';
 bookinlist[(itemp[1])].number:='';
 bookinlist[(itemp[1])].recnumber:='';
 bookinlist[(itemp[1])].group:='';
 bookinlist[(itemp[1])].statue:=notdefined;
end;
seek(reference,0);
seek(listfile,0);
if startlistord<0 then startlistord:=0;
itemp[2]:=startlistord+9;
if itemp[2]>numberofbooks-1 then itemp[2]:=numberofbooks-1;
for itemp[1]:=startlistord to itemp[2] do begin
{gotoxy(3,3);
 write('.',itemp[1],'.',filesize(listfile),'.');}
 seek(listfile,itemp[1]);
 if filesize(listfile)>0 then begin
 read(listfile,book);
 seek(reference,vall(book.recnumber));
 read(reference,thisbook);
 bookinlist[(itemp[1]+1)-startlistord].name:=thisbook.name;
 bookinlist[(itemp[1]+1)-startlistord].number:=thisbook.number;
 bookinlist[(itemp[1]+1)-startlistord].recnumber:=book.recnumber;
 bookinlist[(itemp[1]+1)-startlistord].group:=thisbook.group;
 bookinlist[(itemp[1]+1)-startlistord].statue:=thisbook.statue;
end else begin
 bookinlist[(itemp[1]+1)-startlistord].name:='';
 bookinlist[(itemp[1]+1)-startlistord].number:='';
 bookinlist[(itemp[1]+1)-startlistord].recnumber:='';
 bookinlist[(itemp[1]+1)-startlistord].group:='';
 bookinlist[(itemp[1]+1)-startlistord].statue:=notdefined;
end;
end;
for itemp[1]:=itemp[2]+2 to 10 do begin
 bookinlist[(itemp[1]+1)-startlistord].name:='';
 bookinlist[(itemp[1]+1)-startlistord].number:='';
 bookinlist[(itemp[1]+1)-startlistord].recnumber:='';
 bookinlist[(itemp[1]+1)-startlistord].group:='';
 bookinlist[(itemp[1]+1)-startlistord].statue:=notdefined;
end;

while keypressed do readkey;
end;
procedure list10build(definedbook:booktype);
var match:integer;
    check:integer;
    i2:longint;
opacity:boolean;
ss:cursor;
begin
listord:=1;
ss.setcursor($2000);
i2:=0;
opacity:=false;
if totalbooks<>numberofbooks then opacity:=true;
if totalbooks=0 then opacity:=true;
if (totalbooks=numberofbooks) and (totalbooks<>0)then opacity:=false;
{if  numberofbooks<11 then opacity:=true;}
textbackground(2);
textcolor(16);
gotoxy(34,8);
write (' ...¢ş÷î ¤“¬ ‘ê¯ó             ');
textbackground(1);
numberofbooks:=0;
rewrite(listfile);
seek(reference,0);
check:=0;
definedbook.name:=dtrims(definedbook.name);
if (dtrims(definedbook.name)<>'') or (dtrims(definedbook.number)<>'') or (dtrims(definedbook.group)<>'') or
   (definedbook.statue<>notdefined) then check:=1;
if check=0 then opacity:=false;
if totalbooks=0 then opacity:=true;
numberofbooks:=0;
gotoxy(35,20);
textcolor(15);
write(farsinum(fixof(strl(totalbooks),'€',6)));

{case definedbook.statue of
notdefined:write('     ³');
normal :write(' ¤®‘Ÿ³');
lended :write('–÷‘õ³');
repaire:write('¤şõã—³');
lost   :write('¢øìêõ³');
end;
if check=1 then halt;}

while (not eof(reference)) and (ioresult=0) do begin
match:=1;
i2:=i2+1;
book.recnumber:=strl(FilePos(reference));
read(reference,thisbook);
book.number:=thisbook.number;
if check=1 then begin
match:=1;
alakis:=definedbook.name;
endopend(alakis);
definedbook.name:=alakis;
if dtrims(definedbook.name)  <>'' then if
                             (pos(dtrims(definedbook.name  ),thisbook.name  )=0)
                              and
                              (pos(dtrims(endend(definedbook.name ) ),thisbook.name  )=0)
                              and
                              (pos(dtrims(definedbook.name  ),thisbook.description  )=0)
                              and
                              (pos(dtrims(endend(definedbook.name ) ),thisbook.description  )=0)
                              then match:=0;
definedbook.name:=endend(definedbook.name);
if dtrims(definedbook.number)<>'' then if pos(dtrims(definedbook.number),thisbook.number)=0 then match:=0;
if dtrims(definedbook.group) <>'' then if pos(dtrims(definedbook.group ),thisbook.group )=0 then match:=0;
if definedbook.statue<>notdefined then if definedbook.statue<>thisbook.statue then match:=0;
end else match:=1;
if match=1 then begin;write(listfile,book);numberofbooks:=numberofbooks+1;end;
if (check=0) and (opacity)then totalbooks:=numberofbooks;
if i2<5000 then begin
textcolor(14);
textbackground(2);
if i2<>totalbooks then gotoxy(51,8) else gotoxy(56,8);
write (' ',farsinum(fixof(strl(i2),'€',6)),' ');
textcolor(15);
if (i2<>totalbooks) and (totalbooks<>0)then write(fixof(farsinum(strl(trunc((i2 / totalbooks)*100))),'€',3),'% ');
textcolor(12);
textbackground(1);
gotoxy(51,20);
write (farsinum(fixof(strl(numberofbooks),'€',6)));
if opacity then begin
gotoxy(35,20);
textcolor(15);
write(farsinum(fixof(strl(totalbooks),'€',6)));
end;
end else
if (i2 mod 1000=0)then begin
textcolor(14);
textbackground(2);
if i2<>totalbooks then gotoxy(51,8) else gotoxy(56,8);
write (' ',farsinum(fixof(strl(i2),'€',6)),' ');
textcolor(15);
if totalbooks<>0 then begin
if i2<>totalbooks then write(fixof(farsinum(strl(trunc((i2 / totalbooks)*100))),'€',3),'% ');
end;
textcolor(12);
textbackground(1);
gotoxy(51,20);
write (farsinum(fixof(strl(numberofbooks),'€',6)));
if opacity then begin
gotoxy(35,20);
textcolor(15);
write(farsinum(fixof(strl(totalbooks),'€',6)));
end;
end;
end;
readthisbook;
thisbook.statue:=notdefined;
startlistord:=0;
listord:=1;
textcolor(15);
textbackground(1);
gotoxy(34,8);
write ('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
end;
procedure readthisbook;
begin
thisbook.name:='                              ';
thisbook.number:='      ';
thisbook.group:='          ';
thisbook.statue:=notdefined;
thisbook.recnumber:='';
if numberofbooks>0 then seek(reference,vall(bookinlist[listord].recnumber));
if numberofbooks>0 then read(reference,thisbook);
if numberofbooks>0 then thisbook.recnumber:=(bookinlist[listord].recnumber);
end;
procedure insertmenu;
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
        nodefine(defined);
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
        if numberofbooks<11 then insertrefresh:=true;
        listord:=1;
        desc:=getstring(1,1,1,1,1,1,true);
        desc:='';
        thisbook.description:='';
        definedbook.description:='';

        bookok:=true;
        insertis:=true;
        textbackground(4);
        gotoxy(17,20);
        textcolor(0);
        write('ùê‘');
        textcolor(6);
        write('®');
        textcolor(0);
        write('');
        drawframe(2);
        begin
        drawframe(2);
        ss.SetCursor($2000);
        definedbook.name:='';
        definedbook.number:='';
        definedbook.group:='';
        definedbook.description:='';
        definedbook.statue:=normal;
        ndefined.name:='';
        ndefined.number:='';
        ndefined.group:='';
        ndefined.statue:=notdefined;

{        list10build(ndefined);
        list10read;
        list10write;}
        numberofbooks:=totalbooks;
        modo:=1;
        c:=#255;
        s:='';
        name   :='';
        namo   :='';

        desc:='';
        borrower:='';
        brdate:='';
        gvdate:='';
        bnumb  :=strl(numberofbooks+1);
        bnumbo :=strl(numberofbooks+1);

        bgroup :='üõóä';
        bgroupo:='üõóä';

        statue :='¤®‘Ÿ';
        statueo:='¤®‘Ÿ';

        english:=false;
        mode:=1;
        submode:=1;
        mannumber:=totalbooks;
        repeat
        ss.SetCursor($2000);
        gotoxy(51,20);
        textcolor(15);
        textbackground(1);
        write('             ');
        gotoxy(35,20);
        write(fixof(farsinum(strl(numberofbooks)),'€',6));
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

        gotoxy(33-length(bnumb),7);
        write(farsinum(bnumb));
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
        {insert ok }   if s=#0+#16 then begin;c:=#13;end;

        if mode=1 then begin
if name=' ' then name:='';
             textbackground(1);
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
        write(' ùê‘');
        textcolor(11);
        write('®');
        textcolor (14);
        write(' ');

        if (mousetx>1) and (mousetx<33) and (mousety=20) then textbackground(4)
                                                                                 else textbackground(2);
        gotoxy(2,20);
        textcolor (14);
        write('    ö¢¤î ùê‘® ıø÷õ ¥ šø¤¡    ');

        if dtrims(statue)='' then statue:='¤®‘Ÿ';
        if dtrims(bgroup)='' then bgroup:='üõóä';
        if (dtrims(bnumb)='') and (mode<>2) then bnumb:=strl(numberofbooks+1);
        if dtrims(name)='' then bookok:=false else bookok:=true;
        if (c=#13) and (bookok) then begin
                                           definedbook.recnumber:='-1';
                                           if notexist(definedbook) then begin
                                           c:=#255;
                                           s:=#255;
                                           adddata(definedbook);
                                           definedbook.name:='';
                                           definedbook.description:='';
                                           numberofbooks:=numberofbooks+1;
                                           totalbooks:=totalbooks+1;
                                           drawframe(2);
                                           bnumb:=strl(numberofbooks+1);
                                           name:='';
                                           desc:=getstring(1,1,1,1,1,1,true);
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
        modo:=mode;
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

        desc:=dtrims(getstring(65,9,15,16,15,0,false));
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
           if i=0 then statue:='';
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
           write('º');
           textbackground(6);
           write('     ³');
        ss.SetCursor($2000);
        list10write;
        writeinfo(definedbook,0);
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
           if i=0 then bgroup:='';
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
        {list10write;
        writeinfo(definedbook,0);}
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
                                           definedbook.recnumber:='-1';
                                           if notexist(definedbook) then begin
                                           c:=#255;
                                           s:=#255;
                                           adddata(definedbook);
                                           definedbook.name:='';
                                           definedbook.description:='';
                                           numberofbooks:=numberofbooks+1;
                                           totalbooks:=totalbooks+1;
                                           drawframe(2);
                                           bnumb:=strl(numberofbooks+1);
                                           name:='';
                                           desc:='';
                                           desc:=getstring(1,1,1,1,1,1,true);
                                           end else c:=#254;
                                     end;


           until 1=2;
insertis:=false;
    {    halt;}
        definedbook.name:='';
        definedbook.number:='';
        definedbook.group:='';
        definedbook.description:='';
        definedbook.statue:=notdefined;
        name:=defined.name;
        bnumb:=defined.number;
        bgroup:=defined.group;
        case defined.statue of
           notdefined:statue:='     ';
           normal    :statue:=' ¤®‘Ÿ';
           lended    :statue:='–÷‘õ';
           repair    :statue:='¤şõã—';
           lost      :statue:='¢øìêõ';
        end;

        ndefined.name:='';
        ndefined.number:='';
        ndefined.group:='';
        ndefined.description:='';
        ndefined.statue:=notdefined;

        end;
if mannumber<>totalbooks then totalbooks:=0;
end;


procedure adddata(defined:booktype);
begin
seek (reference,filesize(reference));
defined.recnumber:=strl(filepos(reference));
write (reference,defined);
end;

function getstring(x,y,xlength,ylength,fcolor,bcolor:integer;neop:boolean):string;
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
if neop then begin;desc:='';definedbook.description:='';s:='';goto endneop;end;
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
        {insert ok }   if s=#0+#16 then begin;c:=#13;end;
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
        write(' ùê‘');
        textcolor(11);
        write('®');
        textcolor (14);
        write(' ');

        if (mousetx>1) and (mousetx<33) and (mousety=20) then textbackground(4)
                                                                                 else textbackground(2);
        gotoxy(2,20);
        textcolor (14);
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
end;
procedure nobookmsg;
var c:char;
    ss:cursor;
    flag,mouseactive:boolean;

begin
textbackground(6);
textcolor(15);
for i:=1 to 10 do begin
gotoxy(2,i+8);
write('     ³          ³  ³    ³      ³                              ');
end;

name:=dtrims(definedo.name);
{desc:='';}
bgroup:=dtrims(definedo.group);
case definedo.statue of
           notdefined:statue:='     ';
           normal    :statue:=' ¤®‘Ÿ';
           lended    :statue:='–÷‘õ';
           repair    :statue:='¤şõã—';
           lost      :statue:='¢øìêõ';
     end;
bnumb:=dtrims(definedo.number);
flag:=true;
ss.setcursor($2000);
textbackground(1);
window(65,9,79,24);
clrscr;
window(1,1,80,25);
cadrt('',23,10,55,15,14,4,15,4,4,1);
textcolor(15);
textbackground(4);
center('!¢ª÷ ¢ş• ëøê –‘¬¡ªõ ‘“ ü“‘—î',11);
textbackground(3);
textcolor(15);
center (' –ªğ¥‘“ ',13);
textcolor(8);
textbackground(4);
write('Ü');
center(' ßßßßßßßß',14);
sound (1000);
delay (50);
sound (2000);
delay (50);
sound (3000);
delay (50);
nosound;
repeat
writetime;
if keypressed then c:=readkey;
textcolor(15);
mouseactive:=(mousety=13) and (mousetx>=36) and (mousetx<=44) and (leftbuttonpressed);
if (port[$60]<>28) {and (not mouseactive)} then begin
if (mousety=13) and (mousetx>=36) and (mousetx<=44) then textbackground(2) else textbackground(3);
if not flag then begin;center2 ('        ',13);flag:=true;end;

textcolor(15);
center (' –ªğ¥‘“ ',13);
textbackground(4);
textcolor(8);
write('Ü');
center(' ßßßßßßßß',14);
{flag:=true;}
end else begin
textbackground(4);
textcolor(15);
if flag then begin;center('        ',13);flag:=false;end;
textbackground(2);
textcolor(15);
center2 (' –ªğ¥‘“ ',13);
textbackground(4);
center('         ',14);

end;

if (mouseactive) then break;
until ((c=#27) or (c=#13)) and (port[$60]<>28) and (not leftbuttonpressed);
while keypressed do readkey;
ss.SetCursor(3470);
textbackground(6);
textcolor(15);
for i:=1 to 10 do begin
gotoxy(2,i+8);
write('     ³          ³  ³    ³      ³                              ');
end;

end;
procedure updatethisbook;
begin
{write ('*********',vall(thisbook.recnumber));
halt;}
{listord:=1;
startlistord:=0;}
seek (reference,vall(thisbook.recnumber));
gotoxy(1,1);
write (reference,thisbook);
readthisbook;
writeinfo(thisbook,listord);
end;
procedure deletemenu(thisbook:booktype);
var
newfile:file of booktype;
i:integer;
j,k,l:longint;
tempbook:booktype;
ss:cursor;
begin
if dtrims(thisbook.name)<>'' then begin
totalbooks:=totalbooks-1;
assign (newfile,'newbase.kdd');
rewrite (newfile);
textbackground(4);
gotoxy(23,20);
textcolor(0);
write('é£');
textcolor(6);
write('Ÿ');
i:=choose ('’‘—î é£ŸŠé¤¬÷',12,21,1);
           showmouse;
ss.SetCursor($2000);
if (i=1) then begin
textbackground(2);
textcolor(16);
gotoxy(34,8);
write (' ...¢ş÷î ¤“¬ ‘ê¯ó             ');
   seek(reference,0);
                  k:=filesize(reference);
                  while not eof(reference) do begin
                        read(reference,tempbook);
                  l:=filepos(reference);
                  tempbook.recnumber:=strl(filepos(newfile));
                  if l<5000 then begin
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
                        if l-1 <> vall(thisbook.recnumber) then write (newfile,tempbook);
                  end;
textbackground(2);
textcolor(16);
gotoxy(34,8);
write ('...‘û’‘—î ö¥¡õ üş‘›ù“‘› ñ‘Ÿ ¤¢');
gotoxy(1,1);
   delay(100);
   close(newfile);
   delay(100);
   close(reference);
   delay(100);
   erase(reference);
   delay(100);
   rename (newfile,'database.kdd');
   delay(100);
   assign (reference,'database.kdd');
   delay(100);
   reset(reference);
   delay(1000);
   end;
end;
end;
function notexist(defined:booktype):boolean;
var tempbook:booktype;
    k,j,l:longint;
    ss:cursor;
begin
ss.setcursor($2000);
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
if (defined.recnumber<>tempbook.recnumber)and(farsinum(dtrims(tempbook.number))=farsinum(dtrims(defined.number))) then begin
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
notexist:=false;
break;
end else notexist:=true;
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
end;
end.
{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }