Uses MouseDRV,NCrt,Graph,DOS;
Const Total    :integer=0;
      ListStart:integer=0;
      listend  :integer=0;
      Searched :boolean=False;

Type SchoolStudents=Record
smallname:String[20];
FamillyName:String[20];
Number:String[8];
Class:Char;
maghta:Byte;
Mark:Array[1..20] of Real;
End;

Var i1,i2,bglst:Integer;
    c1,c2:Char;
    s1,s2:String;
    Student:SchoolStudents;
    school1:File of SchoolStudents;
    chert  :File of SchoolStudents;
    list1  :File of SchoolStudents;
Procedure farid001;
Begin
TextColor(15);TextBackground(2);
For i2:=1 to 16 Do Begin
GotoXY (2,7+i2);
Write('        �');
write('                    �');
write('                    �');
write('     �     ');
End;
Assign (list1,'Farid.Lst');
If Total=0 Then ReWrite (list1);{$I-}
Reset(list1);If IOResult<>0 Then Exit;{$I+}
If bglst<0 Then bglst:=0;
Seek(list1,bglst);
TextColor(14);
For i2:=1 to 16 Do Begin
If (Eof(list1)) Then Break;
Read(list1,Student);
GotoXY (2,7+i2);
Write (Student.Number);
GotoXY (11,7+i2);
Write (Student.smallname);
Gotoxy (32,7+i2);
Write (Student.Famillyname);
GotoXY (53,7+i2);
Write (Student.Class);
GotoXY (59,7+i2);
Write (Student.maghta);
End;
Close(list1);
End;
Procedure Cadrs(num:Integer);
Begin
TextColor (15);
TextBackground(2);
clrscr;
Gotoxy(1,1);
Writeln('���� ��� ����� ������ ��� ������ ���� ���� ���� ����� ������');
Writeln;
Writeln('�������ꗨ� ��� ���� ��� ���� ������ �������� ����');
If Not (Searched) Then Writeln('������ ���� ���� �����');If (Searched) Then Writeln('����� ����� �����');
Writeln('��������������������������������������������������������������ͻ');
Writeln('�   ������                 ����        ������ ����  ��� ����');
Writeln('��������������������������������������������������������������͹');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('�        �                    �                    �     �     �');
Writeln('��������������������������������������������������������������ͼ');
If Searched Then Begin
GotoXY (1,4);
TextColor(10+16);
Write ('����� ����� �����');
TextBackground(2);
End Else Begin
GotoXY (1,4);
TextColor(15);
Write ('������ ���� ���� �����');
End;
farid001;
End;
Procedure jostejoo(ViewAll:Boolean);
Var  IsItTrue:Boolean;
     Alaki:Boolean;
     C:Char;
     Search:SchoolStudents;
     Peyda:Integer;
