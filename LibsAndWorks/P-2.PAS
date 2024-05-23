program  aa;
       uses graph,ncrt;
type
     idpstr=array[1..30] of string[10];
     rec1=record
        bookname,writer,poblisher,codebook,subject,numbook,shabk,edit,motarjem,amanatgeer:string[10];
        yearo,yeart,montho,montht,dayt,dayo,dayoo,yearoo,monthoo,amanatcode,rescode:byte;
        ibook:integer;
        resgeer:array[1..10]of string[10];
     end;
   recfile1=file of rec1;
   rec2=record
    resbook,name,condit,kind,id,stdnum,birthyear,enteryear,borbook1,borbook2,borbook3:string[10];
      takhir,condition,nobook:byte;
      istd:integer;
     end;
   recfile2=file of rec2;
    st=array[1..100]of rec2;
    const
    a=chr(97);
    b=chr(98);
    c=chr(99);
    d=chr(100);
    e=chr(101);
    f=chr(102);
    g=chr(103);
    h=chr(104);
    i=chr(105);
    j=chr(106);
    k=chr(107);
    M=chr(109);
    N=chr(110);
    cnull=chr(0);
    cesc=chr(27);

   var
   rcode:integer;
   driver,mode,y:integer;
   key:char;
   stdnumm:st;
   bookfile:recfile1;
   stdfile:recfile2;
   recbook:rec1;
   numbook1,numstd1:integer;
   stdrec:rec2;
   l,choice:byte;
{***********************************************}
Procedure tbar(x1,y1,x2,y2:integer);
begin
x1:=x1-5;
x2:=x2+5;
y1:=y1-3;
y2:=y2+3;
setcolor(8);
rectangle(x1,y1,x2,y2);
setcolor(7);
rectangle(x1+1,y1+1,x2-1,y2-1);
setcolor(15);
rectangle(x1+2,y1+2,x2-2,y2-2);
setcolor(7);
rectangle(x1+3,y1+3,x2-3,y2-3);
bar(x1+4,y1+4,x2-4,y2-4);
setcolor(1);
end;
{***********************************************}
procedure enterbook(recbook:rec1);
var
             k:byte;
             code:char;
