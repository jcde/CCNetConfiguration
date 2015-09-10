<?xml version="1.0"?>
<template>
  ${result}
  <project>
		<name>${AutoProduct.name}</name> 
		<description>${prodDescription}</description>
		<webURL>http://${webURLtemplate}/project/${AutoProduct.name}/ViewLatestBuildReport.aspx</webURL>
		<!--security type="defaultProjectSecurity" guest="guest" >
		  <permissions>     
			${projccnetPerm}
			${ccnetPerm}
		  </permissions>
		</security-->     
		${projccnetConfigPart}
		${sourcecontrol}
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