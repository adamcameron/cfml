<!--- PARENT.CFC --->
<cfcomponent hint="parent component">
	<cfparam name="instance" default="#structNew()#">

	<cffunction name="f1">
		<cfset instance.parentf1 = true>
		<cfdump var="#instance#" label="PARENT">
		<cfreturn true>
	</cffunction>
</cfcomponent>