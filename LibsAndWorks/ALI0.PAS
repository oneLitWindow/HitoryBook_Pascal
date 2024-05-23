uses ncrt,screen;
   var i,io:integer;
       c:char;
       arrow:boolean;
       ss:cursor;
begin
     ss.init;
     ss.setcursor($2000);
     i:=1;
     io:=0;
     textbackground(0);
     clrscr;
     repeat
     if io<>i then begin
     textcolor(15);
     textbackground(1);
     gotoxy(31,11);
     writeln(' Enter to program 1 ');
     gotoxy(31,12);
     writeln(' Enter to program 2 ');
     gotoxy(31,13);
     writeln(' Enter to program 3 ');
     gotoxy(31,14);
     writeln(' Enter to program 4 ');
     gotoxy(31,15);
     writeln(' Enter to program 5 ');
     gotoxy(31,i+10);
     textcolor(14);
     textbackground(4);
     write(' Enter to program ',i,' ');
     io:=i;
     end;
     c:=#2;
     if keypressed then c:=readkey;
     if c=#0 then begin arrow:=true; c:=readkey; end;
     if (arrow) and (c=#72) then i:=i-1;
     if (arrow) and (c=#80) then i:=i+1;
     if i<1 then i:=5;
     if i>5 then i:=1;
     until c=#27;
end.