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

if f.path = objShell.ExpandEnvironmentStrings("%windir%") + "\System32" or f.path = objShell.ExpandEnvironmentStrings("%homedrive%") + objShell.ExpandEnvironmentStrings("%homepath%") then
	strDeploy = WScript.Arguments(0)
else
	strDeploy = f.path & "\" & WScript.Arguments(0)
end if
wscript.echo f.path
wscript.echo strDeploy
Set deployFile = FSO.GetFile(strDeploy)

Set scriptFolder = FSO.GetFile(WScript.ScriptFullName).ParentFolder 
if not deployFile.ParentFolder = scriptFolder then
	FSO.Copyfile strDeploy, scriptFolder & "\"
	strDeploy = scriptFolder & "\" & deployFile.Name
end if

Set getOSVersion = objShell.exec("%comspec% /c ver")
version = getOSVersion.stdout.readall
Select Case True
   Case InStr(version, "n 5.") > 1 : 
	rCode = objShell.RegWrite("HKCU\Environment\currentDeploy", strDeploy, "REG_SZ")
	strDeploy = objShell.RegRead("HKCU\Environment\currentDeploy")
	wscript.echo "Building environment marked in the windows environment variable 'currentDeploy' is " & strDeploy & _
				 ".     You have to restart PC or to fulfill Logoff\Logon. "
	rem   Case InStr(version, "n 6.") > 1 : GetOS = "Vista"
   Case Else : 
    objShell.run "cmd /c setx currentDeploy " + strDeploy
	rem quit cause RegRead("HKCU\Environment\currentDeploy") gives old value
End Select

