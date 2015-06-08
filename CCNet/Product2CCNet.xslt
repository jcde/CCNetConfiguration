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
		<webURL>http://${environment::get-machine-name()}${webURLtemplate}/project/${AutoProduct.name}/ViewLatestBuildReport.aspx</webURL>
		<!--<labeller type="dateLabeller"/>
			sourcecontrol autoGetSource="true" applyLabel="true"-->
 	    <sourcecontrol type="${sourceType}" autoGetSource="true" >
			${sscpart}
			<username>${_username}</username>
			<password>${_password}</password>
			<workingDirectory>${workingDirectory}</workingDirectory>
			<cleanCopy>false</cleanCopy>
		</sourcecontrol>
		<tasks>
			${ccnetTasks}
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