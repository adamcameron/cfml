<cfcomponent output="false">


   <!--- Lookup used for auto suggest --->
   <cffunction name="lookupArt" access="remote" returntype="array">
		<cfargument name="search" type="any" required="false" default="">

		<!--- Define variables --->
		<cfset var data="">
		<cfset var result=ArrayNew(1)>

		<!--- Do search --->
		<cfquery datasource="#request.dsn#" name="data">
			SELECT artname
			FROM art
			WHERE upper(artname) LIKE upper(<cfqueryparam value="#ARGUMENTS.search#%" cfsqltype="CF_SQL_VARCHAR">)
			ORDER BY artname
		</cfquery>
		<!--- And return it --->
		<cfreturn listToArray(valueList(data.artname))>
   </cffunction>

</cfcomponent>