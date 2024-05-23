uses graph,ncrt;
var i,j:integer;
procedure PutImagePlay;
{ Demonstrate the GetImage and PutImage commands }

const
  r  = 20;
  StartX = 100;
  StartY = 50;

var
  CurPort : ViewPortType;
  ss,dd,ss1,dd1:integer;
  myr,myg,myb,myrp,mygp,mybp:array[1..15] of integer;
procedure MoveSaucer(var X, Y : integer; Width, Height : integer);
var
  Step : integer;
ss1:integer;
begin
step:=1-random(3);
if x>ss then  Step :=-(Random(3)+1);
if x<ss then  Step := (Random(3)+1);
  X := X + Step;
step:=1-random(3);
if y>dd then  Step :=-(Random(3)+1);
if y<dd then  Step := (Random(3)+1);
  Y := Y + Step;
if (abs(x-ss)<25) and (abs(y-dd)<20) then
begin;setcolor (0);circle (ss+20,dd+10,2);ss:=random(getmaxx-20);dd:=random(getmaxy-20);end;
setcolor (10);
circle (ss+20,dd+10,2);

  { Make saucer bounce off viewport walls }
  with CurPort do
  begin
    if (x1 + X + Width - 1 > x2) then
      X := x2-x1 - Width + 1
    else
      if (X < 0) then
        X := 0;
    if (y1 + Y + Height - 1 > y2) then
      Y := y2-y1 - Height + 1
    else
      if (Y < 0) then
        Y := 0;
  end;
end; { MoveSaucer }

var
  Pausetime : word;
  Saucer    : pointer;
  X, Y      : integer;
  ulx, uly  : word;
  lrx, lry  : word;
  Size      : word;
  I         : word;
begin
  ClearDevice;

  { PaintScreen }
  ClearDevice;
  GetViewSettings(CurPort);

  { DrawSaucer }
  setrgbpalette (104,63,63,0);
  setrgbpalette (101,0,63,63);
  setrgbpalette (102,63,00,0);
  setcolor (104);
  Ellipse(StartX, StartY, 0, 360, r, (r div 3)+2);
  Ellipse(StartX, StartY-4, 190, 357, r, r div 3);
  setcolor (101);
  Line(StartX+7, StartY-6, StartX+10, StartY-12);
  Circle(StartX+10, StartY-12, 2);
  Line(StartX-7, StartY-6, StartX-10, StartY-12);
  Circle(StartX-10, StartY-12, 2);
  SetFillStyle(9, 102);
  FloodFill(StartX+1, StartY+4, 104);
  { ReadSaucerImage }
  ulx := StartX-(r+1);
  uly := StartY-14;
  lrx := StartX+(r+1);
  lry := StartY+(r div 3)+3;
  Size := ImageSize(ulx, uly, lrx, lry);
  GetMem(Saucer, Size);
  GetImage(ulx, uly, lrx, lry, Saucer^);
    setfillstyle (1,0);
      bar(ulX-1, ulY-1, ulx+41,uly+22);                 { erase image }


  { Plot some "stars" }
  for I := 1 to 1000 do
    PutPixel(Random(getMaxX-10)+6, Random(getMaxY-10)+6, Random(15)+1);
  X := getMaxX div 2;
  Y := getMaxY div 2;
  PauseTime := 70;
for ss1:=1 to 15 do begin
myr[ss1]:=random(63);
myg[ss1]:=random(63);
myb[ss1]:=random(63);
myrp[ss1]:=1-random(3);
mygp[ss1]:=1-random(3);
mybp[ss1]:=1-random(3);
end;
  { Move the saucer around }
  ss:=x;
  dd:=y;
  setrgbpalette (104,63,63,0);
  setrgbpalette (101,0,63,63);
  setrgbpalette (102,63,00,0);

  repeat
    PutImage(X, Y, Saucer^, XORput);                 { draw image }
for ss1:=1 to 15 do begin
myr[ss1]:=myr[ss1]+myrp[ss1];
myg[ss1]:=myg[ss1]+mygp[ss1];
myb[ss1]:=myb[ss1]+mybp[ss1];
if myr[ss1]<=02 then myrp[ss1]:=+1;
if myr[ss1]>=61 then myrp[ss1]:=-1;
if myg[ss1]<=02 then mygp[ss1]:=+1;
if myg[ss1]>=61 then mygp[ss1]:=-1;
if myb[ss1]<=02 then mybp[ss1]:=+1;
if myb[ss1]>=61 then mybp[ss1]:=-1;
setrgbpalette (ss1,myr[ss1],myg[ss1],myb[ss1]);
end;

    Delay(PauseTime);
{    PutImage(X, Y, Saucer^, xorput);                 { erase image }
    setfillstyle (1,0);
    bar(X-1, Y-1, x+41,y+22);                 { erase image}
for ss1:=1 to 10 do
putpixel (random(42)+x,random(23)+y,random(15)+1);
    MoveSaucer(X, Y, lrx - ulx + 1, lry - uly + 1);  { width/height }

  until KeyPressed;
  FreeMem(Saucer, size);
end; { PutImagePlay }
begin
  i:=installuserdriver('svga256',nil);
  j:=2;
  InitGraph(i, j, 'e:\compiler\bp\bgi');
randomize;
  PutImagePlay;
end.