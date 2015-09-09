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

= Build environment installation =
* select folder to store scripts and all build files. folder will be called ${root.dir} later
* checkout {{svn|src}} into ${root.dir} or if you have no access checkout {{svn|src/AutoBuilds}} into ${root.dir}\AutoBuilds folder (called ${autobuilds.dir} later)
* get _environment_.xml from someone or from {{svn|src/Keys/BuildEnvironments}} and put it into ${autobuilds.dir}\CCNetConfiguration folder (called ${config.dir} later)
* run ${config.dir}\setCurrentDeploy.vbs _environment_.xml (in Explorer this can be achieved by dragging the _environment_.xml file and dropping onto the ${config.dir}\setCurrentDeploy.vbs) 
* run ${config.dir}\CCNet\CCNet2Environment.build.bat
** CCNetConfig.log should have "BUILD SUCCEEDED" in the end
* run ${config.dir}\CCNet\CCNetServiceInstall.bat as Administrator
** Windows service with name 'CCService _environment_' should be created
* in order to test installation ${autobuilds.dir}\_environment_\CCNet\ccnet.exe may be run
* check port attribute in ${autobuilds.dir}\_environment_\ccservice.exe.config
* change Log On User for Windows service of CCService_environment_ to user who accesses [[TFS_Sources]], start service and open firewall for it if needed
* check that CruiseControl is running and have at least Building project. In order to do this look at ccnet.exe messages or at a web dashboard or at a CCTray

= TFS notes =
* Used CC_NET workspace by default.
* Working folder may be mapped to only one workspace and such mapping is done in Visual Studio or first time by cruisecontrol. 
