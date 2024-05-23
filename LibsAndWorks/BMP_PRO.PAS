uses Graph ,Crt ;
{***************************************************************************}

Var
 Size ,Size1: Word ;
 P ,P1: pointer ;
{***************************************************************************}
{***************************************************************************}
{***************************************************************************}
procedure Bmp_load (S_Input,S_Path:String );
Var
 BMPFile:File;
 Buffer:Array[1..2000] Of Char;
 GraphDriver,GraphMode:Integer;
 X,Y,HeadBM,I,H,W,N:Word;
 J,G,S:LongInt;
Begin
 {$I-}
 GraphDriver:=InstallUserDriver('svga256',nil);
 GraphMode:= 2 ;
 InitGraph(GraphDriver,GraphMode,s_path); {Path Of Svga256.BGI}
 Assign(BMPFile,S_Input);  {Path Of BMPFile}
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
End ;
Begin
  Bmp_Load ('j:\home\8farid\pascal\bmpload\descent.bmp' ,'sunse006.bmp' ) ;
{
  SetColor (Black);
  Size := ImageSize(21,128,47,183);
  GetMem(P, Size);
  GetImage(21 ,128 ,47 ,183 ,P^);

  Size1 := ImageSize(214 ,71 ,240 ,128);
  GetMem(P1, Size1);
  GetImage(214 ,71 ,240 ,128 ,P1^);

 Cleardevice ;
  PutImage(10 ,10 ,P^  ,NormalPut);
  PutImage(50 ,10 ,P1^ ,NormalPut);
}
 ReadKey ;
End .




