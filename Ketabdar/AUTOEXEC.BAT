@ECHO OFF
prompt $e[s$e[f$e[1;34;44;1m$e[K$e[1;7f$e[0;37;44;1m$e[1;37;44;1m$e[ Windows 98-SE-Farsi edition $e[1;34;44;1m$e[³$e[1;37;44;1m$e[ Time: $t$h$h$h$h$h$h
prompt %prompt% $e[1;34;44;1m$e[³$e[1;37;44;1m Date: $D$e[1;34;44;1m $e[0;32;40;2m$e[u$P$e[1;31;40;1m$G$e[0;36;40;2m
SET WINPMT=%prompt%
rem SET WINPMT=$e[s$e[f$e[0;316;41;1m$e[KMS-DOS Prompt -- Type Exit to close, Alt+Tab to switch, Alt+Enter to Window Mode$_$e[0;40;37;1m$e[K$e[u$P$G
LH /L:1,16016 c:\win98\command\doskey
SET BLASTER=A220 I5 D1 T4
SET SOUND16=e:\OPTi933
cls
set dn=d:\utility\dn
path C:\WIN98;C:\WIN98\COMMAND;c:\dos\asp\nrich;d:\utility\dn\;c:\dos\asp\system\
path c:\dos\batch;%path%;c:\dos\
PATH %path%;e:\OPTi933;
e:\OPTi933\sndinit /b
rem checkfnt
if exist ieboot ieboot
rem copy c:\win98\acdwal.bmp c:\progra~1\persia~1\pesia~1.bmp
rem mode con codepage prepare=((720) C:\WIN98\COMMAND\ega4.cpi)
rem mode con codepage select=720
c:\dos\info

