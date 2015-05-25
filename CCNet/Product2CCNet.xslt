<?xml version="1.0"?>
<template>
  ${result}
  <project>
		<name>${AutoProduct.name}</name> 
		${projccnetConfigPart}
    <!--security type="defaultProjectSecurity" guest="guest" >
      <permissions>     
    		${projccnetPerm}
        ${ccnetPerm}
      </permissions>
    </security-->     
      <webURL>http://ro/ccnet/server/${environment::get-machine-name()}/project/${AutoProduct.name}/ViewLatestBuildReport.aspx</webURL>
		  <sourcecontrol type="svn" >
			<executable>${svn.exe}</executable>
			<trunkUrl>${trunkUrl}</trunkUrl>
			<username>${username}</username>
			<password>${password}</password>
			<workingDirectory>${workingDirectory}</workingDirectory>
		</sourcecontrol>
		<tasks>
			<nant>
				<executable>${nant.location}nant.exe</executable>
				<buildFile>${buildFile}</buildFile>
				<targetList>${targetList}</targetList>
				${ccnetNantConfigPart}
			</nant>
		</tasks>
		<publishers>
		  ${projPublishers}
		        <merge>
        		     <files>
                		 <file>${workingDirectory}\metrics\nunit\*-results.xml</file>
                		 <file>${workingDirectory}\metrics\ncover\*.*</file>
		                 <file>${workingDirectory}\metrics\fxcop\*</file>
		                 <file>${workingDirectory}\metrics\simian.xml</file>
		             </files>
        		</merge>

			<xmllogger />

			<statistics />
                                  
		</publishers>
  </project>
</template>