Dim objShell, rCode, strDeploy, m

Set objShell = CreateObject("wscript.shell")

if WScript.Arguments.Count = 0 then 
	on error resume next
	strDeploy = objShell.RegRead("HKCU\Environment\currentDeploy")
	if strDeploy = "" then 
		m = "No building environment was selected."
    else	
		m = "Selected building environment is - '" & strDeploy & "'. "
	end if
	m = m + "     In order to select building environment put the path to new environment file like 'Development.xml' as a command line parameter to this vbs-file or drag and drop it on this vbs-file."
	wscript.echo m

	WScript.Quit
end if

Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
Set f = FSO.GetFolder(".")

if f.path = objShell.ExpandEnvironmentStrings("%windir%") + "\System32" then
	strDeploy = WScript.Arguments(0)
else
	strDeploy = f.path & "\" & WScript.Arguments(0)
end if

Set getOSVersion = objShell.exec("%comspec% /c ver")
version = getOSVersion.stdout.readall
Select Case True
   Case InStr(version, "n 5.") > 1 : 
	rCode = objShell.RegWrite("HKCU\Environment\currentDeploy", strDeploy, "REG_SZ")
rem   Case InStr(version, "n 6.") > 1 : GetOS = "Vista"
   Case Else : 
    objShell.run "cmd /c setx currentDeploy " + strDeploy
	WScript.Quit 
	rem quit cause RegRead("HKCU\Environment\currentDeploy") gives old value
End Select

strDeploy = objShell.RegRead("HKCU\Environment\currentDeploy")

wscript.echo "Building environment marked in the windows environment variable 'currentDeploy' is " & strDeploy & _
		"  Subversion SVN has to be reachable by PATH windows environment variable."
rem		".     You have to restart PC or to fulfill Logoff\Logon. " & _

