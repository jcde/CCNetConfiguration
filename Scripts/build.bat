call "%VS90COMNTOOLS%\..\..\VC\vcvarsall.bat"
rem MSBuild does not support vbproj files
msbuild /t:Rebuild /p:Configuration=%1 /flp:LogFile=output.log %2

if %ERRORLEVEL% == 0 goto end
echo Build error! (Errorlevel == %ERRORLEVEL%)
exit 1
:end