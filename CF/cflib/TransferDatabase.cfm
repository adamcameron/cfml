<cffunction name="TransferDatabase" returnType="string" output="false">
	<cfargument name="DtSource" type="string" required="true">
    <cfargument name="dbsource" type="string" required="true">
    <cfargument name="dbDestination" type="string" required="true">

	<cfset var dbName = "">

	<cfdbinfo datasource="#arguments.DtSource#" name="dbName" type="dbnames" />
    <cfset databaseSource = ListFindNOCase(ValueList(dbName.DATABASE_NAME,","),arguments.dbsource,",")>
    <cfset databaseDestination = ListFindNOCase(ValueList(dbName.DATABASE_NAME,","),arguments.dbDestination,",")>

    <cfset HASILNYA="">
    <cfif databaseSource GT 0 AND databaseDestination GT 0>
    	<cfdbinfo datasource="#arguments.DtSource#" name="tables" type="tables" />
        <cfloop query="tables">
               <cfquery name="getData" datasource="#arguments.DtSource#" debug="no" cachedwithin=#CreateTimeSpan(0,0,0,10)# >SELECT * INTO #arguments.dbDestination#.dbo.[#Table_Name#] FROM #arguments.dbsource#.dbo.[#Table_Name#]</cfquery>    
        </cfloop>
        <cfset HASILNYA="#HASILNYA#<br />">            
    </cfif>    
    <cfreturn HASILNYA>            
</cffunction>

<cfset result = TransferDatabase("scratch_mssql", "scratch", "scratch3")>

<cfoutput>#result#</cfoutput>