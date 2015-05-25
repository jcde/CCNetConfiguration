# CCNetConfiguration
Set of NAnt scripts to produce CruiseControl.Net configuration files

Includes CruiseControl.Net 1.8.5 binaries.

File ${autobuilds.dir}/Products.xml describes projects structure in comparison to products and workstations.
Note. The product "Building" lists all envirounments and workstations that belong to.

= Prerequisites =
* Nant 0.92
* CruiseControl.NET-1.8.5.0-Setup.exe gives only web-site
* http://switch.dl.sourceforge.net/project/gnuwin32/zip/3.0/zip-3.0-setup.exe
= Environment installation =
* select AutoBuilds folder that will be called ${autobuilds.dir}
* chechout https://github.com/jcde/CCNetConfiguration/trunk into ${autobuilds.dir}\CCNetConfiguration folder
* get <environment>.xml from someone or make it by yourselves
* run Sources\Configuration\DeployEnvironments\setCurrentDeploy.vbs <environment>.xml and logoff/logon
* maybe modify and maybe run Sources\Configuration\DeployEnvironments\setPath.bat
** for example, svn.exe must be accessible in command line by PATH, its binaries are in "c:\Program Files\Apache Software Foundation\Apache2.2\bin\.." 
* run Sources\Configuration\DeployEnvironments\CCNet\CCNet2Environment.build.bat
* run Sources\Configuration\DeployEnvironments\CCNet\CCNetService.build
changed Login User for CCService to a and started it and open firewall for it
