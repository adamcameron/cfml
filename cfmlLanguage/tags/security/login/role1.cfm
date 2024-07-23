<!--- role1.cfm --->
<cflogin>
	Logging in user1<br />
 	<cfloginuser name="user1" password="user1" roles="role1,nonadmins">
</cflogin>
<cfinclude template="./inc.cfm">