<cfcomponent output="false">

	<cfset THIS.dsn="cfartgallery">

	<!--- Get array of media types --->
	<cffunction name="getMedia" access="remote" returnType="array">
		<!--- Define variables --->
		<cfset var data="">
		<cfset var result=ArrayNew(2)>
		<cfset var i=0>

		<!--- Get data --->
		<cfquery name="data" datasource="#THIS.dsn#">
		SELECT mediaid, mediatype
		FROM media
		ORDER BY mediatype
		</cfquery>

		<!--- Convert results to array --->
		<cfloop index="i" from="1" to="#data.RecordCount#">
			<cfset result[i][1]=data.mediaid[i]>
			<cfset result[i][2]=data.mediatype[i]>
		</cfloop>

		<!--- And return it --->
		<cfreturn result>
	</cffunction>

	<!--- Get art by media type --->
	<cffunction name="getArt" access="remote" returnType="array">
		<cfargument name="mediaid" type="numeric" required="true">

		<!--- Define variables --->
		<cfset var data="">
		<cfset var result=ArrayNew(2)>
		<cfset var i=0>

		<!--- Get data --->
		<cfquery name="data" datasource="#THIS.dsn#">
		SELECT artid, artname
		FROM art
		WHERE mediaid = #ARGUMENTS.mediaid#
		ORDER BY artname
		</cfquery>

		<!--- Convert results to array --->
		<cfloop index="i" from="1" to="#data.RecordCount#">
			<cfset result[i][1]=data.artid[i]>
			<cfset result[i][2]=data.artname[i]>
		</cfloop>

		<!--- And return it --->
		<cfreturn result>
	</cffunction>

</cfcomponent>