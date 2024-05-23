{ In the name of the greatest lord in the world! }

{ Program of School, Shahrood university of technology, 1385/03 }

uses ncrt,graph,dos,mousedrv;
{use ncrt instead of CRT, then you wont see "DIVISION BY ZERO" Error.}
{ "NCRT" is gotten from http://tetta.5u.com }

{A student record has 7 fields}
type studentstype=record
firstname:string[20];
famname:string[20];
code:string[8];
class:char;
grade:byte;
mark:array[1..20] of real;
termmark:real;
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
      {number of students}{startorder of student list}{number of list entries}{if the list shows only search result}

var i:array[1..10] of integer;
    c:array[1..10] of char;
    s:array[1..10] of string;

student:studentstype;

schoolfile,tempfile,listfile:file of studentstype;
{The file "school.dbs" is assigned to SCHOOLFILE,                            }
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
read(listfile,student);
gotoxy (2,7+i[2]);
write (student.code);
gotoxy (11,7+i[2]);
write (student.firstname);
gotoxy (32,7+i[2]);
write (student.famname);
gotoxy (53,7+i[2]);
write (student.grade);
gotoxy (59,7+i[2]);
write (student.class);
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
write('º Welcome to School program V.1_85.3 ³ Borland Pascal Programming ³            º');
write('ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹');if not (searched) then
write('º                            All of Students                                   º');if searched then
write('º                            Search Results!                                   º');
write('ÇÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');if not searched then
write('ºCode    ³First name          ³Familly name        ³Grade³Class³ Total:        º');if searched then
write('ºCode    ³First name          ³Familly name        ³Grade³Class³ Tab=Show all  º');
write('ÇÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º        ³                    ³                    ³     ³     ³   Main Menu   º');
write('º        ³                    ³                    ³     ³     ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
write('º        ³                    ³                    ³     ³     ³ Add field     º');
write('º        ³                    ³                    ³     ³     ³ Delete field  º');
write('º        ³                    ³                    ³     ³     ³ Edit field    º');
write('º        ³                    ³                    ³     ³     ³ Marks         º');
write('º        ³                    ³                    ³     ³     ³ Search studentº');
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
textcolor(14);
textbackground(6);
gotoxy (65,6);
write (' Tab=Show all  ');
textbackground(1);
end else begin
gotoxy (30,4);
textcolor(11);
write ('All of Students');
textcolor(10);
gotoxy (65,6);
write (' Total:        ');
end;
writetime;
writedata;
end;
{========================================================}
procedure searchstd(showall:boolean); { Searchs the SCHOOLFILE according to  }
                                      { a user defined parameter and writes  }
var                                   { results in to the LISTFILE, then     }
isittrue:boolean;                     { calls WRITEDATA to show them in list }
alaki:boolean;
c:char;
search:studentstype;
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
writeln ('                       4.Class        ');
writeln ('                       5.Grade        ');
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
textcolor(15);write ('Student''s first name should contain: ');textcolor(10);readln(search.firstname);
end;
if i[1]=2 then begin
textcolor(15);write ('Student''s familly name should contain: ');textcolor(10);readln(search.famname);
end;
if i[1]=3 then begin
textcolor(15);write ('Student''s code should contain: ');textcolor(10);readln(search.code);
end;
if i[1]=4 then begin
repeat
textcolor(14);write ('Search which Class (A..Z)? ');
textcolor(10);search.class:=upcase(readkey);writeln (search.class);
if not((search.class>='A') and (search.class<='Z')) then
begin;textcolor (4);writeln ('Invalid Class pressed push only A to Z...');end;
until (search.class>='A') and (search.class<='Z');
end;
if i[1]=5 then begin
repeat                                                                                  {49..57}
textcolor(14);write ('Search which Grade (1..3)? ');
textcolor(10);search.grade:=ord(readkey)-48;writeln (search.grade);
if not((search.grade>=1) and (search.grade<=3)) then
begin;textcolor (4);writeln ('Invalid Grade pressed push only 1 to 3...');end;
until (search.grade>=1) and (search.grade<=3);
end;
end;
assign (schoolfile,'school.dbs');
assign (listfile,'list.dbs');
reset(schoolfile);
rewrite (listfile);
found:=0;
maxlist:=0;
while not eof(schoolfile) do begin
if i[1]<>0 then isittrue:=false else isittrue:=true;
read (schoolfile,student);
if (i[1]=1) and (pos(search.firstname,student.firstname)<>0) then isittrue:=true;
if (i[1]=2) and (pos(search.famname,student.famname)<>0) then isittrue:=true;
if (i[1]=3) and (pos(search.code,student.code)<>0) then isittrue:=true;
if (i[1]=4) and (search.class=student.class) then isittrue:=true;
if (i[1]=5) and (search.grade=student.grade) then isittrue:=true;
if isittrue then begin;found:=found+1;write (listfile,student);end;
end;
maxlist:=found;
if not showall then begin
textcolor(0);
writeln (found,' Entrie(s) found!,');
writeln ('Press a key to show results in the main list...');
readkey;
end;
close(schoolfile);
close(listfile);
window(1,1,80,25);
drawframes(1);
i[1]:=1;
end;
{========================================================}
procedure addfield;                   {Adds new datas to SCHOOLFILE}
var c:char;
    alaki1:string;
    alaki:integer;
    student1:studentstype;
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
for i[2]:=1 to 20 do student.mark[i[2]]:=0;
while ((c<>'n') and (c<>'N')) do begin
textcolor(14);write ('Enter Student''s first name  : ');textcolor(10);readln (student.firstname);
textcolor(14);write ('Enter Student''s familly name: ');textcolor(10);readln (student.famname);
repeat
repeated:=false;
textcolor(14);write ('Enter Student''s code        : ');textcolor(10);readln (student.code);
alaki1:=student.code;
val (student.code,code,alaki);
str(code,student.code);
if (alaki1<>student.code) then begin;textcolor(10);writeln('ÄÄÄÄÄ¯ Your invalid code changed to: ',student.code);end;
assign (schoolfile,'school.dbs');                           { ALT+175 = ¯}
reset(schoolfile);                                          { ALT+174 = ®}
while not eof(schoolfile) do begin                          { ALT+196 = Ä}
read(schoolfile,student1);
if student1.code=student.code then begin
textcolor(4);
writeln ('The code is Repeatitive! you must enter a new code!');readkey;
repeated:=true;
end;
end;
close(schoolfile);
until not repeated;
student.class:=#0;
student.grade:=0;
repeat
textcolor(14);write ('Press student''s Class (A..Z)? ');textcolor(10);student.class:=upcase(readkey);writeln (student.class);
if not((student.class>='A') and (student.class<='Z')) then
begin;textcolor (4);writeln ('Invalid Class pressed push only A to Z...');end;
until (student.class>='A') and (student.class<='Z');

repeat                                                                                  {49..57}
textcolor(14);write ('Press student''s Grade (1..3)? ');textcolor(10);student.grade:=ord(readkey)-48;writeln (student.grade);
if not((student.grade>=1) and (student.grade<=3)) then
begin;textcolor (4);writeln ('Invalid Grade pressed push only 1 to 3...');end;
until (student.grade>=1) and (student.grade<=3);

textcolor(14);write ('Do you want to Enter Student''s marks in lessons? (y=yes) ');textcolor(10);c:=readkey;writeln (c);

if ((c='y') or (c='Y')) then
for i[1]:=1 to 20 do begin
textcolor(15);write ('     Enter Student''s Lesson #',i[1]:2,' Mark: ');textcolor(11);readln (student.mark[i[1]]);
end;
assign (schoolfile,'school.dbs');
reset(schoolfile);
while not eof(schoolfile) do read(schoolfile,student1);
write (schoolfile,student);
total:=total+1;
textcolor(00);write ('Do you want to Enter another student''s data? (y/n) ');textcolor(10);c:=readkey;writeln (c);
end;
seek(schoolfile,0);
assign (listfile,'list.dbs');
rewrite (listfile);
liststart:=0;
maxlist:=0;
total:=0;
searched:=false;
while not (eof(schoolfile)) do begin
total:=total+1;
read (schoolfile,student);
write (listfile,student);
end;
maxlist:=total;
close(listfile);
close (schoolfile);
window (1,1,80,25);
drawframes(1);
end;
{========================================================}
procedure delfield;                  {Prompts a student code from user }
var c:char;                          { and removes it from SCHOOLFILE  }
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
assign (schoolfile,'school.dbs');
assign (tempfile,'temp.dbs');
reset(schoolfile);
rewrite(tempfile);
textcolor(14);
write ('Enter Data code to be deleted: ');textcolor(10);readln (code);
seek(schoolfile,0);
found:=false;
total:=0;
while not eof(schoolfile) do begin
read (schoolfile,student);
if (student.code<>code) then begin;total:=total+1;write (tempfile,student);end else found:=true;
end;
if not found then begin;textcolor(4);writeln ('Data not found!');end;
erase(schoolfile);
rename(tempfile,'school.dbs');
close(tempfile);
close(schoolfile);
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
procedure editfield;    { Gets student's code and changes it's parameters }
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
assign (schoolfile,'school.dbs');
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
reset(schoolfile);
while not eof(schoolfile) do begin
nowpos:=filepos(schoolfile);
read(schoolfile,student);
if (student.code=code) then begin;found:=true;seek(schoolfile,nowpos);break;end;
end;
if not found then begin;textcolor(4);writeln('Field not found, try another code!');end;
if found then begin
textcolor(14);write ('Enter Student''s first name (',student.firstname,'): ');textcolor(10);readln (student.firstname);
textcolor(14);write ('Enter Student''s familly name(',student.famname  ,'): ');textcolor(10);readln (student.famname);
textcolor(14);write ('Enter Student''s code (',student.code,')       : ');textcolor(10);readln (student.code);
repeat
textcolor(14);write ('Press student''s Class (A..Z)? (now: ',student.class,')');
textcolor(10);student.class:=upcase(readkey);writeln (student.class);
if not((student.class>='A') and (student.class<='Z')) then
begin;textcolor (4);writeln ('Invalid Class pressed push only A to Z...');end;
until (student.class>='A') and (student.class<='Z');

repeat                                                                                  {49..57}
textcolor(14);write ('Press student''s Grade (1..3)? (now: ',student.grade,')');
textcolor(10);student.grade:=ord(readkey)-48;writeln (student.grade);
if not((student.grade>=1) and (student.grade<=3)) then
begin;textcolor (4);writeln ('Invalid Grade pressed push only 1 to 3...');end;
until (student.grade>=1) and (student.grade<=3);

textcolor(14);write ('Do you want to Enter Student''s marks in lessons? (y=yes) ');textcolor(10);c:=readkey;writeln (c);

if ((c='y') or (c='Y')) then
for i[1]:=1 to 20 do begin
textcolor(15);write ('     Enter Student''s Lesson #',i[1]:2,' Mark (',student.mark[i[1]],'): ');
textcolor(11);readln (student.mark[i[1]]);
end;
write (schoolfile,student);
end;
textcolor(0);
write ('Edit another field? (y/n) ');
textcolor(10);c:=readkey;
writeln (c);
end;
close(schoolfile);
window(1,1,80,25);
drawframes(1);
searchstd(true);
end;
{========================================================}
procedure marks;    { Shows and edits marks of a student }
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
writeln('       ³ Select student code and then view or edit it''s marks:        ³       ');gotoxy(2,06);
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
assign (schoolfile,'school.dbs');
if (total=0) then begin
textcolor(4);writeln ('Sorry, The file is empty!, Press any key to exit...',#7);readkey;
window(1,1,80,25);
drawframes(1);
exit;
end;
found:=false;
while ((c<>'n')and (c<>'N')) do begin
textcolor(15);
write ('Enter Student code to view: ');textcolor(9);readln(code);
reset(schoolfile);
while not eof(schoolfile) do begin
nowpos:=filepos(schoolfile);
read(schoolfile,student);
if (student.code=code) then begin;found:=true;seek(schoolfile,nowpos);break;end;
end;
if not found then begin;textcolor(4);writeln('Student not found, try another code!');end;
if found then begin
textcolor(14);writeln ('Student''s name  : ',student.firstname,' ',student.famname);
textcolor(14);writeln ('Student''s code  : ',student.code     );
textcolor(14);writeln ('Student is in Class ',student.class,' and Grade ',student.grade);
textcolor(15);writeln ('Student''s marks in lessons:');
for i[1]:=1 to 20 do begin
textcolor(11);
write ('Lesson #',i[1]:2);
textcolor(10);
write (': ',student.mark[i[1]]:5:2,'   ');
if (i[1] mod 3)=0 then writeln;
end;
writeln;
textcolor(14);write ('Do you want to Edit Student''s marks in lessons? (y=yes) ');textcolor(10);c:=readkey;writeln (c);

if ((c='y') or (c='Y')) then
for i[1]:=1 to 20 do begin
textcolor(15);write ('     Enter Student''s Lesson #',i[1]:2,' Mark (',student.mark[i[1]]:2:2,'): ');
textcolor(11);readln (student.mark[i[1]]);
end;
write (schoolfile,student);
end;
textcolor(0);
write ('View another field? (y/n) ');
textcolor(10);c:=readkey;
writeln (c);writeln;
end;
close(schoolfile);
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
assign (schoolfile,'school.dbs');
{$I-}
reset(schoolfile);
{$I+}
if (ioresult<>0) then begin;rewrite (schoolfile);end;
seek (schoolfile,0);
while (not eof(schoolfile)) do begin
total:=total+1;
maxlist:=total;
read(schoolfile,student);
write (listfile,student);
textcolor(12+16);
gotoxy (73,6);
if not searched then write (total);
delay(5);
end;
close (schoolfile);
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
if i[1]=4 then marks;
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
write(' Marks         ');
if i[1]=5 then begin;textcolor(14);textbackground(4);end else begin;textcolor(10);textbackground(1);end;
gotoxy (65,14);
write(' Search student');
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