Begin
Alaki:=Searched;
bglst:=0;
Searched:=Not ViewAll;
If (Total=0)And(ViewAll) Then Begin;Cadrs(1);Exit;End;
If Not ViewAll Then Begin
GotoXY(1,1);
TextBackground(7);
TextColor(15);
Write('������������������������������������������������������������������������������Ŀ');
Write('�                     ******* ���������� ������ *******                        �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('��������������������������������������������������������������������������������');Window (2,3,79,23);
TextBackground(7);ClrScr;c:=#0;
End;
If (Total=0)And(Not ViewAll) Then Begin
Searched:=Alaki;
TextColor(4);Writeln ('!��� �� ����');ReadKey;
Window(1,1,80,25);
Cadrs(1);
Exit;
End;
i1:=0;
If (Not ViewAll) Then Begin
TextColor(15);
Writeln ('          ��� �����.�');
Writeln ('        ��� ���� ��.�');
Writeln ('��������� ���� ��.�');
Writeln ('      ����� ���� ��.�');
Writeln ('������ ��� ���� ��.�');
Writeln ('        ��� ���� ��.�');
Writeln ('�� ���� �� ��𥑓.�');
c:=#0;
Repeat
TextColor(03);
Write ('���� ������: ');
readln(c)
Until ((c>='0') And (c<='6'));
Writeln;
if (c='0') then begin
searched:=false;
end;
If (c='6') Then Begin
Searched:=Alaki;
Window(1,1,80,25);
Cadrs(1);
Exit;
End;
i1:=Ord(c)-48;
If i1=1 Then Begin
TextColor(15);Write ('���� ���� �� ��� �� ����: ');TextColor(02);Readln(Search.smallname);
End;
If i1=2 Then Begin
TextColor(15);Write ('���� ���� �� ������ ��� �� ����: ');TextColor(02);Readln(Search.Famillyname);
End;
If i1=3 Then Begin
TextColor(15);Write ('���� ���� �� ����� �� ����: ');TextColor(02);Readln(Search.Number);
End;
If i1=4 Then Begin
Repeat                                                                                  {49..57}
TextColor(06);Write ('(� �� � ��) ���� ���� �� ���: ');
TextColor(02);readln(Search.maghta);
Until (Search.maghta>=1) And (Search.maghta<=3);
End;
If i1=5 Then Begin
Repeat
TextColor(14);Write ('(D �� A ��) ���� ���� �� ���');
TextColor(02);readln(Search.Class);Search.Class:=upcase(Search.Class);
Until (Search.Class>='A') And (Search.Class<='D');
End;
End;
Assign (school1,'Farid.Sch');
Assign (list1,'Farid.Lst');
Reset(school1);
ReWrite (list1);
Peyda:=0;
listend:=0;
While Not Eof(school1) Do Begin
If i1<>0 Then IsItTrue:=False Else IsItTrue:=True;
Read (school1,Student);
If (i1=1) And (POS(Search.smallname,Student.smallname)<>0) Then IsItTrue:=True;
If (i1=2) And (POS(Search.Famillyname,Student.FamillyName)<>0) Then IsItTrue:=True;
If (i1=3) And (POS(Search.Number,Student.Number)<>0) Then IsItTrue:=True;
If (i1=4) And (Search.maghta=Student.maghta) Then IsItTrue:=True;
If (i1=5) And (Search.Class=Student.Class) Then IsItTrue:=True;
If IsItTrue Then Begin;Peyda:=Peyda+1;Write (list1,Student);End;
End;
listend:=Peyda;
Close(school1);
Close(list1);
Window(1,1,80,25);
Cadrs(1);
i1:=1;
End;
procedure ezafe;
var c:char;
    alaki1:string;
    alaki:integer;
    Student1:SchoolStudents;
    Repeated:boolean;
code:longint;
Begin
GotoXY(1,1);
TextBackground(7);
TextColor(15);
Write('������������������������������������������������������������������������������Ŀ');
Write('�                         ******* ����� �ꑮ� *******                          �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('��������������������������������������������������������������������������������');Window (2,3,79,23);
TextBackground(7);ClrScr;c:=#0;
While ((c<>'n') And (c<>'N')) Do Begin
TextColor(06);
Write ('���� ���� �� ���: ');
TextColor(02);
Readln (Student.smallname);
TextColor(06);
Write ('���� ���� �� ������ ���: ');
TextColor(02);
Readln (Student.FamillyName);
TextColor(06);
Write ('���� ���� �� ���� ���� �����: ');
TextColor(02);
Readln (Student.Number);
Student.Class:=#0;
Student.maghta:=0;
Repeat                                                                                  {49..57}
TextColor(06);Write ('(� �� � ��) ���� ���� �� ���� ���� ������ ���: ');TextColor(02);readln(Student.maghta);
Until (Student.maghta>0) And (Student.maghta<4);
Repeat
TextColor(06);Write ('(D �� A ��) ���� ���� �� ���� ���� ���: ');TextColor(02);readln(Student.Class);
Student.Class:=upcase(Student.Class);
Until (ord(Student.Class)>64) And (ord(Student.Class)<69);
Assign (school1,'Farid.Sch');
Reset(school1);
While Not Eof(school1) do Read(school1,Student1);
for i2:=1 to 20 do Student.Mark[i2]:=0;
Write (school1,Student);
Total:=Total+1;
WriteLN;
Write ('(Y/N) ������ ���� ���� �ꑮ� �� ���� ���');TextColor(02);c:=ReadKey;Writeln (c);
End;
Seek(school1,0);
Assign (list1,'Farid.Lst');
ReWrite (list1);
bglst:=0;
listend:=0;
Total:=0;
Searched:=False;
While Not (Eof(school1)) Do Begin
Total:=Total+1;
Read (school1,Student);
Write (list1,Student);
End;
listend:=Total;
Close(list1);
Close (school1);
Window (1,1,80,25);
Cadrs(1);
End;
procedure pakk;
var c:char;
code:string[8];
Peyda:boolean;
Begin
GotoXY(1,1);
TextBackground(7);
TextColor(15);
Write('������������������������������������������������������������������������������Ŀ');
Write('�                         ******* �������� 食 *******                         �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('��������������������������������������������������������������������������������');Window (2,3,79,23);
TextBackground(7);ClrScr;c:=#0;
While ((c<>'n') And (c<>'N')) Do Begin
If (Total=0) Then Begin
TextColor(4);Writeln ('!��� �� ����');ReadKey;
Window(1,1,80,25);
Cadrs(1);
Exit;
End;
Assign (school1,'Farid.Sch');
Assign (chert,'temp.dbs');
Reset(school1);
ReWrite(chert);
TextColor(06);
Write ('���� ���� �� ���� ���� �����: ');TextColor(02);Readln (code);
Seek(school1,0);
Peyda:=False;
Total:=0;
While Not Eof(school1) Do Begin
Read (school1,Student);
If (Student.Number<>code) Then Begin;Total:=Total+1;Write (chert,Student);End Else Peyda:=True;
End;
If Not Peyda Then Begin;TextColor(4);Writeln ('!��� ����');End;
erase(school1);
rename(chert,'Farid.Sch');
Close(chert);
Close(school1);
Write ('(Y/N) ����� ����� ���� ���� 食 �� ���� ���: ');
c:=ReadKey;TextColor(02);
Writeln (c);
End;
Window(1,1,80,25);
Cadrs(1);
jostejoo(True);
End;
procedure taghir;
var c:char;
code:string[8];
Peyda:boolean;
nowpos:longint;
Begin
GotoXY(1,1);
TextBackground(7);
TextColor(15);
Write('������������������������������������������������������������������������������Ŀ');
Write('�                         ******* ������ ���� *******                         �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('��������������������������������������������������������������������������������');Window (2,3,79,23);
TextBackground(7);ClrScr;c:=#0;
Assign (school1,'Farid.Sch');
If (Total=0) Then Begin
TextColor(4);Writeln ('!��� �� ����');ReadKey;
Window(1,1,80,25);
Cadrs(1);
Exit;
End;
Peyda:=False;
While ((c<>'n')And (c<>'N')) Do Begin
TextColor(15);
Write ('���� ���� �� ���� ���� �����: ');TextColor(9);Readln(code);
Reset(school1);
While Not Eof(school1) Do Begin
nowpos:=FilePos(school1);
Read(school1,Student);
If (Student.Number=code) Then Begin;Peyda:=True;Seek(school1,nowpos);Break;End;
End;
If Not Peyda Then Begin;TextColor(4);Writeln('!��� ����');End;
If Peyda Then Begin
TextColor(06);Write ('��',Student.smallname,'�� ���� ���� ��� ���� : ');TextColor(02);Readln (Student.smallname);
TextColor(06);Write ('��',Student.famillyname,'�� ���� ���� ������ ��� ���� : ');TextColor(02);Readln (Student.FamillyName);
TextColor(06);Write ('��',Student.number,'�� ���� ���� ����� ���� : ');TextColor(02);Readln (Student.Number);
Repeat                                                                                  {49..57}
TextColor(06);Write ('(��� �)...��',Student.maghta,'�� ���� ���� ��� ���� : ');
TextColor(02);readln(Student.maghta);
Until (Student.maghta>=1) And (Student.maghta<=3);
Repeat
TextColor(06);Write ('(D �� A)...��',Student.class,'�� ���� ���� ��� ���� : ');
TextColor(02);readln(Student.Class);Student.Class:=upcase(Student.Class);
Until (Student.Class>='A') And (Student.Class<='D');
Write (school1,Student);
End;
Write ('(Y/N) ������ ������ ����� �� ���� ��� ');
TextColor(02);c:=ReadKey;
Writeln (c);
End;
Close(school1);
Window(1,1,80,25);
Cadrs(1);
jostejoo(True);
End;
procedure nomre;
var c:char;
code:string[8];
Peyda:boolean;
nowpos:longint;
Begin
GotoXY(1,1);
TextBackground(7);
TextColor(15);
Write('������������������������������������������������������������������������������Ŀ');
Write('�                        ******* ���� ���� ���� *******                        �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('�                                                                              �');
Write('��������������������������������������������������������������������������������');Window (2,3,79,23);
TextBackground(7);ClrScr;c:=#0;
Assign (school1,'Farid.Sch');
If (Total=0) Then Begin
TextColor(4);Writeln ('!��� �� ����');ReadKey;
Window(1,1,80,25);
Cadrs(1);
Exit;
End;
Peyda:=False;
While ((c<>'n')And (c<>'N')) Do Begin
TextColor(15);
Write ('���� ���� �� �������� �����: ');TextColor(9);Readln(code);
Reset(school1);
While Not Eof(school1) Do Begin
nowpos:=FilePos(school1);
Read(school1,Student);
If (Student.Number=code) Then Begin;Peyda:=True;Seek(school1,nowpos);Break;End;
End;
If Not Peyda Then Begin;TextColor(4);Writeln('!��� ����');End;
If Peyda Then Begin
TextColor(06);Writeln (Student.smallname,' ',Student.FamillyName,' :�������� ���');
TextColor(06);Writeln (Student.Number,' :�������� �����');
TextColor(06);Writeln (Student.Class,' :��� ',Student.maghta,' :���');
TextColor(06);Writeln (' :�������� ����� ���');
for i1:=1 to 20 Do Begin
TextColor(02);
Write (Student.Mark[i1]:5:2,':');
TextColor(03);
Write (' ',i1:2,'�����  ��� --- ');
If (i1 mod 3)=0 Then Writeln;
End;
Writeln;
TextColor(06);Write ('(Y/N)������ ����� �� ������ ��� �� ���� ���');TextColor(02);c:=ReadKey;Writeln (c);

If ((c='y') or (c='Y')) Then
for i1:=1 to 20 Do Begin
TextColor(15);Write ('...��',Student.Mark[i1]:2:2,' �� ',i1:2,' ��� ���� ���� : ');
TextColor(03);Readln (Student.Mark[i1]);
End;
Write (school1,Student);
End;
Write ('(Y/N) ������ ����� ���� ���� �� ���� ���: ');
TextColor(02);c:=ReadKey;
Writeln (c);Writeln;
End;
Close(school1);
Window(1,1,80,25);
Cadrs(1);
End;
(****************************************************************************)
(*                                   Begin                                  *)
(****************************************************************************)
Begin
TextMode(3);
TextBackground(2);
ClrScr;
TextColor(06);
Cadrs(1);
Assign (list1,'Farid.Lst');
ReWrite (list1);
Assign (school1,'Farid.Sch');
{$I-}
Reset(school1);
{$I+}
If (IOResult<>0) Then Begin;ReWrite (school1);End;
Seek (school1,0);
While (Not Eof(school1)) Do Begin
Total:=Total+1;
listend:=Total;
Read(school1,Student);
Write (list1,Student);
TextColor(04+16);
GotoXY (73,6);
{If Not Searched Then Write (Total);}
Delay(5);
End;
Close (school1);
i1:=1;
listend:=Total;
jostejoo(True);
TextColor(1);
GotoXY (65,18);
Write('   ����� �ꑮ�.�');
GotoXY (65,19);
Write(' ������ ������.�');
GotoXY (65,20);
Write('  �������� 食.�');
GotoXY (65,21);
Write('����� ��� ����.�');
GotoXY (65,22);
Write('��������������.�');
GotoXY (65,23);
Write('������ �� ����.�');
textcolor(0);
GotoXY (65,24);
Write('.....���� ������');
Repeat
If KeyPressed Then Begin
c1:=ReadKey;
if ((c1>='1') and (c1<='7')) then begin;i1:=ord(c1)-48;c1:=#13;end;
If c1=#72 Then bglst:=bglst-16;
If c1=#80 Then bglst:=bglst+16;If bglst+16>listend Then bglst:=listend-16;If bglst<0 Then bglst:=0;
If (c1=#72) or (c1=#80) Then farid001;
If c1=#13 Then Begin
If i1=1 Then ezafe;
If i1=2 Then taghir;
If i1=3 Then pakk;
If i1=4 Then nomre;
If i1=5 Then jostejoo(False);
If i1=6 Then Break;
window (1,1,80,25);
i1:=1;
TextColor(1);
GotoXY (65,18);
Write('   ����� �ꑮ�.�');
GotoXY (65,19);
Write(' ������ ������.�');
GotoXY (65,20);
Write('  �������� 食.�');
GotoXY (65,21);
Write('����� ��� ����.�');
GotoXY (65,22);
Write('��������������.�');
GotoXY (65,23);
Write('������ �� ����.�');
textcolor(0);
GotoXY (65,24);
Write('.....���� ������');

End;
End;
TextBackground(2);
Delay(5);
Until c1=#27;
Window (1,1,80,25);
TextBackground(0);
ClrScr;
End.