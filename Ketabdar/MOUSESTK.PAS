
{ This is the MOUSESTK.PAS include file for the MOUSE.PAS unit}
{ This include file contains the mouse status stack procedures }

{---------------------------------------------------------------------------}
{ Mouse stack variables }
type
     MousePtrP   = ^MousePtrRec;               {defines a mouse stack record}
     MousePtrRec = record      {Prev points to previous stack record on heap}
        Prev : MousePtrP;                {if nil then is top record on stack}
        Buf  : Pointer;                  {Buf points to the mouse data saved}
        Size : Integer;                    {Size = bytes in the mouse buffer}
     end;

var  MouseStack  : MousePtrP;  {MouseStack points to last rec on mouse stack}
                                  {if nil then there is nothing on the stack}

{---------------------------------------------------------------------------}
function PushMouse:Boolean;  {Pushes current mouse status on the mouse stack}
var Ptemp : MousePtrP;       {Returns false if not enough heap space to push}

begin
  PushMouse := false;                      {<-- assume no good to begin with}
  if not(MouseInstalled) then Exit;             {<-- can't do this, no mouse}

  MouseBusy := true;        {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 21;                         {find out how much data to save}
  intr($33,MouseReg);                  {then check to see if it can be saved}
  If MaxAvail < ( MouseReg.BX + sizeof(MousePtrRec) ) then
  begin
    MouseBusy := false;                {Polled use of read mouse is done now}
    Exit;
  end;

  Ptemp := MouseStack;                           {<-- save old stack pointer}
  GetMem(MouseStack,sizeof(MousePtrRec));      {<-- get a new pointer record}
  with MouseStack^ do
  begin
    Prev := Ptemp;                            {<-- link in old stack pointer}
    Size := MouseReg.BX;                       {<-- save how big the data is}
    GetMem(Buf,Size);               {<-- grab some buffer space for the data}
    MouseReg.AX := 22;
    MouseReg.ES := seg(Buf^);             {save the Mouse data in the buffer}
    MouseReg.DX := ofs(Buf^);
    intr($33,MouseReg);
  end;
  MouseBusy := false;                  {Polled use of read mouse is done now}
  PushMouse := true;                               {<-- tell them we made it}
end;

{---------------------------------------------------------------------------}
function PopMouse:Boolean;          {Pops mouse status from the mouse stack.}
var Ptemp : MousePtrP;                     {Returns false if nothing to pop.}

begin
  PopMouse := false;                       {<-- assume no good to begin with}
  if not(MouseInstalled) then Exit;             {<-- can't do this, no mouse}
  If MouseStack <> nil then Exit;           {<-- Nothing in the stack to pop}

  MouseBusy := true;        {disallow re-entrant use of routine by mouse ISR}
  with MouseStack^ do
  begin
    MouseReg.AX := 23;
    MouseReg.ES := seg(Buf^);             {restore mouse data from the stack}
    MouseReg.DX := ofs(Buf^);
    intr($33,MouseReg);
    Ptemp := Prev;                              {<-- unlink the prev pointer}
    FreeMem(Buf,Size);                           {and free up the heap space}
    FreeMem(MouseStack,sizeof(MousePtrRec));
    MouseStack := Ptemp;                           {<-- update stack pointer}
  end;
  PopMouse := true;                                {<-- tell them we made it}
  MouseBusy := false;                  {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
procedure ZapMouseStack;                             {Get rid of mouse stack}
var Ptemp : MousePtrP;

begin
   MouseBusy := true;       {disallow re-entrant use of routine by mouse ISR}
   while MouseStack <> nil do               {pop the stack until it is empty}
   begin
     with MouseStack^ do
     begin
       Ptemp := Prev;                           {<-- unlink the prev pointer}
       FreeMem(Buf,Size);                        {and free up the heap space}
       FreeMem(MouseStack,sizeof(MousePtrRec));
       MouseStack := Ptemp;                        {<-- update stack pointer}
     end;
   end;
   MouseBusy := false;                 {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ End Of MOUSESTK.PAS include file }

