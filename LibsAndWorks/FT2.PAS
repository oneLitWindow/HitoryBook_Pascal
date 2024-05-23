program mark1;
uses ncrt;
var x:real;
begin
  clrscr;
  write('enter a mark : ');
  repeat
     read(x);
   if (x>=0) and (x<=100) then write('here is the range of this mark : ');
   if( x<=100) and( x>80)
     then writeln('A')
    else  if( x<=80) and( x>60 )
     then writeln('B')
    else  if( x<=60) and( x>40)
     then writeln ('C')
    else  if( x<=40) and( x>20)
     then writeln ('D')
    else  if( x<=20) and( x>=0 )
     then writeln('E')
    else
      writeln('invalid number');
      writeln;
      write('if you want to know the range of another mark,please enter another mark : ');
  until readkey=#27
end.