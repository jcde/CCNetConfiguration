	<email from="support@in.ua" mailhost="smtp.gmail.com" includeDetails="TRUE" >
	  <!--user="support@in.ua" password="" ssl="true" -->
	  <users>
			<user name="Support" group="change" address="support@in.ua"/>
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
