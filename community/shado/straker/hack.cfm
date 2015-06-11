<cfset sPathToConfig = expandPath("/shadozoom/") & "app_ini.cfm">
<cffile action="read" file="#sPathToConfig#" variable="sConfig">
<cfdump var="#sConfig#">

<cfquery name="qAdmin" datasource="shadozoom" username="root" password="123">
	select	usergroup_uuid
	from	usergroup
	where	usergroup_name = 'Administrators'
</cfquery>
<cfquery name="qUser" datasource="shadozoom" username="root" password="123">
	select	*
	from	users
	where	user_loginid = 'acameron@strakerinteractive.com'
</cfquery>

<cfdump var="#qAdmin#">
<cfdump var="#qUser#">

<cfquery name="qMember" datasource="shadozoom" username="root" password="123">
	insert into usergrouplink(
		usergrouplink_uuid,
		usergroup_uuid,
		user_uuid
	)values(
		'#insert("-",createUuid(),23)#',
		'#qAdmin.usergroup_uuid#',
		'#qUser.user_uuid#'
	)
	
</cfquery>
