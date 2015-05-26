# CCNetConfiguration
Set of NAnt scripts to produce CruiseControl.Net configuration files

Includes CruiseControl.Net 1.8.5 binaries.

File ${autobuilds.dir}/Products.xml describes projects structure in comparison to products and workstations.
Note. The product "Building" lists all envirounments and workstations that belong to.

= Prerequisites =
* Nant 0.92
* TortoiseSVN with "command line client tools" installed
* CruiseControl.NET-1.8.5.0-Setup.exe may install web dashboard
* http://switch.dl.sourceforge.net/project/gnuwin32/zip/3.0/zip-3.0-setup.exe for zipping

= Environment installation =
* select AutoBuilds folder to store scripts that will be called ${autobuilds.dir}
* checkout https://github.com/jcde/CCNetConfiguration/trunk into ${autobuilds.dir}\CCNetConfiguration folder (called ${config.dir}) by TortoiseSVN
* get _environment_.xml from someone or make it by yourselves and put it in ${config.dir}
* run ${config.dir}\setCurrentDeploy.vbs _environment_.xml and logoff/logon
* maybe modify and maybe run ${config.dir}\setPath.bat
** for example, svn.exe must be accessible in command line by PATH, its binaries are in "c:\Program Files\Apache Software Foundation\Apache2.2\bin\.." 
* run ${config.dir}\CCNet\CCNet2Environment.build.bat
* run ${config.dir}\CCNet\CCNetServiceInstall.bat as Administrator
** change Log On User for Windows service of CCService_environment_ to user with access to sources, start it and open firewall for it if needed


= TFS notes =
* Used CC_NET workspace by default.
* Working folder may be mapped to only one workspace and such mapping is done in Visual Studio or first time by cruisecontrol. 
