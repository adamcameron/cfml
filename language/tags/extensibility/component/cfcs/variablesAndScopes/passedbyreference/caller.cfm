<cffunction name="old">OLD FUNCTION<br /></cffunction>
<cffunction name="new">NEW FUNCTION<br /></cffunction>
<cffunction name="newer">NEWER FUNCTION<br /></cffunction>

<cffunction name="transmuter">
	<cfargument name="f1" required="yes">
	<cfset old = arguments.f1>
	<cfset new = newer>
</cffunction>

<cfset old()>
<cfset new()>
<cfset transmuter(new)>
<cfset old()>
<cfset new()>
