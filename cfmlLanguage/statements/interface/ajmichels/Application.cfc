<cfcomponent>
	<cfset thisDirectory = getDirectoryFromPath(getCurrentTemplatePath())>
	<cfset this.name="testInterface03">

	<cfset this.mappings = structNew()>
	<cfset this.mappings["/component"] = "#thisDirectory#component">
	<cfset this.mappings["/interface"] = "#thisDirectory#interface">
	<cfset this.mappings["/service"] = "#thisDirectory#service">

</cfcomponent>