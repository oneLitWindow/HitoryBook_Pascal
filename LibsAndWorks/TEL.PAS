{use ncrt instead of CRT, then you wont see "DIVISION BY ZERO" Error.}
{ "NCRT" is gotten from http://tetta.5u.com }
uses ncrt,graph,dos,mousedrv;

type contactstype=record
firstname:string[20];
famname:string[20];
code:string[8];
mobile:longint;
home :longint;
end;
{ Defining a constant in this way,
  provides the ability to change them in the program

  *** CONST name:TYPE=VALUE;

  --- const shahrood:integer=20;
      begin
      shahrood:=10;
      end.

  }
const total:integer=0;     liststart:integer=0;        maxlist:integer=0;      searched:boolean=false;
      {number of contacts}{startorder of contact list}{number of list entries}{if the list shows only search result}

var i:array[1..10] of integer;
    c:array[1..10] of char;
    s:array[1..10] of string;

contact:contactstype;

telfile,tempfile,listfile:file of contactstype;
{The file "tel.dbs" is assigned to telFILE,                            }
{         "temp.dbs"   to TEMPFILE,                                          }
{         "list.dbs"   to LISTFILE, but it can be                            }
{any name you want such as "shahrood.ut" or "golabi.txt" or "pascal.dat"     }
{each file name has two sections, 1st is MainName and 2nd is the Extension,  }
{Main name can be at last 8 characters and extension at last 3 characters.   }
{but in visual programming, it is allowed to use more than 8 characters for  }
{main name. such as: it is good.now.txt , (but it's only in windows!)        }
{                    |_____________|                                         }
{                       Main name                                            }

{========================================================}
procedure writedata; {writes data from LISTFILE to the list}
begin
textbackground(1);

textcolor(15);
for i[2]:=1 to 16 do begin
gotoxy (2,7+i[2]);
write('        ³                    ³                    ³     ³     ');
end;          {ALT+179 = ³}
assign (listfile,'list.dbs');
if total=0 then rewrite (listfile);
{$I-}
reset(listfile);
if ioresult<>0 then exit;
{$I+}
if liststart<0 then liststart:=0;
seek(listfile,liststart);


textcolor(9);
for i[2]:=1 to 16 do begin
if (eof(listfile)) then break;
read(listfile,contact);
gotoxy (2,7+i[2]);
write (contact.code);
gotoxy (11,7+i[2]);
write (contact.firstname);
gotoxy (32,7+i[2]);
write (contact.famname);
gotoxy (53,7+i[2]);
write (contact.home );
gotoxy (59,7+i[2]);
write (contact.mobile);
end;
close(listfile);
end;
{========================================================}
procedure writetime; {Writes the time at the top of the screen, right side}
var y,m,d,dow:word;
begin
textcolor(11);
gotoxy (68,2);
write ('Time: ');
textcolor(14);
gettime (y,m,d,dow);
if y<10 then write ('0');
write (y,':');
if m<10 then write ('0');
write(m);
end;
{========================================================}
procedure drawframes(num:integer); {Draws border of screen}
begin
textcolor (15);
textbackground(1);
gotoxy(1,1);
{to draw a border, you can press and hold ALT key in your keyboard, then
 press a number; for example ALT+200 is 'È' character.
also: ALT+ 201 = É
           186 = º
           200 = È
           187 = »
           188 = ¼
           205 = Í
           185 = ¹
           202 = Ê
           203 = Ë
           204 = Ì
           206 = Î
           218 = Ú
           179 = ³
           192 = À
           196 = Ä
           191 = ¿
           197 = Å
           217 = Ù
           195 = Ã
           180 = ´
           182 = ¶
           199 = Ç
           207 = Ï
           209 = Ñ  }
write('ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍ»');
write('º Welcome to tel program V.1         ³ Borland Pascal Programming ³            º');
write('ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹');if not (searched) then
write('º                            All of contacts                                   º');if searched then
write('º                            Search Results!                                   º');
write('ÇÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');if not searched then
write('ºCode    ³First name          ³Familly name        ³home ³mobil³ Total:        º');if searched then
write('ºCode    ³First name          ³Familly name        ³home ³mobil³ Tab=Show all  º');
write('ÇÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º        ³                    ³                    ³     ³     ³   Main Menu   º');
write('º        ³                    ³                    ³     ³     ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º        ³                    ³                    ³     ³     ³ Add field     º');
write('º        ³                    ³                    ³     ³     ³ Delete field  º');
write('º        ³                    ³                    ³     ³     ³ Edit field    º');
write('º        ³                    ³                    ³     ³     ³ Details       º');
write('º        ³                    ³                    ³     ³     ³ Search contactº');
write('º        ³                    ³                    ³     ³     ³ Exit          º');
write('º        ³                    ³                    ³     ³     ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º        ³                    ³                    ³     ³     ³ PGUp/Down     º');
write('º        ³                    ³                    ³     ³     ³     move list º');
write('º        ³                    ³                    ³     ³     ³ Enter         º');
write('º        ³                    ³                    ³     ³     ³    Choice cmd º');
write('º        ³                    ³                    ³     ³     ³ ESC           º');
write('º        ³                    ³                    ³     ³     ³          Exit º');
write('º        ³                    ³                    ³     ³     ³               º');
write('ÈÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÏÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
if searched then begin
gotoxy (30,4);
textcolor(10+16);
write ('Search Results!');
textcolor(14+16);
textbackground(6);
gotoxy (65,6);
write (' Tab=Show all  ');
textbackground(1);
end else begin
gotoxy (30,4);
textcolor(11);
write ('All of contacts');
textcolor(10);
gotoxy (65,6);
write (' Total:        ');
end;
writetime;
writedata;
end;
{========================================================}
procedure searchstd(showall:boolean); { Searchs the telFILE according to  }
                                      { a user defined parameter and writes  }
var                                   { results in to the LISTFILE, then     }
isittrue:boolean;                     { calls WRITEDATA to show them in list }
alaki:boolean;
c:char;
search:contactstype;
found:integer;
begin
alaki:=searched;
liststart:=0;
searched:=not showall;
if (total=0)and(showall) then begin;drawframes(1);exit;end;
if not showall then begin
textbackground(2);
textcolor(15);
{....}                                                                                    gotoxy (2,06);
writeln('                                                                              ');gotoxy (2,07);
writeln('       ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿       ');gotoxy (2,08);
writeln('       ³ Please make a search step by step...                         ³       ');gotoxy (2,09);
writeln('       ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´       ');gotoxy (2,10);
writeln('       ³                                                              ³       ');gotoxy (2,11);
writeln('       ³                                                              ³       ');gotoxy (2,12);
writeln('       ³                                                              ³       ');gotoxy (2,13);
writeln('       ³                                                              ³       ');gotoxy (2,14);
writeln('       ³                                                              ³       ');gotoxy (2,15);
writeln('       ³                                                              ³       ');gotoxy (2,16);
writeln('       ³                                                              ³       ');gotoxy (2,17);
writeln('       ³                                                              ³       ');gotoxy (2,18);
writeln('       ³                                                              ³       ');gotoxy (2,19);
writeln('       ³                                                              ³       ');gotoxy (2,20);
writeln('       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ       ');gotoxy (2,21);
writeln('                                                                              ');
window (10,10,71,19);
textbackground(3);
clrscr;
end;
if (total=0)and(not showall) then begin
textcolor(4);writeln ('Sorry, The file is empty!, Press any key to exit...',#7);readkey;
window(1,1,80,25);      {writing #7 (7th ascii character) causes a beep! <--/}
drawframes(1);
exit;
end;
i[1]:=0;
if (not showall) then begin
textcolor(15);
writeln ('Search according to... 1.Name         ');
writeln ('                       2.Familly name ');
writeln ('                       3.Code         ');
writeln ('                       4.mobile        ');
writeln ('                       5.home         ');
c:=#0;
textcolor(11);
write ('Wich one do you need? (1..5)(ESC=exit)  ');
repeat
write (#8,' ',#8);
c:=readkey;textcolor(10);if (c<>#13)then write (c);
until (((ord(c)-48)>=1) and ((ord(c)-48)<=5) or (c=#27));
writeln;
if (c=#27) then begin
searched:=alaki;
window(1,1,80,25);
drawframes(1);
exit;
end;
i[1]:=ord(c)-48;
if i[1]=1 then begin
textcolor(15);write ('contact''s first name should contain: ');textcolor(10);readln(search.firstname);
end;
if i[1]=2 then begin
textcolor(15);write ('contact''s familly name should contain: ');textcolor(10);readln(search.famname);
end;
if i[1]=3 then begin
textcolor(15);write ('contact''s code should contain: ');textcolor(10);readln(search.code);
end;
if i[1]=4 then begin
textcolor(14);write ('Search which mobile? ');
textcolor(10);readln(search.mobile);
end;
if i[1]=5 then begin
textcolor(14);write ('Search which home? ');
textcolor(10);readln(search.home);
end;
end;
assign (telfile,'tel.dbs');
assign (listfile,'list.dbs');
reset(telfile);
rewrite (listfile);
found:=0;
maxlist:=0;
while not eof(telfile) do begin
if i[1]<>0 then isittrue:=false else isittrue:=true;
read (telfile,contact);
if (i[1]=1) and (pos(search.firstname,contact.firstname)<>0) then isittrue:=true;
if (i[1]=2) and (pos(search.famname,contact.famname)<>0) then isittrue:=true;
if (i[1]=3) and (pos(search.code,contact.code)<>0) then isittrue:=true;
if (i[1]=4) and (search.mobile=contact.mobile) then isittrue:=true;
if (i[1]=5) and (search.home =contact.home ) then isittrue:=true;
if isittrue then begin;found:=found+1;write (listfile,contact);end;
end;
maxlist:=found;
if not showall then begin
textcolor(0);
writeln (found,' Entrie(s) found!,');
writeln ('Press a key to show results in the main list...');
readkey;
end;
close(telfile);
close(listfile);
window(1,1,80,25);
drawframes(1);
i[1]:=1;
end;
{========================================================}
procedure addfield;                   {Adds new datas to telFILE}
var c:char;
    alaki1:string;
    alaki:integer;
    contact1:contactstype;
    repeated:boolean;
code:longint;
begin
textbackground(2);
textcolor(15);
{....}                                                                                    gotoxy (2,06);
writeln('                                                                              ');gotoxy (2,07);
writeln('       ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿       ');gotoxy (2,08);
writeln('       ³ Please Enter new datas here:                                 ³       ');gotoxy (2,09);
writeln('       ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´       ');gotoxy (2,10);
writeln('       ³                                                              ³       ');gotoxy (2,11);
writeln('       ³                                                              ³       ');gotoxy (2,12);
writeln('       ³                                                              ³       ');gotoxy (2,13);
writeln('       ³                                                              ³       ');gotoxy (2,14);
writeln('       ³                                                              ³       ');gotoxy (2,15);
writeln('       ³                                                              ³       ');gotoxy (2,16);
writeln('       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ       ');gotoxy (2,17);
writeln('                                                                              ');
window (10,10,71,15);
textbackground(3);
clrscr;
c:=#0;
while ((c<>'n') and (c<>'N')) do begin
textcolor(14);write ('Enter contact''s first name  : ');textcolor(10);readln (contact.firstname);
textcolor(14);write ('Enter contact''s familly name: ');textcolor(10);readln (contact.famname);
repeat
repeated:=false;
textcolor(14);write ('Enter contact''s code        : ');textcolor(10);readln (contact.code);
alaki1:=contact.code;
val (contact.code,code,alaki);
str(code,contact.code);
if (alaki1<>contact.code) then begin;textcolor(10);writeln('ÄÄÄÄÄ¯ Your invalid code changed to: ',contact.code);end;
assign (telfile,'tel.dbs');                           { ALT+175 = ¯}
reset(telfile);                                          { ALT+174 = ®}
while not eof(telfile) do begin                          { ALT+196 = Ä}
read(telfile,contact1);
if contact1.code=contact.code then begin
textcolor(4);
writeln ('The code is Repeatitive! you must enter a new code!');readkey;
repeated:=true;
end;
end;
close(telfile);
until not repeated;
contact.mobile:=0;
contact.home :=0;
textcolor(14);write ('Enter contact''s mobile? ');
textcolor(10);readln(contact.mobile);

textcolor(14);write ('Enter contact''s home? ');textcolor(10);readln(contact.home);
assign (telfile,'tel.dbs');
reset(telfile);
while not eof(telfile) do read(telfile,contact1);
write (telfile,contact);
total:=total+1;
textcolor(00);write ('Do you want to Enter another contact''s data? (y/n) ');textcolor(10);c:=readkey;writeln (c);
end;
seek(telfile,0);
assign (listfile,'list.dbs');
rewrite (listfile);
liststart:=0;
maxlist:=0;
total:=0;
searched:=false;
while not (eof(telfile)) do begin
total:=total+1;
read (telfile,contact);
write (listfile,contact);
end;
maxlist:=total;
close(listfile);
close (telfile);
window (1,1,80,25);
drawframes(1);
end;
{========================================================}
procedure delfield;                  {Prompts a contact code from user }
var c:char;                          { and removes it from telFILE  }
code:string[8];
found:boolean;
begin
textbackground(2);
textcolor(15);
{....}                                                                                    gotoxy (2,06);
writeln('                                                                              ');gotoxy (2,07);
writeln('       ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿       ');gotoxy (2,08);
writeln('       ³ Choose the field which should be deleted:                    ³       ');gotoxy (2,09);
writeln('       ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´       ');gotoxy (2,10);
writeln('       ³                                                              ³       ');gotoxy (2,11);
writeln('       ³                                                              ³       ');gotoxy (2,12);
writeln('       ³                                                              ³       ');gotoxy (2,13);
writeln('       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ       ');gotoxy (2,14);
writeln('                                                                              ');
window (10,10,71,12);
textbackground(3);
clrscr;
c:=#0;
while ((c<>'n') and (c<>'N')) do begin
if (total=0) then begin
textcolor(4);writeln ('Sorry, The file is empty!, Press any key to exit...',#7);readkey;
window(1,1,80,25);
drawframes(1);
exit;
end;
assign (telfile,'tel.dbs');
assign (tempfile,'temp.dbs');
reset(telfile);
rewrite(tempfile);
textcolor(14);
write ('Enter Data code to be deleted: ');textcolor(10);readln (code);
seek(telfile,0);
found:=false;
total:=0;
while not eof(telfile) do begin
read (telfile,contact);
if (contact.code<>code) then begin;total:=total+1;write (tempfile,contact);end else found:=true;
end;
if not found then begin;textcolor(4);writeln ('Data not found!');end;
erase(telfile);
rename(tempfile,'tel.dbs');
close(tempfile);
close(telfile);
textcolor(0);
write ('Delete another field? (y/n) ');
c:=readkey;textcolor(10);
writeln (c);
end;
window(1,1,80,25);
drawframes(1);
searchstd(true);
end;
{========================================================}
procedure editfield;    { Gets contact's code and changes it's parameters }
var c:char;             { with new datas.                                 }
code:string[8];
found:boolean;
nowpos:longint;
begin
textbackground(2);
textcolor(15);
{....}                                                                                    gotoxy (2,06);
writeln('                                                                              ');gotoxy (2,07);
writeln('       ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿       ');gotoxy (2,08);
writeln('       ³ Choose the field, and change it''s data:                      ³       ');gotoxy (2,09);
writeln('       ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´       ');gotoxy (2,10);
writeln('       ³                                                              ³       ');gotoxy (2,11);
writeln('       ³                                                              ³       ');gotoxy (2,12);
writeln('       ³                                                              ³       ');gotoxy (2,13);
writeln('       ³                                                              ³       ');gotoxy (2,14);
writeln('       ³                                                              ³       ');gotoxy (2,15);
writeln('       ³                                                              ³       ');gotoxy (2,16);
writeln('       ³                                                              ³       ');gotoxy (2,17);
writeln('       ³                                                              ³       ');gotoxy (2,18);
writeln('       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ       ');gotoxy (2,19);
writeln('                                                                              ');
window (10,10,71,17);
textbackground(3);
clrscr;
c:=#0;
assign (telfile,'tel.dbs');
if (total=0) then begin
textcolor(4);writeln ('Sorry, The file is empty!, Press any key to exit...',#7);readkey;
window(1,1,80,25);
drawframes(1);
exit;
end;
found:=false;
while ((c<>'n')and (c<>'N')) do begin
textcolor(15);
write ('Enter Field code to be Edited: ');textcolor(9);readln(code);
reset(telfile);
while not eof(telfile) do begin
nowpos:=filepos(telfile);
read(telfile,contact);
if (contact.code=code) then begin;found:=true;seek(telfile,nowpos);break;end;
end;
if not found then begin;textcolor(4);writeln('Field not found, try another code!');end;
if found then begin
textcolor(14);write ('Enter contact''s first name (',contact.firstname,'): ');textcolor(10);readln (contact.firstname);
textcolor(14);write ('Enter contact''s familly name(',contact.famname  ,'): ');textcolor(10);readln (contact.famname);
textcolor(14);write ('Enter contact''s code (',contact.code,')       : ');textcolor(10);readln (contact.code);
textcolor(14);write ('Enter contact''s mobile? (now: ',contact.mobile,')');
textcolor(10);readln(contact.mobile);

textcolor(14);write ('Enter contact''s home ? (now: ',contact.home ,')');
textcolor(10);readln(contact.home);write (telfile,contact);
end;
textcolor(0);
write ('Edit another field? (y/n) ');
textcolor(10);c:=readkey;
writeln (c);
end;
close(telfile);
window(1,1,80,25);
drawframes(1);
searchstd(true);
end;
{========================================================}
procedure details;    { Shows the details of a contact}
var c:char;
code:string[8];
found:boolean;
nowpos:longint;
begin
textbackground(2);
textcolor(15);
{....}                                                                                    gotoxy (2,03);
writeln('                                                                              ');gotoxy (2,04);
writeln('       ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿       ');gotoxy (2,05);
writeln('       ³ Select contact code and then view it''s details:              ³       ');gotoxy(2,06);
writeln('       ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´       ');gotoxy (2,07);
writeln('       ³                                                              ³       ');gotoxy (2,08);
writeln('       ³                                                              ³       ');gotoxy (2,09);
writeln('       ³                                                              ³       ');gotoxy (2,10);
writeln('       ³                                                              ³       ');gotoxy (2,11);
writeln('       ³                                                              ³       ');gotoxy (2,12);
writeln('       ³                                                              ³       ');gotoxy (2,13);
writeln('       ³                                                              ³       ');gotoxy (2,14);
writeln('       ³                                                              ³       ');gotoxy (2,15);
writeln('       ³                                                              ³       ');gotoxy (2,16);
writeln('       ³                                                              ³       ');gotoxy (2,17);
writeln('       ³                                                              ³       ');gotoxy (2,18);
writeln('       ³                                                              ³       ');gotoxy (2,19);
writeln('       ³                                                              ³       ');gotoxy (2,20);
writeln('       ³                                                              ³       ');gotoxy (2,21);
writeln('       ³                                                              ³       ');gotoxy (2,22);
writeln('       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ       ');gotoxy (2,23);
writeln('                                                                              ');
window (10,7,71,21);
textbackground(3);
clrscr;
c:=#0;
assign (telfile,'tel.dbs');
if (total=0) then begin
textcolor(4);writeln ('Sorry, The file is empty!, Press any key to exit...',#7);readkey;
window(1,1,80,25);
drawframes(1);
exit;
end;
found:=false;
while ((c<>'n')and (c<>'N')) do begin
textcolor(15);
write ('Enter contact code to view: ');textcolor(9);readln(code);
reset(telfile);
while not eof(telfile) do begin
nowpos:=filepos(telfile);
read(telfile,contact);
if (contact.code=code) then begin;found:=true;seek(telfile,nowpos);break;end;
end;
if not found then begin;textcolor(4);writeln('contact not found, try another code!');end;
if found then begin
textcolor(14);writeln ('contact''s name  : ',contact.firstname,' ',contact.famname);
textcolor(14);writeln ('contact''s code  : ',contact.code     );
textcolor(14);writeln ('contact''s mobile ',contact.mobile,' and home  ',contact.home );
write (telfile,contact);
end;
textcolor(0);
write ('View another field? (y/n) ');
textcolor(10);c:=readkey;
writeln (c);writeln;
end;
close(telfile);
window(1,1,80,25);
drawframes(1);
end;
{#########################################################}
begin{ Here the main Section of the program, Starts here! }
textmode(3);
textbackground(1);
clrscr;
textcolor(14);
drawframes(1);
assign (listfile,'list.dbs');
rewrite (listfile);
assign (telfile,'tel.dbs');
{$I-}
reset(telfile);
{$I+}
if (ioresult<>0) then begin;rewrite (telfile);end;
seek (telfile,0);
while (not eof(telfile)) do begin
total:=total+1;
maxlist:=total;
read(telfile,contact);
write (listfile,contact);
textcolor(12+16);
gotoxy (73,6);
if not searched then write (total);
delay(5);
end;
close (telfile);
i[1]:=1;
maxlist:=total;
searchstd(true);
repeat
if keypressed then begin
c[1]:=readkey;
if c[1]=#72 then i[1]:=i[1]-1;
if c[1]=#80 then i[1]:=i[1]+1;
if i[1]<1 then i[1]:=6;
if i[1]>6 then i[1]:=1;
if c[1]=#9 then searchstd(true);
if c[1]=#73 then liststart:=liststart-1;
if c[1]=#81 then liststart:=liststart+1;
if liststart+16>maxlist then liststart:=maxlist-16;
if liststart<0 then liststart:=0;
if (c[1]=#73) or (c[1]=#81) then writedata;
if c[1]=#13 then begin
if i[1]=1 then addfield;
if i[1]=2 then delfield;
if i[1]=3 then editfield;
if i[1]=4 then details;
if i[1]=5 then searchstd(false);
if i[1]=6 then break;
i[1]:=1;
end;
end;
textbackground(1);
textcolor(11);
gotoxy (73,6);
if not searched then write (total);
if i[1]=1 then begin;textcolor(14);textbackground(4);end else begin;textcolor(10);textbackground(1);end;
gotoxy (65,10);
write(' Add field     ');
if i[1]=2 then begin;textcolor(14);textbackground(4);end else begin;textcolor(10);textbackground(1);end;
gotoxy (65,11);
write(' Delete field  ');
if i[1]=3 then begin;textcolor(14);textbackground(4);end else begin;textcolor(10);textbackground(1);end;
gotoxy (65,12);
write(' Edit field    ');
if i[1]=4 then begin;textcolor(14);textbackground(4);end else begin;textcolor(10);textbackground(1);end;
gotoxy (65,13);
write(' Details       ');
if i[1]=5 then begin;textcolor(14);textbackground(4);end else begin;textcolor(10);textbackground(1);end;
gotoxy (65,14);
write(' Search contact');
if i[1]=6 then begin;textcolor(14);textbackground(4);end else begin;textcolor(10);textbackground(1);end;
gotoxy (65,15);
write(' Exit          ');
textbackground(1);
writetime;
delay(5);
until c[1]=#27;
window (1,1,80,25);
textbackground(0);
clrscr;
end.{The END!}