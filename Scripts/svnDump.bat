echo off
rem tried to zip through stdin, but no 7zip no gnuwin32/gzip did not work (was time when gzip worked)
rem if 7z or gzip used as %4 
rem if DEFINED %4 svnadmin dump %1 --incremental -r %2:head|"%4" -P cegth > %3
svnadmin dump %1 --incremental -r %2:head > %3
if "%4" == "" exit
%4 a -pcegth -bd -tzip %3 %3 > %3.log
del %3