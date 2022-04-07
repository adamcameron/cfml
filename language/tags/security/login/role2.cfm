<!--- role2.cfm --->
<cflogin>
	Logging in user2<br />
 	<cfloginuser name="user1" password="user1" roles="role2,admins">
</cflogin>
<cfinclude template="./inc.cfm">