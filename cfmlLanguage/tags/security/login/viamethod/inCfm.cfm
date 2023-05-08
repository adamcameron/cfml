<cfparam name="form.j_username">
<cfparam name="form.j_password">

<cfset lRoles = "">
<cfset stUser = {
	loggedin= false,
	user	= "",
	roles	= ""
}>

<cfif isUserLoggedIn()>
	<cflogout>
	LOGGED ON<br />
</cfif>
<cflogin>
	TOP OF CFLOGIN<br/>
	<cfswitch expression="#form.j_username#">
		<cfcase value="admin">
			<cfset lRoles = "admin,write,read">
		</cfcase>
		<cfcase value="write">
			<cfset lRoles = "write,read">
		</cfcase>
		<cfcase value="read">
			<cfset lRoles = "read">
		</cfcase>
	</cfswitch>
	<cfif len(lRoles)>
		BEFORE CFLOGINUSER<br />
		<cfloginuser name="#form.j_username#" password="#form.j_password#" roles="#lRoles#">
		AFTER CFLOGINUSER<br />
	</cfif>
</cflogin>
<cfset stUser.loggedin	= isUserLoggedIn()>
<cfset stUser.user		= getAuthUser()>
<cfset stUser.roles		= getUserRoles()>
<cfdump var="#stUser#">
