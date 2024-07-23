<!--- inc.cfm --->
<cfscript>
	st = structNew();
	st.role1 = isUserInRole("role1");
	st.role2 = isUserInRole("role2");
	st.admins = isUserInRole("admins");
	st.nonadmins = isUserInRole("nonadmins");
	st.authUser = getAuthUser();
	st.time = timeFormat(now(), "HH:MM:SS.LLL");
</cfscript>

<cfdump var="#st#" label="st">
<cfdump var="#session#" label="session">