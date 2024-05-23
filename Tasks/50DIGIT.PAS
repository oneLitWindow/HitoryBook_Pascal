uses ncrt,easyer,textef,mousedrv;
var t:array[1..10] of integer;
    s:array[1..10] of string;
    i,j:array[1..50] of byte;
    sum:array[0..50] of byte;
    st1,st2:string[50];
begin
clscr;
txtcolor (15,0);
for t[1]:=1 to 80 do writeln;
writeln;
scrright (1,2,50,'This Program calculates sum of two 50-digit positive numbers');
scrright (1,3,50,'http://tetta.5u.com, Amin1986@gmail.com');
txtcolor (12,0);
scrright (1,5,50,'Characters will be exchanged with zero.');
txtcolor (1,0);
scrright (1,6,50,'======================== --------------------------------------------------');
txtcolor (9,0);
scrright (1,7,50,'Enter a 50 digit number: ');
readln(s[1]);
if length(s[1])>50 then s[1]:=copy(s[1],1,50);
while length(s[1])<50 do
s[1]:='0'+s[1];
st1:=s[1];
txtcolor (9,0);
scrright (1,8,50,'Your entered number is : ');
for t[1]:=1 to 50 do begin
val(st1[t[1]],t[2],t[3]);
i[t[1]]:=t[2];
if t[2]=0 then st1[t[1]]:='0';
write (i[t[1]]);
end;
txtcolor (1,0);
scrright (1,10,50,'======================== --------------------------------------------------');
txtcolor (9,0);
scrright (1,11,50,'Enter 2nd 50 digit num.: ');
readln(s[1]);
if length(s[1])>50 then s[1]:=copy(s[1],1,50);
while length(s[1])<50 do
s[1]:='0'+s[1];
st2:=s[1];
scrright (1,12,50,'Your entered number is : ');
for t[1]:=1 to 50 do begin
val(st2[t[1]],t[2],t[3]);
j[t[1]]:=t[2];
write (j[t[1]]);
if t[2]=0 then st2[t[1]]:='0';
end;
txtcolor (1,0);
scrright (1,14,50,'อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
txtcolor (10,0);
scrright (1,16,50,'Number one is:          ๚'+st1);
scrright (1,17,50,'Number two is:          +'+st2);
txtcolor (1,0);
scrright (1,18,50,'========================_--------------------------------------------------');
txtcolor (14,0);
scrright (1,19,50,'Sum of your numbers is: ');
for t[1]:=0 to 50 do sum[t[1]]:=0;
for t[1]:=50 downto 1 do begin
sum[t[1]]:=i[t[1]]+j[t[1]]+sum[t[1]];
while sum[t[1]]>= 10 do begin;sum[t[1]-1]:=sum[t[1]-1]+1;sum[t[1]]:=sum[t[1]]-10;end;
end;
for t[1]:=0 to 50 do write(sum[t[1]]);
writeln;
t[2]:=0;
scrright (1,20,50,'Sum, No Zero leading  : ');
for t[1]:=0 to 50 do begin
if (sum[t[1]]=0) and (t[2]=0) then write(' ') else write(sum[t[1]]);
if sum[t[1]]<>0 then t[2]:=1;
end;
scrcol   (1,22,50,'End! Press any key to exit program...');
txtcolor (9,0);
scrright (1,22,50,'End! Press any key to exit program...');
scrcol   (1,23,50,'http://tetta.5u.com, Amin1986@gmail.com');
txtcolor (9,0);
scrright (1,23,50,'http://tetta.5u.com, Amin1986@gmail.com');
readkey;
clscr;
end.