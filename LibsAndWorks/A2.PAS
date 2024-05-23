begin
asm
push   bp
mov    bp,sp
xor    ax,ax
{call   6144:02CD}
mov    di,0152
push   ds
push   di
mov    al,41
push   ax
xor    ax,ax
push   ax
{call   6144:067B
call   6144:05DD
call   6144:0291}
pop    bp
xor    ax,ax
{call   6144:0116}
int 10h
end;
end.