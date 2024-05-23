unit MouseDrv;

interface

const
  mpLeftButton  = $01;
  mpRightButton = $02;
  mpBothButtons = mpLeftButton + mpRightButton;

function InitMouse: Boolean;
procedure ShowMouse;
procedure HideMouse;
function MouseButtons: Word;
function MouseX: Word;
function MouseY: Word;
function LeftButtonPressed: Boolean;
function RightButtonPressed: Boolean;
function BothButtonsPressed: Boolean;
procedure MoveMouseCursor(X, Y: Word);
procedure MouseXY ( X, Y : Word) ;
procedure ResetMouse ;

implementation
uses graph,ncrt;
function InitMouse: Boolean; assembler;
asm
  XOR AX, AX
  INT 33h
  LAHF
end;

procedure ResetMouse ;
begin
	MoveMouseCursor(1,1);
     asm
     	MOV AX, 5
          MOV BX, 1
		INT 33H
          XOR BX,BX
          INT 33H
     end;
	ShowMouse ;
end;

procedure ShowMouse; assembler;
asm
  MOV AX, 1
  INT 33h
end;

procedure HideMouse; assembler;
asm
  MOV AX, 2
  INT 33h
end;

function MouseButtons: Word; assembler;
asm
  MOV AX, 3
  INT 33h
  MOV AX, BX
end;

function MouseX: Word; assembler;
asm
  MOV AX, 3
  INT 33h
  MOV AX, CX
end;

function MouseY: Word; assembler;
asm
  MOV AX, 3
  INT 33h
  MOV AX, DX
end;
function GetLButtonStatus : Word; assembler;
asm
  MOV AX,5
  XOR BX,BX
  INT 33H
  MOV AX,BX
end;

function GetRButtonStatus : Word; assembler;
asm
  MOV AX,5
  MOV BX,1
  INT 33H
  MOV AX,BX
end;

function LeftButtonPressed: Boolean;
begin
  LeftButtonPressed := (GetLButtonStatus>0);
end;

function RightButtonPressed: Boolean;
begin
  RightButtonPressed := (GetRButtonStatus>0);
end;

function BothButtonsPressed: Boolean;
begin
  BothButtonsPressed := MouseButtons = mpBothButtons;
end;

procedure MoveMouseCursor(X, Y : Word); assembler;
asm
  MOV AX, 4
  MOV CX, X
  MOV DX, Y
  INT 33h
end;

procedure MouseXY ( X, Y : Word) ;
var
	S1,S2:string;
	lx,ly:word;
begin
	SetTextStyle ( TriplexFont, HorizDir, 1);
     SetTextJustify(LeftText, CenterText) ;
     SetFillStyle ( 1, 0) ;
     ShowMouse;
     repeat
          if (not LeftButtonPressed) or ((Lx=MouseX) and (Ly=MouseY)) then
               begin
               Delay (100) ;
          	Continue ;
               end;
          Lx := MouseX ;
          Ly := MouseY ;
		Bar( X, Y-10, X+110, Y+20) ;
     	Str(MouseX:4, S1) ;
     	Str(MouseY:4, S2) ;
		OutTextXY( X, Y, S1 + ',' + S2) ;
     until KeyPressed ;
	ReadKey ;
end;
begin
end.
