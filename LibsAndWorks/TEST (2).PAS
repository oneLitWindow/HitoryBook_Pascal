uses easyer,graph,mousedrv,dos,crt;
begin
{procedure wrta(s:string;n,z,tj        { Writes a letter in Text Mode with
               :integer;d:real;yn,ny  { Effects ; S is Your String , N = mode
               :boolean);             { if n<0 then Writes from last to first
}
clrscr;
wrta ('Salam',1,-1,2,100,false,true);
halt;
screen (2,2,'d:\compiler\bp\bgi');
cleardevice;
setcolor (10);
{procedure wrga(s:string;x,y,c,m,sc,sd:integer;ss:real;xx,yy:integer;d:real;cs
                :integer;yn,ny:boolean);                                        }
settextstyle (7,0,1);
wrga ('Hello all!asdkljasdjlasdjsdfjksdfjskdfjdkf;lsdkfopiertgflkgkld',getx,gety,4,1,2,50,1,2,2,50.0000,100,false,true);
readkey;
end.