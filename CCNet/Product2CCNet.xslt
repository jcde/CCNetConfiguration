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
		<webURL>http://router/ccnet/server/${environment::get-machine-name()}/project/${AutoProduct.name}/ViewLatestBuildReport.aspx</webURL>
		<!--sourcecontrol autoGetSource="true" applyLabel="true"-->
 	    <sourcecontrol type="${sourceType}" autoGetSource="true" >
			<executable>${svn.exe}</executable>
			${sscpart}
			<username>${_username}</username>
			<password>${_password}</password>
			<workingDirectory>${workingDirectory}</workingDirectory>
			<cleanCopy>false</cleanCopy>
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