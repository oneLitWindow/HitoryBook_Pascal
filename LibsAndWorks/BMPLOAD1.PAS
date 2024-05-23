unit bmpload;
interface
procedure load(stkup:string);
implementation
Uses Graph,Crt;
Var
 BMPFile:File;
 Buffer:Array[1..2000] Of Char;
 GraphDriver,GraphMode:Integer;
 X,Y,HeadBM,I,H,W,N:Word;
 J,G,S:LongInt;
procedure load(stkup:string);
Begin
 {$I-}
 GraphDriver:=InstallUserDriver('svga256',nil);
 GraphMode:=3;
 InitGraph(GraphDriver,GraphMode,'d:\compiler\bp\bgi'); {Path Of Svga256.BGI}
 Assign(BMPFile,'c:\1.bmp');  {Path Of BMPFile}
 Reset(BMPFile,1);
 seek(BMPFile,1);
 BlockRead(BMPFile,Buffer,SizeOf(Buffer),N);
 W:=Ord(Buffer[18])+Ord(Buffer[19])*256;
 H:=Ord(Buffer[22])+Ord(Buffer[23])*256;
 HeadBM:=Ord(Buffer[10])+Ord(Buffer[11])*256+Ord(Buffer[12])*65536;
 For I:=0 to 255 Do
 Begin
  Port[$3c8]:=I;
  Port[$3c9]:=Trunc(Int(Ord(Buffer[56+(I*4)])/4));
  Port[$3c9]:=Trunc(Int(Ord(Buffer[55+(I*4)])/4));
  Port[$3c9]:=Trunc(Int(Ord(Buffer[54+(I*4)])/4));
 End;
 X:=0;
 Y:=H;
 S:=0;
 J:=HeadBM;
 G:=filesize(BMPFile);
 Repeat
  Seek(BMPFile,HeadBM+(2000*S));
  BlockRead(BMPFile,Buffer,SizeOf(Buffer),N);
  For I:=1 To 2000 Do
  Begin
   Inc(J);
   Inc(X);
   PutPixel(X,Y,Ord(Buffer[I]));
   If X>=W Then
   Begin
    X:=0;
    Dec(Y);
   End;
   If J>=G Then Break;
  End;
  Inc(S);
 Until (J>=G);
 Readkey;
end;
End.