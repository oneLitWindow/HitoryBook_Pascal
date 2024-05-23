{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
uses brss,arss,sass,kintro,mousedrv,dos,ncrt,easyer,ketabsup,screen;
{ss.SetCursor($2000)  > Empty   ;
 ss.SetCursor(3470)   > Normal  ;
 ss.SetCursor(8)      > Full   ;}

var
  ss: SaveScreen;
  m,i,j,k:integer;
  c:char;
namo,name,s:string;
english:boolean;
begin
{while keypressed do readkey;
arstart;{
while keypressed do readkey;
sastart;
while keypressed do readkey;
{ $ M  $ 8000,4000,4000 }
{Exec('farsi.com','');
{ $ M  $ 8000,0,320000 }
{brstart;}
while keypressed do readkey;
sound (1000);
delay (50);
sound (2000);
delay (50);
sound (3000);
delay (50);
sound (4000);
delay (50);
sound (5000);
delay (50);
sound (8000);
delay (50);
nosound;
intro;
sound (2000);
delay (100);
sound (3000);
delay (100);
sound (4000);
delay (100);
nosound;
  checkbreak:=false;
  textbackground(0);
  clrscr;
  Port[$60] := $F3;
  delay(50);
  Port[$60] := 0;
  ss.SetCursor(8);
{$M $8000,4000,4000 }
Exec('farsi.com','');
{$M $8000,0,320000 }
bgmouse;
movemousecursor(640,480);
while keypressed do readkey;
ketabdar;
while keypressed do readkey;
end.
{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
