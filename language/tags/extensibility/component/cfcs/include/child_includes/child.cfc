<!--- CHILD.CFC --->
<cfcomponent hint="child component" extends="parent">
	<cfinclude template="inc.cfm">

	<cffunction name="f3">
		<cfset instance.childf3 = true>
		<cfdump var="#instance#" label="CHILD">
		<cfreturn true>
	</cffunction>


</cfcomponent>