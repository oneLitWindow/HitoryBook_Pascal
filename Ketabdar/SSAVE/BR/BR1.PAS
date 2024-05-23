program Breakout1;
uses Screen, Count, Bricks, Bounds, Walls, nCrt, Dos, mouse;
const mmv:boolean=false;
      gtox:integer=1;
      gtoy:integer=1;

var
  ss	    : SaveScreen;
  w	    : Wall;
  b	    : Ball;
  p	    : Paddle;
  Speed     : LimitCounter;
  Left	    : LeftBound;
  Top	    : UpperBound;
  Right     : RightBound;
  Bottom    : LowerBound;
  Obstacles : ObstacleList;
  PaddleMsg,
  SpeedMsg,
  StartMsg,
  QuitMsg,
  PauseMsg1,
  PauseMsg2,
  TypeMsg   : TextString;
  Score     : Counter;
  Highest   : Counter;
  Balls     : DownCounter;
  X	    : Integer;
  Finished  : Boolean;
  FirstGame : Boolean;
  TypeInc,
  ch	    : Char;

procedure Startup;
begin
  { First set up the screen and the cursor }
  ss.Init;
  TextBackground(BLACK);
  ClrScr;

  { Create the boundaries of the playfield }
  Left.Init(0, 0, 27, False);
  Top.Init(0, 0, 82, False);
  Right.Init(81, 0, 27, False);
  Bottom.Init(0, 24, 82, True);

  { Initialize the score displays }
  Score.Init(0, 65, 24, 'Score', 15);
  Score.Show;
  Highest.Init(0, 60, 25, 'High Score', 14);
  Highest.Show;

  { Set up the various menu messages }
  PauseMsg1.Init(31, 18, '', 15);
  PauseMsg2.Init(31, 19, '', 15);
  SpeedMsg.Init(5, 23,	'', 14);
  StartMsg.Init(5, 24,	'', 14);
  PaddleMsg.Init(5, 24, 'Press any key', 14);
  PaddleMsg.show;
  QuitMsg.Init(5, 25, 'To exit Ketabdar Screen Saver', 14);
  QuitMsg.Show;

  { Set up the information messages }
  Balls.Init(5, 40, 24, -1, 'Balls', 15);
  Balls.Show;
  Speed.Init(1, 40, 25, 1, 10, 'Speed', 14);
  Speed.Show;

  { Build the wall }
  w.Init(1, 1, 16, 10);
  w.Show;

  { Need to initialize these, even though we're going to move them later }
  b.Init(10, 22, 1, -1, YELLOW);
  p.Init(8, 23, WHITE);

  { Put the various obstacles into a list.  We don't really need
    to do this, but it makes changing things around much easier }
  Obstacles.Init;
  Obstacles.Append(@p);
  Obstacles.Append(@w);
  Obstacles.Append(@Left);
  Obstacles.Append(@Top);
  Obstacles.Append(@Right);
  Obstacles.Append(@Bottom);

  TypeMsg.Init(22, 12, 'Increase typematic rate? (y/n) ', WHITE);
  TypeMsg.Show;
  repeat
    TypeInc := UpCase('N');
  until (TypeInc = 'Y') or (TypeInc = 'N');
  TypeMsg.Hide;

  if TypeInc = 'Y' then
    ss.Speedup;

  ss.SetCursor($2000);
  Randomize;
  FirstGame := True;
end;

procedure NewGame;
begin
  Balls.Reset;
  {Score.Reset;}
  if not FirstGame then
    w.Reset;
  X := Random(78) + 3;
  b.MoveTo(X, 22);
  p.MoveTo(X-2, 23);
  b.Show;
  p.Show;
{  Balls.Decrement;}
  FirstGame := False;
end;

{ This procedure handles keystrokes between games.
  It returns False if the user presses ESC, otherwise it returns True. }
function MainMenu : Boolean;
var
  Done : Boolean;
begin
  MainMenu := True;
  Done := False;
  SpeedMsg.Show;
  StartMsg.Show;
  while not Done do
  begin
{    ch := ReadKey;}
     { Balls.Init(5, 40, 24, -1, 'Balls', 15);}

    case ch of
      Chr(27) :
	begin
       readmouse;
       if (port[$60]<134) or (GetMx(MouseX)<>gtox) or (GetMy(Mousey)<>gtoy) or (mouseclick) or (keypressed) then mmv:=true;
    if mmv then finished:=true;
  repeat
    if keypressed then readkey;
  until not keypressed;

	  MainMenu := False;
	  Done := True;
	end;
      #13 : Done := True;
      #0  :
	begin
{	   ch := ReadKey;}
	    Speed.Increment;
	    Speed.Increment;
	    Speed.Increment;
	    Speed.Increment;
	  ch:=#13;
readmouse;
if (port[$60]<134) or (GetMx(MouseX)<>gtox) or (GetMy(Mousey)<>gtoy) or (mouseclick) then mmv:=true;

	  if (keypressed) or (mmv) then ch:=#27;
	  if Ord(ch) = 72 then
	    Speed.Increment
	  else if Ord(ch) = 80 then
	    Speed.Decrement;
	end;
      end;
  end;
  SpeedMsg.Hide;
  StartMsg.Hide;
end;

{ This procedure handles keystrokes while the game is in progress }
procedure ProcessKeyStroke;

{ Pause the game }
procedure Pause;
begin
{  PauseMsg1.Show;
  PauseMsg2.Show;}
{  PauseMsg1.Hide;
  PauseMsg2.Hide;}
  b.Show;
end;

begin
  ch := #0{ReadKey};
    readmouse;
    if (port[$60]<134) or (GetMx(MouseX)<>gtox) or (GetMy(Mousey)<>gtoy) or (mouseclick) or (keypressed) then mmv:=true;

    if mmv then finished:=true;

  case ch of
    Chr(27) : Finished := True;
    Chr(0)    :
      begin
{	 ch := ReadKey;}
{$IFNDEF Test}
	  p.MoveTo(b.GetX - 1, p.GetY);  { Left Arrow }
	case Ord(ch) of
	  75: p.MoveTo(p.GetX - 1, p.GetY);  { Left Arrow }
	  77: p.MoveTo(p.GetX + 1, p.GetY);  { Right Arrow }
	else
	  Pause;
	end;
{$ELSE}
	Pause;
{$ENDIF}
      end
    else
      Pause;
  end;
end;

{ This procedure checks for collisions with any of the obstacles
  and updates the screen accordingly. }
procedure Update;
var
  Offset : Integer;
begin
  if Obstacles.CheckCollisions(b, Score) then
  begin
    b.MoveY;
    p.MoveTo(b.GetX - 2, p.GetY);
{    sound(150);
    Delay(100);
    nosound;   }
	  Score.Init(score.getvalue div 2, 65, 24, 'Score', random(15)+1);
  Score.Show;
  Highest.Init(highest.getvalue, 60, 25, 'High Score', random(15)+1);
  Highest.Show;
    Balls.Decrement;
   if balls.value <1 then Balls.Init(5, 40, 24, -1, 'Balls', random(15)+1);
   if not balls.last then Balls.Init(balls.value, 40, 24, -1, 'Balls', random(15)+1);
  Balls.Show;
  Speed.Init(5, 40, 25, 1, 10, 'Speed', random(15)+1);
  Speed.Show;
  PaddleMsg.Init(5, 24, 'Press any key', random(15)+1);
  PaddleMsg.show;
  QuitMsg.Init(5, 25, 'To exit Ketabdar Screen Saver', random(15)+1);
  QuitMsg.Show;

{    while KeyPressed do
      ch := ReadKey;}
  end;

  b.MoveX;
  b.MoveY;

{$IFDEF Test}
  p.MoveTo(b.NextX -2, p.GetY);
{$ENDIF}
end;

{ This procedure cleans up when we're exiting from the program }
procedure ShutDown;
begin
 b.Hide;
 Obstacles.Hide;
 Balls.Hide;
 Score.Hide;

 Obstacles.Done;

 ss.Restore;
 if TypeInc = 'Y' then
   ss.Slowdown;
 ClrScr;
end;

{ This procedure plays a game.	The main loop allows up to ten keystrokes,
 then moves the ball and checks for collisions }
procedure Play;
var
 KeyLoops : Integer;
begin
 NewGame;
{$IFNDEF Test}
  PaddleMsg.Show;
{$ENDIF}
  Finished := False;
  KeyLoops := 0;
  repeat
{    if KeyPressed then}
      ProcessKeyStroke;
    Inc(KeyLoops);
    if (KeyLoops = 10) and not Finished then
    begin
      KeyLoops := 0;
      UpDate;
    end;
if Score.GetValue>Highest.getValue then  Highest.SetValue(Score.GetValue);

    Delay(5); {- Speed.GetValue);}
  until Finished or Balls.Last;
  {PaddleMsg.Hide;}
end;

begin
  Startup;
  initmouse;
{  showmouse;}
  randomize;
   SetMousePosition(PutMx(MaxCrtX shr 1),PutMy(MaxCrtY shr 1));
   readmouse;
   {if (GetMx(MouseX)<>gtox) or (GetMy(Mousey)<>gtoy) or (mouseclick) then mmv:=true;}
   gtox:=GetMx(MouseX);
   gtoy:=GetMy(Mousey);
  while MainMenu do
  begin
    Play;
    Balls.Reset;
    b.Hide;
    p.Hide;
    if Score.GetValue > Highest.GetValue then Highest.SetValue(Score.GetValue);
  end;
  ShutDown;
while keypressed do
readkey;
end.
