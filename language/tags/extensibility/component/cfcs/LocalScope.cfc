<cfcomponent>


	<cffunction name="setLocal">
		<cfset myLocal = "my local value">
		<cfdump var="#local#" label="local @ top">
		<cfdump var="#variables#" label="variables @ top">
		<cfset local = structNew()>
		<cfdump var="#local#" label="local @ bottom">
		<cfdump var="#variables#" label="variables @ bottom">
	</cffunction>


	<cffunction name="setRequest">
		<cfset request.myRequest = "my request value">
		<cfdump var="#local#" label="local @ top">
		<cfdump var="#variables#" label="variables @ top">
		<cfdump var="#request#" label="request @ top">
		<cfset request = structNew()>
		<cfdump var="#local#" label="local @ bottom">
		<cfdump var="#variables#" label="variables @ bottom">
		<cfdump var="#request#" label="request @ bottom">
	</cffunction>


</cfcomponent>