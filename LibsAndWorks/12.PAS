uses Graph;

var
 grDriver: Integer;
 grMode: Integer;
 ErrCode: Integer;
begin
 grDriver := Detect;
 InitGraph(grDriver, grMode,'d:\compiler\bp\bgi');
 ErrCode := GraphResult;
 if ErrCode = grOk then
 begin  { Do graphics }
   Line(0, 0, GetMaxX, GetMaxY);
   Readln;
   CloseGraph;
 end
 else
   Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.
