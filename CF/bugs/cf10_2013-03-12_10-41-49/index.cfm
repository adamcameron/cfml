<cfset myCfc = createObject('component','root.moncfc')>

<!--- Work --->
<cfset myCfc.method1()>

<cfmodule template="/root/portal.cfm">
	<!--- doesn't work --->
	<cfset myCfc.method1()>


</cfmodule>