begin
{initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
setbkcolor(blue);
settextstyle(smallfont,horizdir,4);
  outtextxy(300,10,'enterbook');
  setcolor(white);
{    writeln('for exit press s else press any key');}
          setfillstyle(solidfill,lightblue);
      tbar(20,80,620,400);
      line(110,80,110,400);
      line(190,80,190,400);
      line(270,80,270,400);
      line(350,80,350,400);
      line(440,80,440,400);
      line(530,80,530,400);
      line(20,165,620,165);

      {  writeln('enter a meno of under choices');
        writeln('0:rewrite');
        writeln('1:reset');}
         assign(bookfile,'d:\enterbook');
         outtextxy(20,20,'for exit press :s  else:other key');
     tbar(75,50,130,70);
    gotoxy(13,4);
    readln(code);
     while code<>'s' do
     begin
      clrscr;
     { getcolor;     }
      setfillstyle(solidfill,lightblue);
      tbar(20,80,620,400);
      line(110,80,110,400);
      line(190,80,190,400);
      line(270,80,270,400);
      line(350,80,350,400);
      line(440,80,440,400);
      line(530,80,530,400);
      line(20,165,620,165);
       outtextxy(20,40,'choose a menu Item');
        tbar(100,50,160,70);
      tbar(220,50,280,70);
      outtextxy(110,55,'1:enter');
      outtextxy(230,55,'2:add');
      gotoxy(38,4);
         readln(k);
        case k of
           1:begin
         recbook.ibook:=0;
           rewrite(bookfile);
           end;
           2:begin
           reset(bookfile);
           seek(bookfile,filesize(bookfile));
        end;
     end;{case}
   with   recbook do
     begin
    { write('book name:');  }
    outtextxy(25,120,'bookname');
     gotoxy(4,14);
     readln(bookname);
    { write('writer:'); }
    outtextxy(115,120,'writer');
    gotoxy(15,14);
     readln(writer);
    { write('poblisher:');   }
    outtextxy(195,120,'poblisher');
    gotoxy(25,14);
     readln(poblisher);
    { write('codebook:');   }
    outtextxy(275,120,'codebook');
    gotoxy(35,14);
     readln(codebook);
   {  write('number book:');   }
   outtextxy(355,120,'subject');
   gotoxy(45,14);
     readln(subject);
    { write('shabk:');  }
    outtextxy(455,120,'shabk');
    gotoxy(57,14);
     readln(shabk);
  {   write('motarjem:'); }
  outtextxy(535,120,'motarjem');
  gotoxy(68,14);
     readln(motarjem);
  {   write('subject(fizik/math/computer/zist/history/art/religious/persion/roman):');}
{     readln(subject);   }
     yearo:=0;
     yeart:=0;
     montho:=0;
     montht:=0;
     dayo:=0;
     dayt:=0;
     amanatgeer:='noone';

     for l:=1 to 10 do
     resgeer[l]:='noone';
     l:=1;
     rescode:=0;
     amanatcode:=0;
 outtextxy(20,410,'do you want to enter the infor');
 tbar(100,{455}445,150,465);
 tbar(250,445,300,465);
 outtextxy(120,{460}450,'yes');
outtextxy(270,450,'no');
 { writeln(' do you want to enter the info');
  writeln(' y:yes    n:no'); }
  end;{with}
  gotoxy(45,30);
  readln(code);
  if ord(code)=121 then
  begin
  recbook.ibook:=recbook.ibook+1;
  write(bookfile,recbook);
  end;

 { writeln('for exit press s else press any key'); }
 outtextxy(20,{475}465,'for exit press:s  else:other key');
  gotoxy(50,30);
  readln(code);
  end;{while}
  close(bookfile);
end;{enter}
{*************************************************}
procedure enterstd(stdrec:rec2);
var k:byte;
   code:char;
   begin
   {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
   setbkcolor(blue);
   settextstyle(smallfont,horizdir,4);
   outtextxy(300,10,'enterstd');
   setcolor(white);
   setfillstyle(solidfill,lightblue);
   tbar(20,80,620,400);
   line(110,80,110,400);
   line(190,80,190,400);
   line(270,80,270,400);
   line(350,80,350,400);
   line(440,80,440,400);
   line(530,80,530,400);
   line(20,165,620,165);
       assign(stdfile,'d:\enterstd');
       outtextxy(20,20,'for exit press:s   else:other key');
       tbar(75,50,130,70);
       gotoxy(13,4);
      { writeln('for exit press s else press any key'); }
             readln(code);
       while code<>'s' do
          begin
         clrscr;
            settextstyle(smallfont,horizdir,4);
            setbkcolor(blue);
          setfillstyle(solidfill,lightblue);
             tbar(20,80,620,400);
   line(110,80,110,400);
   line(190,80,190,400);
   line(270,80,270,400);
   line(350,80,350,400);
   line(440,80,440,400);
   line(530,80,530,400);
   line(20,165,620,165);
   outtextxy(20,40,'choose a menu Item:');
   tbar(100,50,160,70);
   tbar(220,50,280,70);
   outtextxy(110,55,'1:enter');
   outtextxy(230,55,'2:add');
   gotoxy(38,4);
         { writeln('0:rewrite');
          writeln('1:reset');
          writeln('according to the menu enter choice');
         } readln(k);
          case k of
             1:begin
             rewrite(stdfile);
             stdrec.istd:=0;
             end;
             2:begin
               reset(stdfile);
               seek(stdfile,filesize(stdfile));
             end;
          end;
      with stdrec do
         begin
            { write('enter name:');  }
            outtextxy(25,120,'name');
            gotoxy(4,14);
             readln(name);
            { write('condition(kardany/karshenasy/...:');}
            outtextxy(115,120,'condit');
            gotoxy(15,14);
             readln(condit);
             {write('enter id (memberic number):');}
             outtextxy(195,120,'member num');
             gotoxy(25,14);
             readln(id);
             {write('student number:');}
             outtextxy(275,120,'std num');
             gotoxy(35,14);
             readln(stdnum);
            { write('kind(r or sh):');  }
            outtextxy(355,120,'kind(r/sh)');
            gotoxy(45,14);
             readln(kind);
           { write('enteryear:');        }
           outtextxy(455,120,'enteryear');
           gotoxy(57,14);
             readln(enteryear);
            { write('birthyear:');        }
            outtextxy(535,120,'birthyear');
            gotoxy(68,14);
             readln(birthyear);
             condition:=0; {CONDITION of that std able or not able borrow book}
             borbook1:='nothing';
             borbook2:='nothing';
             borbook3:='nothing';
             takhir:=0;
             nobook:=0;
         end;{with}
         outtextxy(20,410,'do you want enter the information');
         tbar(100,445,150,465);
         tbar(250,445,300,465);
         outtextxy(120,450,'yes');
         outtextxy(270,450,'no');
       {  writeln('      do you want that enter the information');
         writeln('         y:yes      n:no');          }
         gotoxy(45,30);
         readln(code);
         if code='y' then
         begin
         stdrec.istd:=stdrec.istd+1;
         write(stdfile,stdrec);
         end;
        { writeln('for exit press s else press any key');  }
        outtextxy(20,465,'for exit press ''s'' or any other key to continue');
        gotoxy(50,30);
         readln(code);
       end;{while}
   close(stdfile);
end;
{***************************************************}
procedure stdcondit(stdrec:rec2);
var       b,a:string;
       begin
             with stdrec do
             begin
             setbkcolor(lightblue);
             setcolor(blue);
             setfillstyle(solidfill,lightgray);
             settextstyle(smallfont,horizdir,4);
                     {  writeln('name:':15,name);
                       writeln('condition:':15,condit);
                       writeln('id:':15,id);
                       writeln('student number:':10,stdnum);
                       writeln('kind(r or sh):',kind);
                       writeln('enteryear:':4,enteryear);
                       writeln('birthyear:':4,birthyear);
                       writeln('book1:',borbook1:10);
                       writeln('book2:',borbook2:10);
                       writeln('book3:',borbook3:10);
                       writeln('takhir:',takhir:3);
                       writeln('forbition:',condition:2);    }
                       tbar(200,10,300,30);   tbar(350,10,450,30);
                       tbar(200,40,300,60);    tbar(350,40,450,60);
                       tbar(200,70,300,90);    tbar(350,70,450,90);
                       tbar(200,100,300,120);    tbar(350,100,450,120);
                       tbar(200,130,300,150);    tbar(350,130,450,150);
                       tbar(200,160,300,180);    tbar(350,160,450,180);
                       tbar(200,190,300,210);    tbar(350,190,450,210);
                       tbar(200,220,300,240);    tbar(350,220,450,240);
                       tbar(200,250,300,270);    tbar(350,250,450,270);
                       tbar(200,280,300,300);    tbar(350,280,450,300);
                       tbar(200,310,300,330);    tbar(350,310,450,330);
                       tbar(200,340,300,360);    tbar(350,340,450,360);
                       outtextxy(210,15,'name');              outtextxy(360,15,name);
                       outtextxy(210,45,'condition');         outtextxy(360,45,condit);
                       outtextxy(210,75,'id');                outtextxy(360,75,id);
                       outtextxy(210,105 ,'student number');  outtextxy(360,105,stdnum);
                       outtextxy(210,135 ,'kind(r\sh)');      outtextxy(360,135,kind);
                       outtextxy(210,165,'enteryear');        outtextxy(360,165,enteryear);
                       outtextxy(210,195,'birthyear');        outtextxy(360,195,birthyear);
                       outtextxy(210,225,'book1');            outtextxy(360,225,borbook1);
                       outtextxy(210,255 ,'book2');           outtextxy(360,255,borbook2);
                       outtextxy(210,285,'book3');            outtextxy(360,285,borbook3);
                                                              str(takhir:3,a);
                                                              str(condition:2,b);
                       outtextxy(210,315,'takhir');           outtextxy(360,315,a);
                       outtextxy(210,345,'forbition');        outtextxy(360,345,b);
                  end;{with}
       end;
{**************************************************}
procedure searchstd(stdrec:rec2);
var flag,t:boolean;
    code,harf:char;
    a,vary,a1,a2:string;
    k,p,p1,o:integer;
begin
{initgraph(driver,mode,'d:\bp\bgi');}cleardevice;

 {  writeln('for exit press s else press another key'); }
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
 assign(stdfile,'d:\enterstd');
 tbar(100,20,400,40);
 outtextxy(105,25,'for exit press: s  else:other key');
 tbar(450,20,500,40);
 {gotoxy( , );}
   readln(code);
  while code<>'s' do
      begin
      o:=0;
        reset(stdfile);
       { writeln('0:search according to student name');
        writeln('1:search according to student id  ');
        writeln('2:search according to student number');  }
       { writeln('3:search according to first char');       }
        tbar(200,80,500,100);
        outtextxy(210,85,'0:search according to name');
        tbar(200,120,500,140);
        outtextxy(210,125,'1:search according to id');
        tbar(200,160,500,180);
        outtextxy(210,165,'2:search according to number');
        tbar(200,200,500,220);
        outtextxy(210,205,'3:search according to first char ');
        outtextxy(100,245,'choose a menu Item for search');
        tbar(450,240,500,260);
        gotoxy(15 ,15 );
{writeln('choice a select:');}
        readln(k);
                if k=3 then
          begin
          p:=0;
               tbar(200,320,400,340);
          outtextxy(210,325,'enter first char');
          tbar(450,320,500,340);
          readln(a);
          {closegraph;}
          {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
           setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
      {    write('enter first char:');
          readln(harf);
          write('num name id enteryear level  stdnum  takhir');
          writeln('  borbook1  borbook2  borbook3');     }
          line(70,10,70,380);  line(380,10,380,380);
          line(150,10,150,380);  line(420,10,420,380);
          line(210,10,210,380);  line(480,10,480,380);
          line(265,10,265,380);  line(540,10,540,380);
          line(320,10,320,380);
          outtextxy(45,10,'num');
          outtextxy(75,10,'name');
          outtextxy(155,10,'num');
          outtextxy(155,20,'member');
          outtextxy(215,10,'enter');
          outtextxy(220,20,'year');
          outtextxy(267,10,'stdnum');
          outtextxy(325,10,'takhir');
          outtextxy(382,10,'level');
          outtextxy(425,10,'book1');
          outtextxy(485,10,'book2');
          outtextxy(545,10,'book3');
          end;
          if (k<>3) then
        begin
          case k of

             0:vary:='name';
             1:vary:='id';
             2:vary:='stdnum';
          end;
          {writeln('enter:',vary);    }
          tbar(200,280,350,300);
          outtextxy(210,285,'enter ');
          outtextxy(270,285,vary);
          tbar(450,280,500,300);
          readln(a);
        {  gotoxy( , );}
          end; {if}
          if k=0 then
          begin
          p1:=0;
          {   write('num name id enteryear level  stdnum  takhir');
          writeln('  borbook1  borbook2  borbook3');  }
          {          closegraph;
          initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
           setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
          line(70,10,70,380);  line(380,10,380,380);          line(150,10,150,380);  line(420,10,420,380);
          line(210,10,210,380);  line(480,10,480,380);
          line(265,10,265,380);  line(540,10,540,380);
          line(320,10,320,380);
          outtextxy(45,10,'num');
          outtextxy(75,10,'name');
          outtextxy(155,10,'num');
          outtextxy(155,20,'member');
          outtextxy(215,10,'enter');
          outtextxy(220,20,'year');
          outtextxy(267,10,'stdnum');
          outtextxy(325,10,'takhir');
          outtextxy(382,10,'level');
          outtextxy(425,10,'book1');
          outtextxy(485,10,'book2');
          outtextxy(545,10,'book3');
          end;
          flag:=false;
          t:=false;
          while not eof(stdfile) and(flag=false)do
              begin
                   read(stdfile,stdrec);
                   case k of
                        0:begin
                        if stdrec.name=a then
                           begin
                           p1:=p1+1;
                           t:=true;
                           if (p1 mod 20=0) then
                           begin
                           {writeln('for continue press enter');      }

                           tbar(250,400,450,420);
                           outtextxy(260,405,'for continue press enter');
                           readln;
                              { write('num name id enteryear level  stdnum  takhir');
                               writeln('  borbook1  borbook2  borbook3'  }
              {                           closegraph;
          initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
           setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
                   line(70,10,70,380);  line(380,10,380,380);
          line(150,10,150,380);  line(420,10,420,380);
          line(210,10,210,380);  line(480,10,480,380);
          line(265,10,265,380);  line(540,10,540,380);
          line(320,10,320,380);
          outtextxy(45,10,'num');
          outtextxy(75,10,'name');
          outtextxy(155,10,'num');
          outtextxy(155,20,'member');
          outtextxy(215,10,'enter');
          outtextxy(220,20,'year');
          outtextxy(267,10,'stdnum');
          outtextxy(325,10,'takhir');
          outtextxy(382,10,'level');
          outtextxy(425,10,'book1');
          outtextxy(485,10,'book2');
          outtextxy(545,10,'book3');
                            end;
                            with stdrec do
                            begin
                           { write(p1:2,name:8,id:4,enteryear:2,condit:8,stdnum:4);
                            writeln(takhir:2,borbook1:10,borbook2:10,borbook3:10);}
                            str(p1:2,a1);
                            outtextxy(45,30+o,a1);
                            outtextxy(75,30+o,name);
                            outtextxy(155,30+o,id);
                            outtextxy(215,30+o,enteryear);
                            outtextxy(220,30+o,condit);
                            outtextxy(325,30+o,stdnum);
                            str(takhir:4,a2);
                            outtextxy(382,30+o,a2);
                            outtextxy(425,30+o,borbook1);
                            outtextxy(485,30+o,borbook2);
                            outtextxy(545,30+o,borbook3);
                            o:=o+8;
                            end;
                            end;
                        end;
                        1:begin
                        if stdrec.id=a then
                           begin
                              flag:=true;
                              stdcondit(stdrec);
                           end;
                        end;
                        2:begin
                        if stdrec.stdnum=a then
                           begin
                              flag:=true;
                              stdcondit(stdrec);
                           end;
                           end;
                         3:begin
                         if stdrec.name[1]=harf then
                         begin
                         p:=p+1;
                         t:=true;
                         if (p mod 20=0) then
                         begin
                     {    writeln('for continue press enter');     }
                     tbar(250,400,450,420);
                     outtextxy(260,405,'for continue press enter');
                          readln;
                           { write('num name id enteryear level  stdnum  takhir');
          writeln('  borbook1  borbook2  borbook3');    }
              {      closegraph;
          initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
           setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);

                    line(70,10,70,380);  line(380,10,380,380);
          line(150,10,150,380);  line(420,10,420,380);
          line(210,10,210,380);  line(480,10,480,380);
          line(265,10,265,380);  line(540,10,540,380);
          line(320,10,320,380);
          outtextxy(45,10,'num');
          outtextxy(75,10,'name');
          outtextxy(155,10,'num');
          outtextxy(155,20,'member');
          outtextxy(215,10,'enter');
          outtextxy(220,20,'year');
          outtextxy(267,10,'stdnum');
          outtextxy(325,10,'takhir');
          outtextxy(382,10,'level');
          outtextxy(425,10,'book1');
          outtextxy(485,10,'book2');
          outtextxy(545,10,'book3');
          end; {if}
                   with stdrec do
                   begin
                       {write(p:2,name:8,id:4,enteryear:2,condit:8,stdnum:4);
                            writeln(takhir:2,borbook1:10,borbook2:10,borbook3:10);}
                                    str(p:2,a1);
                            outtextxy(45,30+o,a1);
                            outtextxy(75,30+o,name);
                            outtextxy(155,30+o,id);
                            outtextxy(215,30+o,enteryear);
                            outtextxy(220,30+o,condit);
                            outtextxy(325,30+o,stdnum);
                            str(takhir:4,a2);
                            outtextxy(382,30+o,a2);
                            outtextxy(425,30+o,borbook1);
                            outtextxy(485,30+o,borbook2);
                            outtextxy(545,30+o,borbook3);
                            o:=o+8;
                            end;
                            end;
                            end;
                   end;{case}
              end;{while}
              if (t=false) and((k=0)or(k=3)) then
             { writeln('don''t exist student');    }
             begin
             tbar(200,360,400,380);
             outtextxy(210,365,'don''t exit student');
             end;
          if (flag=false)and((k=1)or(k=2)) then
          {writeln('student not found');}
          begin
           tbar(200,360,400,380);
           outtextxy(210,365,'student not find in file');
           end;
      {    writeln('for exit press s else press other key');    }
      tbar(100,420,400,440);
      outtextxy(110,425,'for exit press s else press other key');
      tbar(45,420,500,440);
   {   gotoxy( , );}
          readln(code);
          close(stdfile);
  end;{while}
end;
{***********************************************************************}
procedure  bookcondit(recbook:rec1);
var a,b:string;
begin
    with recbook do
        begin
            { writeln('book name:',bookname);
             writeln('subject  :',subject);
             writeln('writer   :',writer);
             writeln('poblisher:',poblisher);
             writeln('codebook :',codebook);
             writeln('numbook  :',numbook);
             writeln('shabk    :',shabk  );
             writeln('motarjem :',motarjem);
             writeln('borrow code:',amanatcode);
             writeln('reserve code:',rescode); }
             setbkcolor(lightblue);
             setcolor(blue);
             setfillstyle(solidfill,lightgray);
             settextstyle(smallfont,horizdir,4);
             tbar(70,45,270,75);
             tbar(70,85,270,115);
             tbar(70,125,270,155);
             tbar(70,165,270,195);
             tbar(70,205,270,235);
             tbar(70,245,270,275);
             tbar(70,285,270,315);
             tbar(70,325,270,355);
             tbar(70,365,270,395);
             tbar(70,405,270,435);
             outtextxy(75,60,'book name:');
             outtextxy( 75,100,'subject:');
             outtextxy(75,140,'writer:');
             outtextxy(75,180,'poblisher:');
             outtextxy(75,220,'codebook');
             outtextxy(75,260,'numbook:');
             outtextxy(75,300,'shabk:');
             outtextxy(75,340,'translator:');
             outtextxy(75,380,'amanatcode:');
             outtextxy(75,420,'rescode:');
             tbar(370,45,570,75);
             tbar(370,85,570,115);
             tbar(370,125,570,155);
             tbar(370,165,570,195);
             tbar(370,205,570,235);
             tbar(370,245,570,275);
             tbar(370,285,570,315);
             tbar(370,325,570,355);
             tbar(370,365,570,395);
             tbar(370,405,570,435);
             {gotoxy( , );} outtextxy(375,50,bookname);
            { gotoxy( , );} outtextxy(375,90,subject);
            {gotoxy( , );} outtextxy(375,130,writer);
            {gotoxy( , );}outtextxy(375,170,poblisher);
            {gotoxy( , );}outtextxy(375,210,codebook);
            {gotoxy( , );}outtextxy(375,250,numbook);
            {gotoxy( , );}outtextxy(375,290,shabk);
            {gotoxy( , );}outtextxy(375,330,motarjem);
         {   str(a,amanatcode):=(amanatcode);     }
            str(rescode:2,b);
            str(amanatcode:2,a);
            outtextxy(375,370,a);
            outtextxy(375,410,b);
        end;{with}
end;{bookcondit}
{*******************************************************************}
procedure   showbooksub(recbook:rec1);
var      sub,sub1,cood,a1,a2,a3,b1,b2:string;
          i,sub2,ibok,r,n,o:integer;
          code,v,p,co:char;
          find:boolean;
          codeo,booknameo,poblishero,writero,motarjemo,subjecto,amanatgeero,shabko:array[1..50]of string[10];
          rescodeo,amanatcodeo:array[1..50]of byte;

begin
       {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
        setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
   assign(bookfile,'d:\enterbook');
   reset(bookfile);
     { writeln('enter a subject for show:');         }
     tbar(200,40,400,60);
     tbar(450,40,500,60);
     outtextxy(210,45,'enter a subject for show');
   readln(sub);
   n:=0;
   while not eof(bookfile) do
      begin
         read(bookfile,recbook);
         sub1:=recbook.subject;
         sub2:=pos(sub,sub1);
         if sub2<>0 then
         n:=n+1;
         end;
         close(bookfile);
         reset(bookfile);
   ibok:=0;
  { writeln('<<list of books with subject>>');       }
  {closegraph;
         initgraph(driver,mode,'d:\bp\bgi');}
         cleardevice;
        setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
  outtextxy(200,80,'<<list of books with subject>>');
{   writeln('-------------------------------------------------------------------------');
   write('num  ','namebook',' writer',' motarjem',' codebook',' numbook',' subject');
   writeln(' rescode','  amanatcode');
   writeln('-------------------------------------------------------------------------');    }
   tbar(20,100,620,400);
   line(60,100,60,400);
   line(140,100,140,400);
   line(220,100,220,400);
   line(300,100,300,400);
   line(360,100,360,400);
   line(420,100,420,400);
   line(480,100,480,400);
   line(560,100,560,400);
   line(20,130,620,130);
   outtextxy(25,110,'num');
   outtextxy(65,110,'namebook');
   outtextxy(145,110,'writer');
   outtextxy(230,110,'translator');
   outtextxy(301,110,'codebook');
   outtextxy(361,110,'numbook');
   outtextxy(425,110,'subject');
   outtextxy(485,110,'rescode');
   outtextxy(561,110,'amanatcode');
   while not eof(bookfile) do
      begin
         read(bookfile,recbook);
         sub1:=recbook.subject;
         sub2:=pos(sub,sub1);
         if sub2<>0 then
             begin
                 with recbook do
                    begin
                        ibok:=ibok+1;
                       { write(ibok:3);
                        write(bookname:8,'  ');
                        write(writer:10,'  ');
                        write(motarjem:10,'  ');
                        write(codebook:5,'  ');
                        write(numbook:5,'  ');
                        write(subject:7,'  ');
                        write(rescode:2,'  ');
                        writeln(amanatcode:2);     }
                        str(ibok:4,a1);
                        outtextxy(30,135+o,a1);
                        outtextxy(70,135+o,bookname);
                        outtextxy(150,135+o,writer);
                        outtextxy(230,135+o,motarjem);
                        outtextxy(305,135+o,codebook);
                        outtextxy(365,135+o,numbook);
                        outtextxy(430,135+o,subject);
                        str(rescode:1,a2);
                        str(amanatcode:1,a3);
                        outtextxy(490,135+o,a2);
                        outtextxy(565,135+o,a3);
                        codeo[ibok]:=codebook;
                        writero[ibok]:=writer;
                        subjecto[ibok]:=subject;
                        poblishero[ibok]:=poblisher;
                        motarjemo[ibok]:=motarjem;
                        shabko[ibok]:=shabk;
                        booknameo[ibok]:=bookname;
                        amanatgeero[ibok]:=amanatgeer;
                         amanatcodeo[ibok]:=amanatcode;
                         rescodeo[ibok]:=rescode;
                         end;{with}
                    if(ibok mod 20=0)or(ibok=n) then
                    begin
                    {write('for show a book press (a) else press other key');     }
                    outtextxy(100,415,'for show a book press (a) else press other key');
                    readln(v);
                    while v='a' do
                    begin
                {    write('enter nubber of above:');      }
                outtextxy(200,435,'enter nubber of above:');
                    readln(r);
           {         writeln('code:',codeo[r]);
                    writeln('bookname:',booknameo[r]);
                    writeln('motarjem:',motarjemo[r]);
                    writeln('shabk:',shabko[r]);
                    writeln('writer:',writero[r]);
                    writeln('subject:',subjecto[r]);
                    writeln('poblisher:',poblishero[r]);
                    writeln('borower:',amanatgeero[r]);
                    writeln('borow code:',amanatcodeo[r]);
                    writeln('reserve code:',rescodeo[r]);
                        write('for show a book press (a) else press other key');      }
                    setfillstyle(solidfill,lightgray);
                    tbar(10,200,630,240);
                    line(10,220,630,220);
                    line(50,200,50,240);
                    line(120,200,120,240);
                    line(190,200,190,240);
                    line(230,200,230,240);
                    line(300,200,300,240);
                    line(350,200,350,240);
                    line(420,200,420,240);
                    line(490,200,490,240);
                    line(560,200,560,240);
                    outtextxy(11,205,'code');
                    outtextxy(51,205,'bookname');
                    outtextxy(121,205,'translator');
                    outtextxy(191,205,'shabk');
                    outtextxy(231,205,'writer');
                    outtextxy(301,205,'subject');
                    outtextxy(351,205,'poblisher');
                    outtextxy(421,205,'borrower');
                    outtextxy(491,205,'borrowcode');
                    outtextxy(561,205,'reservecode');
                    outtextxy(15,225,codeo[r]);
                    outtextxy(55,225,booknameo[r]);
                    outtextxy(125,225,motarjemo[r]);
                    outtextxy(195,225,shabko[r]);
                    outtextxy(235,225,writero[r]);
                    outtextxy(305,225,subjecto[r]);
                    outtextxy(355,225,poblishero[r]);
                    outtextxy(425,225,amanatgeero[r]);
                    str(amanatcodeo[r]:1,b1);
                    str(rescodeo[r]:1,b2);
                    outtextxy(495,205,b1);
                    outtextxy(565,225,b2);
                                        readln(v);
                                        end;
                    writeln('for exit press d else other key');
                    if co<>'d'then
                    begin{{{{{{{{{{{{}
                    writeln(' <<for continue press enter>>');
                    readln;
                    end; {if}
                    end;{if}
                    end;{while}
                    end;

   close(bookfile);
end;
{*******************************************************************}
procedure  searchbook(recbook:rec1);
var         flag,tchar:boolean;
            code,harf:char;
            b,vary,a1,a2,a3:string;
            k,p,p1,o:integer;
begin
    {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
    assign(bookfile,'d:\enterbook');
    o:=0;
 {   writeln('for exit press s else press any key');        }
 tbar(100,20,400,40);
 outtextxy(110,25,'for exit press s else press any key');
 tbar(450,20,500,40);
 gotoxy(20,5);
    readln(code);
    while code<>'s' do
        begin
         reset(bookfile);
         {   writeln('choice a menu for search');
            writeln('1:search book according to name');
            writeln('2:search book according to writer');
            writeln('3:search  according to number book');
            writeln('4:search  according to code book');
            writeln('5:search according to first char');
            writeln('6:search book according to subject');      }
            tbar(200,60,500,80);
            tbar(200,90,500,110);
            tbar(200,120,500,140);
            tbar(200,150,500,170);
            tbar(200,180,500,200);
            tbar(200,210,500,230);
            outtextxy(210,65,'1:search book according to name');
            outtextxy(210,95,'2:search according to writer');
            outtextxy(210,125,'3:search according to number book');
            outtextxy(210,155,'4:search according to code book');
            outtextxy(210,185,'5:search according to first char');
            outtextxy(210,215,'6:search according to subject');
            outtextxy(100,245,'choose a menu Item for search');
            tbar(450,240,500,260);
            gotoxy(20,35);


            readln(k);
            if(k<>5)and(k<>6) then
            begin
             case k of
                  1:vary:='bookname';
                  2:vary:='writer';
                  3:vary:='numbook';
                  4:vary:='codebook';
             end;
           { writeln('enter:',vary);      }
           tbar(200,270,400,290);
           outtextxy(210,275,'enter');
           outtextxy(250,275,vary);
           tbar(450,270,550,290);
           gotoxy(20,40);
            readln(b);
            end;{if}
            if(k=5) then
            begin
           { write('enter first char for search:');     }
           tbar(100,300,400,320);
           outtextxy(110,305,'enter first char for search');
           tbar(450,300,600,320);
           gotoxy(20,45);
            readln(harf);
            p:=0;
           { write('num bookname  subject  poblisher translator  ');
            writeln('rescode amanatcode');   }
            {closegraph;
                initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
 line(170,50,170,350);
 line(250,50,250,350);
 line(310,50,310,350);
 line(390,50,390,350);
 line(480,50,480,350);
 line(510,50,510,350);
 outtextxy(140,55,'num');
 outtextxy(175,55,'name');
 outtextxy(255,55,'subject');
 outtextxy(315,55,'poblisher');
 outtextxy(395,55,'translator');
 outtextxy(485,55,'rescode');
 outtextxy(515,55,'amanatcode');
            end;
            if (k=1)or(k=2) then
            begin
            p1:=0;
           { write('num bookname  subject  poblisher translator  ');
            writeln('rescode amanatcode');     }
                {        closegraph;
                initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
 line(170,50,170,350);
 line(250,50,250,350);
 line(310,50,310,350);
 line(390,50,390,350);
 line(480,50,480,350);
 line(510,50,510,350);
 outtextxy(145,55,'num');
 outtextxy(175,55,'name');
 outtextxy(255,55,'subject');
 outtextxy(315,55,'poblisher');
 outtextxy(395,55,'translator');
 outtextxy(485,55,'rescode');
 outtextxy(515,55,'amanatcode');
            end;
            flag:=false;
            tchar:=false;
              while not eof(bookfile) and (flag=false) do
                  begin
                      read(bookfile,recbook);
                      case k of
                      1:begin
                         if recbook.bookname=b then
                           begin
                           p1:=p1+1;
                           tchar:=true;
                           if (p1 mod 20=0) then
                           begin
                          { writeln('for continue press enter');         }
                          outtextxy(260,430,'for continue press enter');
                           readln;
                           {   write('num bookname  subject  poblisher translator  ');
                              writeln('rescode amanatcode'); }
                {                          closegraph;
                initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
 line(170,50,170,350);
 line(250,50,250,350);
 line(310,50,310,350);
 line(390,50,390,350);
 line(480,50,480,350);
 line(510,50,510,350);
 outtextxy(145,55,'num');
 outtextxy(175,55,'name');
 outtextxy(255,55,'subject');
 outtextxy(315,55,'poblisher');
 outtextxy(395,55,'translator');
 outtextxy(485,55,'rescode');
 outtextxy(515,55,'amanatcode');
                              end;
                              with recbook do
                              begin
                       {       write(p1:2,bookname:10,subject:10,poblisher:10,motarjem:11);
                              writeln( rescode:2,amanatcode:2);  }
                              str(p1:2,a1);
                              outtextxy(145,70+o,a1);
                              outtextxy(175,70+o,bookname);
                              outtextxy(255,70+o,subject);
                              outtextxy(315,70+o,poblisher);
                              outtextxy(395,70+o,motarjem);
                              str(rescode:2,a2);
                              str(amanatcode:2,a3);
                              outtextxy(485,70+o,a2);
                              outtextxy(515,70+o,a3);
                              o:=o+8;
                              end;
                           end;
                      end;
                      2:begin
                         if recbook.writer=b then
                           begin
                            p1:=p1+1;
                           tchar:=true;
                           if (p1 mod 20=0) then
                           begin
                       {    writeln('for continue press enter');   }
                                outtextxy(260,430,'for continue press enter');
                           readln;
                              {write('num bookname  subject  poblisher translator  ');
                              writeln('rescode amanatcode');   }
                    {                      closegraph;
                initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
 line(170,50,170,350);
 line(250,50,250,350);
 line(310,50,310,350);
 line(390,50,390,350);
 line(480,50,480,350);
 line(510,50,510,350);
 outtextxy(145,55,'num');
 outtextxy(175,55,'name');
 outtextxy(255,55,'subject');
 outtextxy(315,55,'poblisher');
 outtextxy(395,55,'translator');
 outtextxy(485,55,'rescode');
 outtextxy(515,55,'amanatcode');
                              end;
                              with recbook do
                              begin
                         {     write(p1:2,bookname:10,subject:10,poblisher:10,motarjem:11);
                              writeln( rescode:2,amanatcode:2);    }
                                   str(p1:2,a1);
                              outtextxy(145,70+o,a1);
                              outtextxy(175,70+o,bookname);
                              outtextxy(255,70+o,subject);
                              outtextxy(315,70+o,poblisher);
                              outtextxy(395,70+o,motarjem);
                                     str(rescode:2,a2);
                              str(amanatcode:2,a3);
                              outtextxy(485,70+o,a2);
                              outtextxy(515,70+o,a3);
                              o:=o+8;
                              end;
                           end;
                      end;
                      3:begin
                         if recbook.numbook=b then
                           begin
                              flag:=true;
                              bookcondit(recbook);
                              readln;
                           end;
                      end;
                      4:begin
                         if recbook.codebook=b then
                           begin
                              flag:=true;
                              bookcondit(recbook);
                              readln;
                           end;
                      end;
                      5:begin
                      if recbook.bookname[1]=harf then
                      begin
                      tchar:=true;
                      p:=p+1;
                      if(p mod 20=0) then
                      begin
                     { writeln('<<for continue press enter>>');     }
                              outtextxy(260,430,'for continue press enter');
                      readln;
                  {    write('num bookname  subject  poblisher translator  ');
                      writeln('rescode amanatcode');     }
                    {              closegraph;
                initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
 line(170,50,170,350);
 line(250,50,250,350);
 line(310,50,310,350);
 line(390,50,390,350);
 line(480,50,480,350);
 line(510,50,510,350);
 outtextxy(145,55,'num');
 outtextxy(175,55,'name');
 outtextxy(255,55,'subject');
 outtextxy(315,55,'poblisher');
 outtextxy(395,55,'translator');
 outtextxy(485,55,'rescode');
 outtextxy(515,55,'amanatcode');
                      end;
                      with recbook do
                      begin
                     { write(p:2,bookname:10,subject:10,poblisher:10,motarjem:11);
                      writeln( rescode:2,amanatcode:2);   }
                           str(p:2,a1);
                              outtextxy(145,70+o,a1);
                              outtextxy(175,70+o,bookname);
                              outtextxy(255,70+o,subject);
                              outtextxy(315,70+o,poblisher);
                              outtextxy(395,70+o,motarjem);
                                     str(rescode:2,a2);
                              str(amanatcode:2,a3);
                              outtextxy(485,70+o,a2);
                              outtextxy(515,70+o,a3);
                              o:=o+8;
                      end;
                      end;
                      end;
                      6:begin
                           close(bookfile);
                           showbooksub(recbook);
                           reset(bookfile);
                      end;
                  end;{case}
              end;{while}
              if (tchar=false)and((k=1)or(k=2)or(k=5))then
              begin
          {   writeln('don''t exist book ');     }
          tbar(200,350,400,370);
          outtextxy(210,350,'don''t  exist book');
          end;
        if (flag=false)and((k=3)or(k=4)) then
        begin
        {writeln('not find book');
        writeln('for exit press s else press any key');  }
        tbar(200,350,400,370);
        outtextxy(210,350,'not find book');
        end;
        outtextxy(110,405,'for exit press s else any key');
        readln(code);
         close(bookfile);
    end;{while}
end;
{********************************************************************}
procedure reserved(recbook:rec1);
var        d,code,o:char;
           codeb,idres:string;
           flag,find:boolean;
           i,ss,yearto,monthto,dayto:byte;
           d1,g1,g2:integer;
begin
    {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
 setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
    assign(bookfile,'d:\enterbook');
    assign(stdfile,'d:\enterstd');
    reset(bookfile);
    reset(stdfile);
{    writeln('for exit press s else press other key'); }
tbar(100,60,400,80);
tbar(450,60,550,80);
outtextxy(110,65,'for exit press s else other key');
    readln(code);
    while code<>'s' do
       begin
       {closegraph;
       initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
        setbkcolor(lightblue);
 setcolor(blue);
 setfillstyle(solidfill,white);
       {   writeln('if you forget codebook press  e else press other key');  }
       outtextxy(130,105,'if you forget code book press e else press other key');
          readln(d);
          while d='e'do
             begin
                 close(bookfile);

                 searchbook(recbook);
                       {closegraph;
                              initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
        setbkcolor(lightgreen);
 setcolor(blue);
 setfillstyle(solidfill,white);
                 reset(bookfile);
             end;
          {write('enter codebook  for reserve:');    }
          tbar(100,140,400,160);
          tbar(450,140,550,160);
          outtextxy(110, 145,'enter code book for reserve');
          readln(codeb);
       {     writeln('enter history for today (year/month/day):');    }
       tbar(100,170,400,190);
       tbar(450,170,550,190);
       outtextxy(110,175,'enter history for today');
           read(yearto);
           read(monthto);
           readln(dayto);
           if monthto<=6 then
           d1:=31
           else d1:=30;
           g1:=(365*yearto)+(monthto*d1)+dayto;
           while not eof(bookfile) do
             begin
             read(bookfile,recbook);
             g2:=(365*recbook.yearoo)+(recbook.monthoo*d1)+recbook.dayoo;
             if (g1-g2)>=3 then
             begin
             recbook.rescode:=0;
             for l:=1 to 10 do
             recbook.resgeer[l]:='noon';
             end;
             end;
             write(bookfile,recbook);
             close(bookfile);
             reset(bookfile);
          flag:=false;
          while not eof(bookfile) do
             begin
                read(bookfile,recbook);
                if codeb=recbook.codebook then    {HHH}
                   begin
                     { writeln('do you want reserved this book');
                        writeln('y=yes       n=no'); }
                        outtextxy(210,215,'do you want reserve this book');
                        tbar(250,240,300,260);
                        tbar(400,240,450,260);
                        outtextxy(255,245,'yes');
                        outtextxy(405,245,'no');
                        readln(o);
                        if o='y' then
                        begin       {kk}

                    {   writeln('enter you''r id for reserve book whit code: ',codeb);          }
                    tbar(100,280,500,300);
                    tbar(550,280,600,300);
                    outtextxy(110,285,'enter you''r id for reserve book with code ');
                    outtextxy(450,285,codeb);
                       readln(idres);
                       find:=false;
                       while not eof(stdfile)and(find=false) do
                       begin
                       read(stdfile,stdrec);
                       if idres=stdrec.id then
                       begin
                       ss:=stdrec.condition;
                       find:=true;
                       end;
                       end;{while }
                       if find=false then
                       writeln('      <<student not find>>')
                       else begin {OO}
                       if ss=0 then
                      begin{(((((}
                       if (l<=10)  then            {8}
                        begin
                       if recbook.rescode<>1 then
                       recbook.rescode:=1;
                       recbook.resgeer[l]:=idres;
                       l:=l+1;
                       flag:=true;
                  {     writeln('             <<book reserved>>');  }
                  tbar(200,320,500,340);
                  outtextxy(250,325,'book reserved');
                       write(bookfile,recbook);
                       end
                       else
                       begin
                       tbar(200,320,500,340);
                       outtextxy(205,325,'you can''t reserve ** capacity is full');
                       end;
               {        writeln('       <<you cannot reserve capacity is full>> ');}
                    end;{(((((((}
                    if  ss<>0 then
                      begin
                      tbar(200,320,500,340);
                      outtextxy(250,325,'you are forbid');
                      end;
                 {   writeln('      <<<you are forbid>>>');     }
                    end;{OO}
                    end;{kk}
                    end;{HHH}
             end;{while}
          if flag=false  then
          begin
          tbar(200,320,500,340);
          outtextxy(250,325,'book not find');
          end;
        {  writeln('        <<book not find>>');       }
         { writeln('for exit press s else press other key');      }
         outtextxy(110,405,'for exit press s else other key');
          readln(code)
       end;{while}
    close(bookfile);
    close(stdfile);
end;
{*********************************************************}
procedure  headstd(title:string);
begin
setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,1);
outtextxy(80,20,'Show All Student');
SETTEXTSTYLE(defaultfont,horizdir,1);
{writeln(title);
write('num  name    condit        kind        id        stdnum');
writeln('-----------------------------------------------');    }
tbar(100,40,480,400);
line(100,60,480,60);
line(160,40,160,400);
line(240,40,240,400);
line(300,40,300,400);
line(360,40,360,400);
line(400,40,400,400);
outtextxy(105,45,'num');
outtextxy(165,45,'name');
outtextxy(240,45,'condit');
outtextxy(305,45,'kind');
outtextxy(365,45 ,'id');
outtextxy(405,45,'stdnum');
readln;
{closegraph;}
end;
{************************************************************}
procedure   outstd(stdrec:rec2;idp,namep,enteryearp,birthyearp,kindp,conditp,stdnump:idpstr;i:integer);
var         r:char;
            num:integer;
            a1:string;
begin
   with stdrec do
   begin
         { writeln(i:3,name:3,condit:11,kind:6,id:13,stdnum:14); }
         str(i:2,a1);
         outtextxy(105,65,a1);
         outtextxy(165,65,name);
         outtextxy(240,65,condit);
         outtextxy(305,65,kind);
         outtextxy(365,65,id);
         outtextxy(405,65,stdnum);
         end;
          if (i mod 20=0)or(i=numstd1) then
          begin
         { writeln('   <<choice (a) for show a student perfect else press other key');  }
          outtextxy(100,415,'press (a) for show a student perfect else ress any key');
          tbar(450,410,500,430);
          readln(r);
          while r='a' do
          begin
         { writeln('     <<enter a digit of above>>');     }
         outtextxy(260,445,'enter a number of above');
         tbar(450,440,500,460);
             readln(num);
           {  write('id:',idp[num]);
             writeln('name:',namep[num]);
             writeln('level:',conditp[num]);
             writeln('kind(r/sh):',kindp[num]);
             writeln('student number:',stdnump[num]);
             writeln('enteryear:',enteryearp[num]);
             writeln('birthyear:',birthyearp[num]);   }
{             writeln('   <<choice (a) for show a student perfect else press other key');
             readln(r);                                }
             tbar(100,150,540,200);
             line(160,150,160,200);
             line(240,150,240,200);
             line(300,150,300,200);
             line(360,150,360,200);
             line(420,150,420,200);
             line(480,150,480,200);
             line(100,180,540,180);
             outtextxy(110,155,'id');
             outtextxy(170,155,'name');
             outtextxy(250,155,'level');
             outtextxy(310,155,'kind(r\sh)');
             outtextxy(365,155,'student');
             outtextxy(365,165,'number');
             outtextxy(425,155,'enter');
             outtextxy(425,165,'year');
             outtextxy(485,155,'birth');
             outtextxy(485,165,'year');
             with stdrec do
             begin
             outtextxy(110,185,id);
             outtextxy(170,185,name);
             outtextxy(250,185,condit);
             outtextxy(310,185,kind);
             outtextxy(365,185,stdnum);
             outtextxy(425,185,enteryear);
             outtextxy(485,185,birthyear);
             end;
             end;
                writeln('press enter to continue');
                readln;
                headstd('<<report all students>>');
             end;{if}
             readln;
end;
{*********************************************************}
procedure  reportstd(stdnumm:st);
var          i,j,k:integer;
             stdrec1:rec2;
             idp,namep,enteryearp,birthyearp,kindp,conditp,stdnump:idpstr;
              r:char;
            num,o:integer;
            a1:string;
 P: Pointer;
 Size: Word;
begin

   k:=0;
   {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,1);
outtextxy(80,20,'Show All Student');
SETTEXTSTYLE(defaultfont,horizdir,1);
   assign(stdfile,'d:\enterstd');
{reset(stdfile);}
repeat
o:=0;
tbar(100,40,480,400);
line(100,60,480,60);
line(160,40,160,400);
line(240,40,240,400);
line(300,40,300,400);
line(360,40,360,400);
line(400,40,400,400);
outtextxy(105,45,'num');
outtextxy(165,45,'name');
outtextxy(240,45,'condit');
outtextxy(305,45,'kind');
outtextxy(365,45 ,'id');
outtextxy(405,45,'stdnum');
   reset(stdfile);
numstd1:=filesize(stdfile);
{closegraph;
writeln(numstd1);
halt;       }
for i:=1 to 10 do
if not eof(stdfile)then
read(stdfile,stdnumm[i]);
   for i:=1 to (numstd1-1) do
     for j:=1 to (numstd1-1-i)do
       if stdnumm[j+1].name<stdnumm[j].name then
          begin
            stdrec1:=stdnumm[j+1];
             stdnumm[j+1]:=stdnumm[j];
             stdnumm[j]:=stdrec1;
          end;
          rewrite(stdfile);
          seek(stdfile,0);
          for i:=1 to numstd1 do
          write(stdfile,stdnumm[i]);
          seek(stdfile,0);
          for i:=1 to numstd1 do
          if not eof(stdfile) then
          begin
          read(stdfile,stdnumm[i]);
          idp[i]:=stdnumm[i].id;
          namep[i]:=stdnumm[i].name;
          enteryearp[i]:=stdnumm[i].enteryear;
          kindp[i]:=stdnumm[i].kind;
          birthyearp[i]:=stdnumm[i].birthyear;
          stdnump[i]:=stdnumm[i].stdnum;
          conditp[i]:=stdnumm[i].condit;
          end;
      for i:=1 to numstd1  do
      begin
   with stdnumm[i] do
   begin
         str(i:2,a1);
         outtextxy(105,65+o,a1);
         outtextxy(165,65+o,name);
         outtextxy(240,65+o,condit);
         outtextxy(305,65+o,kind);
         outtextxy(365,65+o,id);
         outtextxy(405,65+o,stdnum);
                o:=o+15;

          if (i mod 20=0)or(i=numstd1) then
           begin
          outtextxy(100,415,'press (a) to show details or press any key');
          tbar(450,410,500,430);
          readln(r);
          {while r='a' do
          begin}
         if r='a' then begin
         outtextxy(260,445,'enter a number:');
         tbar(450,440,500,460);
          readln(num);
          cleardevice;
          id:=stdnumm[num].id;
          name:=stdnumm[num].name;
          enteryear:=stdnumm[num].enteryear;
          kind:=stdnumm[num].kind;
          birthyear:=stdnumm[num].birthyear;
          stdnum:=stdnumm[num].stdnum;
          condit:=stdnumm[num].condit;
             tbar(100,150,540,200);
             line(160,150,160,200);
             line(240,150,240,200);
             line(300,150,300,200);
             line(360,150,360,200);
             line(420,150,420,200);
             line(480,150,480,200);
             line(100,180,540,180);
             outtextxy(110,155,'id');
             outtextxy(170,155,'name');
             outtextxy(250,155,'level');
             outtextxy(310,155,'kind');
             outtextxy(365,155,'student');
             outtextxy(365,165,'number');
             outtextxy(425,155,'enter');
             outtextxy(425,165,'year');
             outtextxy(485,155,'birth');
             outtextxy(485,165,'year');
             outtextxy(110,185,id);
             outtextxy(170,185,name);
             outtextxy(250,185,condit);
             outtextxy(310,185,kind);
             outtextxy(365,185,stdnum);
             outtextxy(425,185,enteryear);
             outtextxy(485,185,birthyear);
                writeln('press enter to continue');
                readln;
           cleardevice;
             end;
           setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,1);
outtextxy(80,20,'Show All Student');
SETTEXTSTYLE(defaultfont,horizdir,1);
tbar(100,40,480,400);
line(100,60,480,60);
line(160,40,160,400);
line(240,40,240,400);
line(300,40,300,400);
line(360,40,360,400);
line(400,40,400,400);
outtextxy(105,45,'num');
outtextxy(165,45,'name');
outtextxy(240,45,'condit');
outtextxy(305,45,'kind');
outtextxy(365,45 ,'id');
outtextxy(405,45,'stdnum');
             end;{if}
        end;{with}
        end;{for}
until r<>'a';
   close(stdfile);
end;
{*********************************************************}
procedure editbook(recbook:rec1);
var        num:string;
           f:recfile1;
           flag:boolean;
           code,d:char;
           m,o,u:integer;
begin
    {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,1);
   assign(bookfile,'d:\enterbook');
   assign(f,'d:\temp.dat');
   m:=0;
   o:=0;
    reset(bookfile);
    rewrite(f);
  { writeln('for exit press s else press any key');      }
   tbar(100,50,400,70);
   outtextxy(105,55,'for exit press s else press any key');
   tbar(420,50,500,70);
   readln(code);
   while code<>'s' do
      begin
      tbar(100,80,500,100);
      outtextxy(105,85,'if forget booknumber press x else other key');
          {writeln('i, forget book number press x elss press other key'); }
          readln(d);
          if d='x'then
              begin
              close(bookfile);
              searchbook(recbook);
              end;
              reset(bookfile);
      {    write('enter book number to edit:');       }
      tbar(100,110,400,130);
      outtextxy(105,115,'enter book number to edit');
      tbar(420,110,500,130);
          readln(num);
          flag:=false;
          while not eof(bookfile)and (flag=false) do
              begin
                  read(bookfile,recbook);
                  if  recbook.codebook=num then
                     begin
                         repeat
                       {closegraph;
                             initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
             {                setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,1);    }
                             bookcondit(recbook);
                             for u:=1 to 5 do
                             begin
                             tbar(150,140+o,300,160+m);
                             tbar(350,140+o,500,160+m);
                            m:= m+30     ;
                            o:=o+30;
                            end;
                            {closegraph;
                                initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
                                setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,1);
                           {  writeln('0:change name book');
                             writeln('1:change writer book');
                             writeln('2:change poblisher book');
                             writeln('3:change code book');
                             writeln('4:change subject book');
                             writeln('5:change number book');
                             writeln('6:change shabk book');
                             writeln('7:change motargem book');
                             writeln('8:exit');
                             writeln('choice a menu (0-8)');   }
                             outtextxy(155,145,'0:change name book');
                             outtextxy(155,175,'1:change writer book');
                             outtextxy(155,205,'2:change poblisher book');
                             outtextxy(155,235,'3:change code book');
                             outtextxy(155,265,'4:change subject book');
                             outtextxy(355,145,'5:change number book');
                             outtextxy(355,175,'6:change shabk book');
                             outtextxy(355,205,'7:change translator book');
                             outtextxy(355,235,'8:exit');
                            tbar(250,300,460,320);
                            outtextxy(260,305,'choose a menu Item');
                             readln(choice);
                             case choice of
                               0:begin
                              {    write('enter new name for book:');    }
                              tbar(100,330,400,350);
                              outtextxy(110,335,'enter new name for book');
                              tbar(420,330,500,350);

                                  readln(recbook.bookname);
                               end;
                               1:begin
                              {    write('enter new eriter for book:');  }
                                                               tbar(100,330,400,350);
                              outtextxy(110,335,'enter new writer for book');
                              tbar(420,330,500,350);
                                  readln(recbook.writer);
                               end;
                               2:begin
                                 { write('enter new poblisher for book:');    }
                                                               tbar(100,330,400,350);
                              outtextxy(110,335,'enter new poblisher for book');
                              tbar(420,330,500,350);
                                  readln(recbook.poblisher);
                               end;
                               3:begin
                                 { write('enter new code for book:');   }
                                                               tbar(100,330,400,350);
                              outtextxy(110,335,'enter new code for book');
                              tbar(420,330,500,350);
                                  readln(recbook.codebook);
                               end;
                               4:begin
                                 { write('enter new subject for book:');     }
                                                               tbar(100,330,400,350);
                              outtextxy(110,335,'enter new subject for book');
                              tbar(420,330,500,350);
                                  readln(recbook.subject);
                               end;
                               5:begin
                                 { write('enter new number for book:');      }
                                                               tbar(100,330,400,350);
                              outtextxy(110,335,'enter new number for book');
                              tbar(420,330,500,350);
                                  readln(recbook.numbook);
                               end;
                               6:begin
                                 { write('enter new shabk for book:') ; }
                                                               tbar(100,330,400,350);
                              outtextxy(110,335,'enter new shabk for book');
                              tbar(420,330,500,350);
                                  readln(recbook.shabk);
                               end;
                               7:begin
                                 { write('enter new motarjem for book:');   }
                                                               tbar(100,330,400,350);
                              outtextxy(110,335,'enter new translator for book');
                              tbar(420,330,500,350);
                                  readln(recbook.motarjem);
                               end;
                             end;{case}
                         until choice=8;
                         flag:=true;
                          write(f,recbook);
                     end;{if}
                  write(f,recbook);
              end;{while}
         if flag=false then
             begin
{                 writeln('book with number',num,'not find');     }
tbar(300,380,400,400);
outtextxy(310,385,'not find');
                 readln;
             end;
     {     writeln('for exit press s else press any key');       }
tbar(100,410,400,430);
tbar(420,410,500,430);
outtextxy(105,415,' for exit press s else press any key');
          readln(code);
   end;{while}
   close(bookfile);
   close(f);
   erase(bookfile);
   rename(f,'d:\enterbook');
end;{procedure}
{***********************************************************}
procedure  editstd(stdrec:rec2);
var        code,d:char;
           idd:string;
           f:recfile2;
           flag:boolean;
begin
   {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
   setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,lightgray);
     assign(stdfile,'d:\enterstd');
     assign(f,'d:\temp.dat') ;
     reset(stdfile);
     rewrite(f);
    { writeln('for exit press  y  else press any key');   }
    outtextxy(30,50,'for exit press  y  else press any key');
     readln(code);
     while code<>'y' do
        begin
    { writeln('if you forget id for student press x else press other key'); }
             outtextxy(10,65,'if you forget id press x else other key');
     readln(d);
     if d='x' then
         begin
             close(stdfile);
             searchstd(stdrec);
         end;
     reset(stdfile);
    { writeln('enter id for student for edit:'); }
       
     readln(idd);
     flag:=false;
           while not eof(stdfile)and (flag=false) do
              begin
                 read(stdfile,stdrec);
                     if stdrec.id=idd then
                         begin
                           repeat
                              stdcondit(stdrec);
                              writeln('0:change in the student name');
                              writeln('1:change in the student condition');
                              writeln('2:change in the kind  for student');
                              writeln('3:change in the  student id ');
                              writeln('4:change in the  student number');
                              writeln('5:change in the  enteryear');
                              writeln('6:exit');
                              writeln('choose a menu Item');
                              readln(choice);
                              case choice of
                                0:begin
                                   write('enter new name for student:');
                                   readln(stdrec.name);
                                end;
                                1:begin
                                   write('enter new condition for student:');
                                   readln(stdrec.condit);
                                end;
                                2:begin
                                   write('enter new kind(r or sh) for student:') ;
                                   readln(stdrec.kind);
                                end;
                                3:begin
                                   write('enter new id for student:');
                                   readln(stdrec.id);
                                end;
                                4:begin
                                   write('enter new number for student:');
                                   readln(stdrec.stdnum);
                                end;
                                5:begin
                                   write('enter new enteryear for student:');
                                   readln(stdrec.enteryear);
                                end;
                              end;{case}
                           until choice=6;
                           flag:=false;
                         end;{if}
                     write(f,stdrec);
              end;{while}
           write(f,stdrec);
           if flag=false then
              begin
                  writeln('<<student with id ',idd,' not find>>');
                  readln;
              end;
           writeln('for exit press  y  else press any key');
           readln(code);
        end;{while}
     close(stdfile);
     close(f);
     erase(stdfile);
     rename(f,'d:\enterbook');
end;{procedure}
{***************************************************************}
procedure  deletestd(stdrec:rec2;var numstd1:integer);
var         idd:string;
            d,ans,code:char;
            f:recfile2;
            key,flag:boolean;
begin
   {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;

{   writeln('for exit press s else press other key');}
   setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,lightgray);
   tbar(20,40,320,60);
   outtextxy(30,50,'for exit press s else press other key:');
    tbar(400,40,320,60);
  {  gotoxy( , );}
   readln(code);
   while code<>'s'do
     begin
     {closegraph;
     initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
          setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,lightgray);
        assign(stdfile,'d:\enterstd');
   assign(f,'d:\temp.dat');
   reset(stdfile);
   rewrite(f);
       { writeln('if you forget id for student press x else press other key');}
         tbar(20,100,350,140);
        outtextxy(30,120,'if you forget id press s else other key');
        tbar(400,100,500,140);
        {gotoxy( , );}
        readln(d);
        if d='x' then
           begin
              close(stdfile);
              searchstd(stdrec);
              reset(stdfile);
           end;
     {   writeln('enter id for student to delete');   }
         tbar(20,160,320,200);
         outtextxy(30,180,'enter id for delete');
         tbar(400,160,500,200);
       {  gotoxy( , );}
        readln(idd);
        flag:=false;
        while not eof(stdfile) do
          begin
             key:=false;
             read(stdfile,stdrec);
             if stdrec.id=idd then
               begin
      {              closegraph;
     initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
          setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,lightgray);
                  stdcondit(stdrec);
                  {write('do you want to delete this record(y/n)');}
                    tbar(100,380,340,410);
                    outtextxy(110,395,'do you want  delete  this record(y/n):');
                      tbar(350,380,400,410);
                      gotoxy(46,25);
                  readln(ans);
                  flag:=true;
                  key:=true;
                  if ans='y' then
                  begin
                  stdrec.istd:=stdrec.istd-1;
                  numstd1:=numstd1-1;
                  end;
               end;{if}
             if key then
               begin
                 if ans='n' then
                    write(f,stdrec);
                    end
                    else write(f,stdrec);
          end;{while}
        close(stdfile);
        close(f);
        erase(stdfile);
        rename(f,'d:\enterstd');
        if flag=false  then
        begin
         {  writeln('student with id ',idd,' not find');
        writeln('for exit press s else press other key');}
           tbar(20,280,300,320);
          outtextxy(30,300,'student not find');
          end;
          tbar(100,420,340,450);
          outtextxy(110,435,'for exit press s else press other key:');
          tbar(350,420,400,450);
          gotoxy(46 ,30 );
        readln(code);
     end;{while}
end;
{*********************************************************************}
procedure  deletebook(recbook:rec1;var numbook1:integer);
var        cod:string;
           r,ans,code:char;
           f:recfile1;
           key,flag:boolean;
begin

    {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
   { write('for exit press s else press other key:');  }
   setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,white);
   tbar(20,40,320,60);
   outtextxy(30,50,'for exit press s else press other key:');
    tbar(400,40,320,60);
  {  gotoxy( , );}
    readln(code);
    while code<>'s' do
       begin
      {closegraph;
           initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
           setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,white);
     assign(bookfile,'d:\enterbook');
    assign(f,'d:\temp.dat');
    reset(bookfile);
    rewrite(f);
        {  write('if forget codebook:x   else:other key:'); }
        tbar(18,100,380,140);
        outtextxy(19,120,'if you forget codebook press s else other key');
        tbar(400,100,500,140);
        {gotoxy( , );}
          readln(r);
          if r='x' then
             begin
                close(bookfile);
                searchbook(recbook);
                reset(bookfile);
             end;
         { write('enter code book for delete:');  }
         tbar(20,160,320,200);
         outtextxy(30,180,'enter code book for delete');
         tbar(400,160,500,200);
       {  gotoxy( , );}
          readln(cod);
          flag:=false;
          while not eof(bookfile) do
             begin
                key:=false;
                read(bookfile,recbook);
                if recbook.codebook=cod then
                   begin
                 {  clrscr;}
              {{ }  {closegraph;
                     initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
                      setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,white);
                      bookcondit(recbook);
                    {  write('do you want  delete  this record(y/n):');   }

                    outtextxy(30,440,'do you want  delete  this record(y/n):');
                   {   gotoxy( , );}
                      readln(ans);
                      flag:=true;
                      key:=true;
                      if ans='y' then
                      begin
                      recbook.ibook:=recbook.ibook-1;
                      numbook1:=numbook1-1;
                      end;  {((*))}
                   end;{if}
                if key then {key=true  finded code book}
                   begin
                      if ans='n' then
                         write(f,recbook);
                   end
                else write(f,recbook);{for codes book that are<>cod  save in the f file}
             end;{while}
          close(bookfile);
          close(f);
          erase(bookfile);
          rename(f,'d:\enterbook');
          if flag=false then
          begin
          {   writeln('<<<not find>>>');
          write('for exit press s else press other key:');  }
          tbar(20,280,200,320);
          outtextxy(30,300,'book not find');
          end;
          outtextxy(30,455,'for exit press s else press other key:');
         { gotoxy( , );}
          readln(code);
       end;{while}
end;
{****************************************************************}
procedure  showbooks(recbook:rec1);
var        codep,writerp,poblisherp,subjectp,shabkp,motarjemp:array[1..100]of string[10];
           i,num,n,w,t,nombook:integer;
           code,r:char;
           flag:boolean;
 begin
    assign(bookfile,'d:\enterbook');
    reset(bookfile);
    i:=1;
    w:=20;
    write('numb  bookname   writer   motarjem     code');
    writeln('subject   amanatcode  rescode');
    writeln('__________________________________________________________________');
    while not eof(bookfile) do
       begin
           read(bookfile,recbook);
           with recbook do
           begin
           codep[i]:=codebook;
           writerp[i]:=writer;
           poblisherp[i]:=poblisher;
           subjectp[i]:=subject;
           shabkp[i]:=shabk;
           motarjemp[i]:=motarjem;
           end;{with}

           with recbook do
             begin
                 writeln((i):3,bookname:8,writer:15,motarjem:15,code:5,subject:8,amanatcode:1,rescode:6);

                 if (i mod 20 =0)or(i=numbook1) then
                     begin
                       n:=n+1;

                         writeln('for show for a special book press a:');
                         readln(r);
                         while r='a' do
                         begin
                               write('enter number  of above:');
                               readln(num);
                               writeln('codebook is :',codep[num]);
                               writeln('writer is:',writerp[num]);
                               writeln('poblisher is:',poblisherp[num]);
                               writeln('subject is:',subjectp[num]);
                               writeln('shabk is :',shabkp[num]);
                               writeln('motarjem is:',motarjemp[num]);
                               writeln('for show for a special book press a:');
                            readln(r);
                           end;


                  writeln('for continue enter');
                  readln;
                      write('bookname   writer    motarjem    code');
                      writeln('subject    amanatcode  rescode');
                      writeln('__________________________________________________________________');
                   end;{if}

             end;{with}
             i:=i+1;
       end;{while 1}
       readln;
end;
{**************************************************************************}
procedure amanatbook(recbook:rec1;stdrec:rec2);
var       code:char;
          idstu,codebok:string;
          f,ff,flag,find:boolean;
          d:byte;
          t,s,o:integer;
          f1:recfile1;
          f2:recfile2;
begin
    {initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
   setbkcolor(lightblue);
   setcolor(blue);
   setfillstyle(solidfill,white);
   assign(bookfile,'d:\enterbook');
   assign(stdfile,'d:\enterstd');
   assign(f1,'d:\temp1.dat');
   assign(f2,'d:\temp2.dat');
   tbar(100,60,400,80);
tbar(450,60,550,80);
outtextxy(110,65,'for exit press s else other key');
   readln(code);
   while code<>'s' do
     begin
   reset(bookfile);
   reset(stdfile);
   rewrite(f1);
   rewrite(f2);
{   write('for exit:s  else:other key:');     }

     {   writeln('1: amanat');
        writeln('2: tahvil');  }
        tbar(200,100,400,120);
        tbar(200,130,400,150);
        outtextxy(250,105,'1:borrow');
        outtextxy(250,135,'2:give back');
        readln(code);
      {  write('for amanat or tahvil enter code book:');   }
      tbar(450,170,550,190);
      outtextxy(101,175,'for borrow or give back enter code book');
        readln(codebok);
        flag:=false;
        while not eof(bookfile)  do
          begin
           read(bookfile,recbook);
           write(f1,recbook);
           write(f2,stdrec);
             if codebok=recbook.codebook then
             begin
             case code of {***  ***  ***  ***  ***  ***}
              '1':begin
                  if recbook.amanatcode=0  then
                     begin {@}
                       { write('enter year and month and day for today:');   }
                       tbar(100,200,400,220);
                       tbar(450,200,550,220);
                       outtextxy(110,205,'enter year and month day for today');
                        readln(recbook.yeart,recbook.montht,recbook.dayt);
                        recbook.rescode:=1;
                        if (recbook.rescode=1)  and (recbook.dayt-recbook.dayoo<3) then
                            for l:=1 to 10 do
                            begin
                            outtextxy(150,235,'list student');
                            tbar(100,250,500,280);
                            line(140,250,140,280);
                            line(180,250,180,280);
                            line(220,250,220,280);
                            line(260,250,260,280);
                            line(300,250,300,280);
                            line(340,250,340,280);
                            line(380,250,380,280);
                            line(420,250,420,280);
                            line(460,250,460,280);
                            outtextxy(105+o,260,recbook.resgeer[l]);
                            o:=o+40;
                            end;
              {((*))}    {  write(recbook.resgeer[l],'   ');{for see id students that reserved this book}
                      {  write('for amanat enter id student:');   }
                      tbar(100,300,400,320);
                      tbar(450,300,550,320);
                      outtextxy(110,305,'for borrow enter id student');

                        readln(idstu);
                        find:=false;
                        while  not eof(stdfile) do
                          begin  {**}
                             read(stdfile,stdrec);
                             if stdrec.id=idstu then
                               begin
                                  f:=false;
                                  if (stdrec.condition=0) then      {because std wasn't forbid}
                                    begin {*}
                                       if (stdrec.borbook1='nothing') then
                                         begin
                                            stdrec.borbook1:=codebok;
                                            f:=true;
                                         end
                                       else if (stdrec.borbook2='nothing')and (f=false) then
                                         begin
                                            stdrec.borbook2:=codebok;
                                            f:=true;
                                         end
                                       else if (stdrec.borbook3='nothing')and (f=false) then
                                         begin
                                            stdrec.borbook3:=codebok;
                                            f:=true;
                                         end
                                       else if (f=false) then
                                       begin
                                       tbar(200,340,500,360);
                                       outtextxy(250,345,'capacity is full');
                                       end;
                                      { writeln('<<capacity is full>>');   }
                                       if (f=true) then
                                         begin
                                           recbook.amanatcode:=1;
                                          { write('enter history that should give up book:');   }

                                          tbar(450,340,550,360);
                                          outtextxy(101,345,'enter history that should give back book');
                                           read(recbook.yearo);
                                 {          write('/');  }
                                           read(recbook.montho);
                                          { write('/');    }
                                           readln(recbook.dayo);
                                           write(f1,recbook);
                                           write(f2,stdrec);
                                         end;
                                    end{*}
                                  else
                                  begin
                                  tbar(200,340,500,360);
                                  outtextxy(250,345,'student cann''t give book');
                                  end;
                                {  writeln('<<student cann''t  give book>>');   }
                                  find:=true;
                               end;{if}
                                    write(f1,recbook);
                                           write(f2,stdrec);
                          end;{while}  {**}
                        if find=false then
                        begin
                        tbar(200,340,500,360);
                        outtextxy(250,345,'student not find');
                        end;
                        {   writeln('<<<student not find>>>'); }
                    end{if}  {@}
                  else  {writeln('book is amanat');  }
                  begin
                  tbar(200,340,500,360);
                  outtextxy(250,345,'book is borrow');
                  end;
                  write(f1,recbook);
                  write(f2,stdrec);
                 end;{1}
              '2':begin
                  recbook.amanatcode:=0;
                  ff:=false;
                  while not eof(stdfile) do
                    begin
                       read(stdfile,stdrec);
                       if (stdrec.borbook1=codebok)or(stdrec.borbook2=codebok)or(stdrec.borbook3=codebok)then
                         begin
                            if  (stdrec.borbook1=codebok)  then
                              begin
                                ff:=true;
                                stdrec.borbook1:='nothing';
                              end
                            else if (stdrec.borbook2=codebok) then
                              begin
                                ff:=true;
                                stdrec.borbook2:='nothing';
                              end
                            else if (stdrec.borbook3=codebok)   then
                              begin
                                ff:=true;
                                stdrec.borbook3:='nothing';
                              end;
                            {write('enter history given up book:');  }
                            tbar(100,250,400,270);
                            tbar(450,250,550,270);
                            outtextxy(110,255,'enter history give back book');
                            readln(recbook.yearoo,recbook.monthoo,recbook.dayoo); {history that student give up book}
                            with recbook do
                            begin
                            if monthoo<=6 then
                            begin

                            t:=(yearoo*365)+(monthoo*31)+(dayoo);
                            s:=(yearo*365)+(montho*31)+(dayo);
                            end;
                            if monthoo>6 then
                            begin
                            t:=(yearoo*365)+(monthoo*30)+(dayoo);
                            s:=(yearo*365)+(montho*30)+(dayo);
                            end;
                            end;
                            stdrec.takhir:=stdrec.takhir+(t-s);
                            if stdrec.takhir>=30 then
                            stdrec.condition:=1;
                            write(f2,stdrec);
                            write(f1,recbook);
                   {      writeln('the info are entered');   }
                   tbar(200,300,500,320);
                   outtextxy(250,305,'the info are entered');
                   write(f1,recbook);
                   write(f2,stdrec);
                         end;{if}
                    end;{while}
                 end;{2}
             end;{case}      {***  ***  ***  ***  ***}
               flag:=true;
               end;
               write(f1,recbook);
               write(f2,stdrec);
          end;{while}
       { writeln('for exit:s  else:other key:');      }


     end;{if}
     write(f1,recbook);
     write(f2,stdrec);
             tbar(100,380,400,400);
       outtextxy(110,385,'for exit press s else other key');
       tbar(450,380,550,400);
        readln(code);
   close(bookfile);
   close(stdfile);
   erase(stdfile);
   erase(bookfile);
   rename(f1,'d:\enterbook');
   rename(f2,'d:\enterstd');

end;
{*********************************************************************}
begin
driver:=detect;
mode:=1;
initgraph(driver,mode,'d:\bp\bgi');

assign(stdfile,'d:\enterstd');
assign(bookfile,'d:\enterbook');
{$I-}
numbook1:=0;
numstd1:=0;
reset(bookfile);
if ioresult<>0 then
begin
writeln('book file not exist!!!');
enterbook(recbook);
end;
reset(stdfile);
if ioresult<>0 then
begin
writeln('student file not exist!!!');
enterstd(stdrec);
end;
numbook1:=filesize(bookfile);
numstd1:=filesize(stdfile);
close(stdfile);
close(bookfile);
{closegraph;
initgraph(driver,mode,'d:\bp\bgi');}cleardevice;
setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,3);
{outtextxy(50,30,'<<WELCOME To LIBRARY>>');}
setcolor(8);
outtextxy(80,30,'WELCOME To LIBRARY');
setcolor(1);
outtextxy(78,28,'WELCOME To LIBRARY');
outtextxy(2,60,'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
SETTEXTSTYLE(sansseriffont,horizdir,3);
outtextxy(265,430,'ESC:EXIT');
settextstyle(sansseriffont,horizdir,4);
outtextxy(150,150,'choose a menu Item:');
setfillstyle(solidfill,white);
settextstyle(defaultfont,horizdir,1);
setcolor(blUE);
tbar(20,230,120,300);
outtextxy(25,250,'a:enter');
outtextxy(25,270,'members');
tbar(140,230,240,300);
outtextxy(145,250,'b:enter');
outtextxy(145,270,'books');
tbar(260,230,360,300);
outtextxy(265,250,'c:search');
outtextxy(265,270,'student');
tbar(380,230,480,300);
outtextxy(385,250,'d:search');
outtextxy(385,270,'book');
tbar(500,230,600,300);
outtextxy(505,250,'e:show');
outtextxy(505,270,'books');
tbar(20,310,120,380);
outtextxy(25,330,'f:show');
outtextxy(25,350,'students');
tbar(140,310,240,380);
outtextxy(145,330,'g:edit');
outtextxy(145,350,'book');
tbar(260,310,360,380);
outtextxy(265,330,'h:edit');
outtextxy(265,350,'student');
tbar(380,310,480,380);
outtextxy(385,330,'I:delete');
outtextxy(385,350,'student');
tbar(500,310,600,380);
outtextxy(505,330,'j:delete');
outtextxy(505,350,'book');
tbar(20,390,122,460);
outtextxy(21,410,'k:reserve');
outtextxy(25,430,'book');
tbar(500,390,600,460);
outtextxy(505,410,'m:borrow');
outtextxy(505,430,'book');


key:=readkey;
while ord(key)<>27 do
begin
case key of
a,A:begin
{closegraph;}cleardevice;
enterstd(stdrec);
end;
b,B:begin
{closegraph;}cleardevice;
enterbook(recbook);
end;
c,C:begin
{closegraph;}cleardevice;
searchstd(stdrec);
end;
d,D:begin
{closegraph;}cleardevice;
searchbook(recbook);
end;
e,E:begin
{closegraph;}cleardevice;
showbooks(recbook);
end;
f,F:begin
{closegraph;}cleardevice;
reportstd(stdnumm);
end;
g,G:begin
{closegraph;}cleardevice;
editbook(recbook);
end;
h,H:begin
{closegraph;}cleardevice;
editstd(stdrec);
end;
i,I:begin
{closegraph;}cleardevice;
deletestd(stdrec,numstd1);
end;
j,J:begin
{closegraph;}cleardevice;
deletebook(recbook,numbook1);
end;
k,K:begin
{closegraph;}cleardevice;
reserved(recbook);
end;
m,M:begin
{closegraph;}cleardevice;
amanatbook(recbook,stdrec);
end;
end;{case}
{closegraph;}cleardevice;
{initgraph(driver,mode,'d:\bp\bgi');}
setbkcolor(lightblue);
setcolor(blue);
settextstyle(defaultfont,horizdir,3);
setcolor(8);
outtextxy(80,30,'WELCOME To LIBRARY');
setcolor(1);
outtextxy(78,28,'WELCOME To LIBRARY');
outtextxy(2,60,'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
SETTEXTSTYLE(sansseriffont,horizdir,3);
outtextxy(265,430,'ESC:EXIT');
settextstyle(sansseriffont,horizdir,4);
outtextxy(150,150,'choose a menu Item:');
setfillstyle(solidfill,white);
settextstyle(defaultfont,horizdir,1);
setcolor(blUE);
tbar(20,230,120,300);
outtextxy(25,250,'a:enter');
outtextxy(25,270,'members');
tbar(140,230,240,300);
outtextxy(145,250,'b:enter');
outtextxy(145,270,'books');
tbar(260,230,360,300);
outtextxy(265,250,'c:search');
outtextxy(265,270,'student');
tbar(380,230,480,300);
outtextxy(385,250,'d:search');
outtextxy(385,270,'book');
tbar(500,230,600,300);
outtextxy(505,250,'e:show');
outtextxy(505,270,'books');
tbar(20,310,120,380);
outtextxy(25,330,'f:show');
outtextxy(25,350,'students');
tbar(140,310,240,380);
outtextxy(145,330,'g:edit');
outtextxy(145,350,'book');
tbar(260,310,360,380);
outtextxy(265,330,'h:edit');
outtextxy(265,350,'student');
tbar(380,310,480,380);
outtextxy(385,330,'I:delete');
outtextxy(385,350,'student');
tbar(500,310,600,380);
outtextxy(505,330,'j:delete');
outtextxy(505,350,'book');
tbar(20,390,122,460);
outtextxy(21,410,'k:reserve');
outtextxy(25,430,'book');
tbar(500,390,600,460);
outtextxy(505,410,'m:borrow');
outtextxy(505,430,'book');

key:=readkey;
end;{while}
closegraph;
end.



{assign(stdfile,'d:\enterstd');
  assign(bookfile,'d:\enterbook');
  reset(bookfile);
  reset(stdfile);
  while not eof(bookfile) do
  begin
  read(bookfile,recbook);
  numbook1:=filepos(bookfile);
  end;
  while not eof(stdfile) do
  begin
  read(stdfile,stdrec);
  numstd1:=filepos(stdfile);
  end;
  close(stdfile);
  close(bookfile); }
{repeat
writeln('pay attention to this menu:');
writeln('1:enter member');
writeln('2:enter book');
writeln('3:search student');
writeln('4:search book   ');
writeln('5:show  books according to subject');
writeln('6:show  students according to name');
writeln('7:edit book');
writeln('8:edit student');
writeln('9:delete student');
writeln('10:delete book');
writeln('11:reserve book');
writeln('12:amanat  book');
writeln('13:show books');
writeln('according to up enter choice:');
readln(choice);
case choice of
1:enterstd(stdrec);
2:enterbook(recbook);
3:searchstd(stdrec);
4:searchbook(recbook);
5:showbooksub(recbook);
6:reportstd(stdnumm);
7:editbook(recbook);
8:editstd(stdrec);
9:deletestd(stdrec);
10:deletebook(recbook);
11:reserved(recbook);
12:amanatbook(recbook,stdrec);
13:showbooks(recbook);
end;
until choice=13;
end.}