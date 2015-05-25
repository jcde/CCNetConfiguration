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
	m = m + "     In order to select building environment put the path to new environment file like 'Development.xml' as a command line parameter to this vbs-file."
	wscript.echo m
	WScript.Quit
end if

Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
Set f = FSO.GetFolder(".")

strDeploy = f.path & "\" & WScript.Arguments(0)

rCode = objShell.RegWrite("HKCU\Environment\currentDeploy", strDeploy, "REG_SZ")
strDeploy = objShell.RegRead("HKCU\Environment\currentDeploy")

wscript.echo "Building environment marked in the windows environment variable 'currentDeploy' is " & strDeploy & _
		".     You have to restart PC or to fulfill Logoff\Logon. " & _
		"  Subversion SVN has to be reachable by PATH windows environment variable."

