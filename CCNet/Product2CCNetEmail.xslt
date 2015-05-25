<?xml version="1.0"?>
<template>
  ${result}
  <project>
		<name>${deployProductNamePrefix}${AutoProduct.name}</name> 
		${projccnetConfigPart}
    <!--security type="defaultProjectSecurity" guest="guest" >
      <permissions>     
    		${projccnetPerm}
        ${ccnetPerm}
      </permissions>
    </security-->     
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

            <email from="support@christian.in.ua" mailhost="smtp.gmail.com" includeDetails="TRUE" >
              <!--user="eugene@christian.in.ua" password="Vfhbyrf-0" ssl="true" -->
              <users>
                      <user name="Yevhen" group="change" address="yevhen@christian.in.ua"/>
                ${notifyusers}
              </users>
              <groups>
                      <group name="change" >
                  <notifications>
                      <notificationType>Change</notificationType>
                  </notifications>
                </group>
                      <group name="always" >
                  <notifications>
                      <notificationType>Always</notificationType>
                  </notifications>
                </group>
              </groups>
            </email>

      <!--conditional>
        <conditions>
          <compareCondition>
            <value1>${string::trim('${NoEmail}')}</value1>
            <value2>true</value2>
            <evaluation>NotEqual</evaluation>
          </compareCondition>
        </conditions>
        <tasks>
         </tasks>
      </conditional-->

      </publishers>
  </project>
</template>