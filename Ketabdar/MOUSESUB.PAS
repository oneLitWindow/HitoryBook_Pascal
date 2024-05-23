
{ This is the MOUSESUB.PAS include file for the MOUSE.PAS unit. }
{ It contains various special mouse routines used by the Mouse unit. }

{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{Special inline functions used by the Mouse unit}

{---------------------------------------------------------------------------}
{ an inline function to limit an integer between min and max values}
function IntLimit(Val,Min,Max:Integer):Integer;
Inline(
   $58	      {  pop AX}
  /$5B	      {  pop BX}
  /$59	      {  pop CX}
  /$39/$C8    {  cmp AX,CX}
  /$7C/$08    {  jl done}
  /$89/$D8    {  mov AX,BX}
  /$39/$C8    {  cmp AX,CX}
  /$7F/$02    {  jg done}
  /$89/$C8);  {  mov AX,CX}
	      {done:}


{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{ The following procedures use the mouse functions to provide }
{ a higher level of control over the mouse }

{---------------------------------------------------------------------------}
{ Normalizes a mouse X position to standard position info }

function GetMx(X:Integer):Integer;
begin
   case CrtMode of
     0,1 : begin
	     if MaxCrtX < 64 then
		MouseTemp := (X shr 1) div MouseTextWidth      {320x200 text}
	     else
		MouseTemp := X div MouseTextWidth;	       {???x??? text}
	   end;
     2,3 : MouseTemp := X div MouseTextWidth;		       {640x200 text}
     4,5 : begin
	     if HercGraphMouse then
	       MouseTemp := X			      {720x348 herc graphics}
	     else
	       MouseTemp := X shr 1;			   {320x200 graphics}
	   end;
     6	 : MouseTemp := X;				   {640x200 graphics}
     7	 : MouseTemp := X div MouseTextWidth;		       {640x??? text}
     $D,$13 : MouseTemp := X shr 1;			   {320x200 graphics}
   else
     MouseTemp := X;					   {640x??? graphics}
   end;

   if ZeroMouse then
     GetMx := MouseTemp 		       {zero based mouse positioning}
   else
     GetMx := succ(MouseTemp);		  {mouse positioning starts with one}
end;

{---------------------------------------------------------------------------}
{ Normalizes a mouse Y position to standard position info }

function GetMy(Y:Integer):Integer;
begin
   if TextMouse then
     MouseTemp := Y div MouseTextHeight     {convert position for text modes}
   else
     MouseTemp := Y;			  {no conversion needed for graphics}

   if ZeroMouse then
     GetMy := MouseTemp 		       {zero based mouse positioning}
   else
     GetMy := succ(MouseTemp);		  {mouse positioning starts with one}
end;

{---------------------------------------------------------------------------}
{ converts a standard X position to a mouse X position }

function PutMx(X:Integer):Integer;
begin
   if ZeroMouse then
     MouseTemp := X			       {zero based mouse positioning}
   else
     MouseTemp := pred(X);		  {mouse positioning starts with one}

   if MouseTemp < 0 then				 {clip value to zero}
     MouseTemp := 0;

   case CrtMode of
     0,1 : begin
	     if MaxCrtX < 64 then
	       PutMx := (MouseTemp * MouseTextWidth) shl 1     {320x200 text}
	     else
	       PutMx := MouseTemp * MouseTextWidth;	       {???x??? text}
	   end;
     2,3 : PutMx := MouseTemp * MouseTextWidth; 	       {640x200 text}
     4,5 : begin
	     if HercGraphMouse then
	       PutMx := MouseTemp		      {720x348 herc graphics}
	     else
	       PutMx := MouseTemp shl 1;		   {320x200 graphics}
	   end;
     6	 : PutMx := MouseTemp;				   {640x200 graphics}
     7	 : PutMx := MouseTemp * MouseTextWidth; 	       {640x??? text}
     $D,$13 : PutMx := MouseTemp shl 1; 		   {320x200 graphics}
   else
     PutMx := MouseTemp;				   {640x??? graphics}
   end;
end;

{---------------------------------------------------------------------------}
{ converts a standard Y position to a mouse Y position }

function PutMy(Y:Integer):Integer;
begin
   if ZeroMouse then
     MouseTemp := Y			       {zero based mouse positioning}
   else
     MouseTemp := pred(Y);		  {mouse positioning starts with one}

   if MouseTemp < 0 then				 {clip value to zero}
     MouseTemp := 0;

   if TextMouse then
     PutMy := MouseTemp * MouseTextHeight   {convert position for text modes}
   else
     PutMy := MouseTemp;		  {no conversion needed for graphics}
end;

{---------------------------------------------------------------------------}
{ This procedure is not a standard mouse function. It is however needed to }
{ work with the Hercules graphics display. When you use the Hercules }
{ graphics display you must call this with the proper display page after }
{ you call InitGraph, but before you call InitMouse. InitGraph needs CrtMode}
{ to be at 7 to detect the Herc display, but the Mouse needs it at 5 or 6 }
{ to detect when the Herc card is in graphs mode. (The Herc card has no }
{ provision for telling the system that it is graphics mode.) }
{ Note: Be sure to call this procedure with a Pg of -1 if you turn graphics }
{ off or anytime before you call InitGraph or DetectGraph. The Mouse unit }
{ contains an Exit procedure that calls SetHercMouse with a value of -1 if }
{ a Hercules graph mode was selected so that the CrtMode byte will be }
{ properly restored on exit from the program. }

procedure SetHercMouse(Pg:Integer);
begin
  Case Pg of
    0 : begin
	  CrtMode := 6;       { put mouse on Hercules graphics display Pg 0 }
	  HercGraphMouse := true;
	end;
    1 : begin
	  CrtMode := 5;       { put mouse on Hercules graphics display Pg 1 }
	  HercGraphMouse := true;
	end;
  else
    begin
      CrtMode := 7;	   { indicate that Hercules display is in text mode }
      HercGraphMouse := false;
    end;
  end;
end;

{---------------------------------------------------------------------------}
{ Check if a mouse point is currently in the specified area}
{ returns true if it is, false if not}
{  Recommended calling method: }
{  If MousePointIn(GetMx(Mx),GetMy(My),x1,y1,x2,y2) then DoSomething;}

function MousePointIn(Mx,My, x1,y1,x2,y2:Integer):Boolean;
begin
   if (Mx >= x1) and
      (Mx <= x2) and				   {check if in the box area}
      (My >= y1) and
      (My <= y2) then
     MousePointIn := true			   {<-- return true if it is}
   else
     MousePointIn := false;		      {<-- return false if it is not}
end;


{---------------------------------------------------------------------------}
function MouseClick:Boolean;	       {has the mouse been clicked recently?}
begin
   MouseClick := MouseClicked;		     {get a copy of the click status}
   MouseClicked := false;			      {then clear the status}
end;


{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{ the following are misc subroutines used by the Mouse unit }

{---------------------------------------------------------------------------}
{ This is called by InitMouse to initialize the mouse mode flags}
{ Note: if you are using a Hercules display card in graphics mode,}
{ you must call the SetHercMouse() procedure before calling InitMouse}

procedure InitMouseMode;
begin
   MouseAreaX1 := 0;			      {initialize mouse bounded area}
   MouseAreaY1 := 0;				   {assume defaults to start}
   MouseAreaX2 := 639;
   MouseAreaY2 := 199;
   MouseTextWidth := 8; 		  {BIOS characters are always 8 wide}
   MouseTextHeight := 8;		     {default mouse text height to 8}

   if CrtCols = 0 then			      {if BIOS text column width = 0}
     MaxCrtX := 80				{then force text width to 80}
   else
     MaxCrtX := CrtCols;		       {else use the indicated width}

   if CrtRows = 0 then				{if BIOS text row height = 0}
     MaxCrtY := 25			       {then force text height to 25}
   else
     MaxCrtY := succ(CrtRows);		      {else use the indicated height}

   if HercGraphMouse then		   {if Herc graphics, handle special}
   begin
     ZeroMouse := true; 		{assume zero mouse for herc graphics}
     TextMouse := false;			    {this is a graphics mode}
     MouseAreaX2 := 719;
     MouseAreaY2 := 347;
     Exit;
   end;

   if (CrtMode < 4) or (CrtMode = 7) then	   {modes 1-3 and 7 are text}
   begin
     TextMouse := true; 				  {mark as text mode}
     ZeroMouse := false;		  {nCRT based text modes start at one}
     MouseAreaX2 := MaxCrtX * MouseTextWidth;	 {adjust mouse area based on}
     MouseAreaY2 := MaxCrtY * MouseTextHeight;	 {rows and columns BIOS data}
   end
   else 					      {the rest are graphics}
   begin
     ZeroMouse := true; 			  {graph modes start at zero}
     TextMouse := false;				   {mark as graphics}
     case CrtMode of
       $F,$10  : MouseAreaY2 := 349;			   {640x350 graphics}
       $11,$12 : MouseAreaY2 := 479;			   {640x480 graphics}
     end;
   end;
end;


{---------------------------------------------------------------------------}
{$IFDEF GMouse} 		{ if we are using graphics enable this stuff}

procedure MakeBGIMouse;     { Create a BGI based mouse cursor on the screen }
var i,ii,Mx1,My1,Mx2,My2:integer;		 { called from ShowBGIMouse }
    PixelColor:word;
begin
   {if mouse image is inside BGI safe area, then turn off redraw}
   if (MouseImageX > 0) and (EndImageX < GetMaxX) and
      (MouseImageY > 0) and (EndImageY < GetMaxY) then
     MouseReDraw := false;		  {image is safe, so turn off redraw}

   with MouseGCursor[MouseGShape] do
   begin
     if MouseSize = 0 then     {no previously allocated, so grab some memory}
     begin
       MouseSize := ImageSize(0,0,15,15);		{compute cursor size}
       GetMem(MouseBack,MouseSize);		       {then grab the memory}
       GetMem(MouseMask,MouseSize);
       GetMem(MouseFore,MouseSize);
     end;

     Mx1 := IntLimit(MouseImageX,0,GetMaxX);	    {compute real image size}
     My1 := IntLimit(MouseImageY,0,GetMaxY);	     {bounded by screen area}
     Mx2 := IntLimit(EndImageX,0,GetMaxX);
     My2 := IntLimit(EndImageY,0,GetMaxY);
     GetImage(Mx1,My1,Mx2,My2,MouseBack^);	    {save area behind cursor}

     {create the cursor mask with BGI}
     for ii := abs(My1-MouseImageY) to 15-abs(My2-EndImageY) do
     begin
       for i := abs(Mx1-MouseImageX) to 15-abs(Mx2-EndImageX) do
       begin
	 if (Def[0][ii] shl i) and $8000 = 0 then
	   PixelColor := 0			   {use background for black}
	 else
	   PixelColor := GetMaxColor;		    {use max color for white}
	 PutPixel(MouseImageX+i,MouseImageY+ii,PixelColor);
       end;
     end;						{save the mask image}
     GetImage(Mx1,My1,Mx2,My2,MouseMask^);

     {create the cursor overlay with BGI}
     for ii := abs(My1-MouseImageY) to 15-abs(My2-EndImageY) do
     begin
       for i := abs(Mx1-MouseImageX) to 15-abs(Mx2-EndImageX) do
       begin
	 if (Def[1][ii] shl i) and $8000 = 0 then
	   PixelColor := 0			   {use background for black}
	 else
	   PixelColor := MouseColor;	     {use specified color foreground}
	 PutPixel(MouseImageX+i,MouseImageY+ii,PixelColor);
       end;
     end;				      {Save the cursor overlay image}
     GetImage(Mx1,My1,Mx2,My2,MouseFore^);
   end;

   MouseImageX := Mx1;
   MouseImageY := My1;
   PutImage(MouseImageX,MouseImageY,MouseBack^,NormalPut);   { restore image}
   PutImage(MouseImageX,MouseImageY,MouseMask^,AndPut);       { then display}
   PutImage(MouseImageX,MouseImageY,MouseFore^,OrPut);		{ new cursor}
end;

{---------------------------------------------------------------------------}
{display a BGI mouse cursor on the screen }

procedure ShowBGIMouse; 			 { called from IntShowMouse }
begin
  if MouseVisible then	     {if mouse currently on, restore old image first}
     PutImage(OldImageX,OldImageY,MouseBack^,NormalPut);

  {compute the mouse image position}
  MouseImageX := GetMx(MouseX)-MouseGCursor[MouseGShape].HotX;
  MouseImageY := GetMy(MouseY)-MouseGCursor[MouseGShape].HotY;
  EndImageX := MouseImageX+15;
  EndImageY := MouseImageY+15;

  {if cursor never made, or image is partially off screen, remake it}
  if (MouseImageX < 0) or (EndImageX > GetMaxX) or
     (MouseImageY < 0) or (EndImageY > GetMaxY) then
    MouseReDraw := true;

  If (MouseSize = 0) or MouseReDraw then
  begin
    MakeBGIMouse;			    { do we need to create a cursor?}
  end
  else
  begin 				  { if cursor already exists, use it}
    GetImage(MouseImageX,MouseImageY,		    { save image under mouse}
	     EndImageX,EndImageY,MouseBack^);
    PutImage(MouseImageX,MouseImageY,MouseMask^,AndPut);      { then display}
    PutImage(MouseImageX,MouseImageY,MouseFore^,OrPut); 	{ new cursor}
  end;
  OldImageX := MouseImageX;			     { and save where we are}
  OldImageY := MouseImageY;
  MouseVisible := true;
end;

{---------------------------------------------------------------------------}
{hide a BGI mouse cursor on the screen }

procedure HideBGIMouse;
begin
   if MouseBack = nil then Exit;    { unless we don't have anything saved}
   PutImage(OldImageX,OldImageY,MouseBack^,NormalPut);
end;

{$ENDIF}

{---------------------------------------------------------------------------}
{display a simulated mouse cursor on the screen }
procedure ShowMouseSim;
begin
{$IFDEF GMouse}
  if not(TextMouse) then
    ShowBGIMouse;
{$ENDIF}
end;

{---------------------------------------------------------------------------}
{hide the simulated mouse cursor on the screen }

procedure HideMouseSim;
begin
{$IFDEF GMouse}
  if not(TextMouse) then
    HideBGIMouse;
{$ENDIF}
end;


{---------------------------------------------------------------------------}
{ End Of Include File MOUSESUB.PAS }
