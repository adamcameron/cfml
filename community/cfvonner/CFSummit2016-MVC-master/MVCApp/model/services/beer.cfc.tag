<cfcomponent displayname="Beer service" accessors="true">

    <!--- alternate way of using Dependency Injetion to load necessary objects --->
    <cffunction name="init">
        <cfargument name="helperService">
        <cfset variables.hs = arguments.helperService>
    </cffunction>
    
    <cffunction name="getAllBeers" access="public" returntype="query">
        <cfset var q = "">
        <cfquery name="q">
            SELECT  be.id
                    ,be.breweryId
                    ,be.name
                    ,br.name AS breweryName
                    ,be.type
                    ,be.abv
                    ,be.ibu
            FROM dbo.Beer be
            LEFT JOIN dbo.Brewery br ON be.breweryId = br.id
            ORDER BY be.name ASC
        </cfquery>
        <cfreturn q>
    </cffunction>
    
    <cffunction name="getBeer" access="public" returntype="query">
        <cfargument name="id" required="true" type="numeric">
        <cfset var q = "">
        <cfquery name="q">
            SELECT  id
                    ,breweryId
                    ,name
                    ,type
                    ,abv
                    ,ibu
            FROM dbo.Beer
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn q>
    </cffunction>
    
    <cffunction name="getBeerTypes" access="public" returntype="query">
        <cfset var q = "">
        <cfquery name="q">
            SELECT DISTINCT type
            FROM dbo.Beer
            ORDER BY type ASC
        </cfquery>
        <cfreturn q>
    </cffunction>
    
    <cffunction name="save" access="public" returntype="numeric">
        <cfargument name="id" type="numeric" default=0>
        <cfargument name="name" type="string" default="">
        <cfargument name="breweryId" type="numeric">
        <cfargument name="type" type="string" default="">
        <cfargument name="abv" type="numeric" default=0>
        <cfargument name="ibu" type="numeric" default=0>
        <cfset var beerExists = getBeer( id ).recordcount>
        <cfif arguments.id GT 0 AND beerExists>
            <cfquery>
                UPDATE dbo.Beer
                SET name = <cfqueryparam value="#arguments.name#" 
                        null="#hs.isEmptyString( arguments.name )#" cfsqltype="cf_sql_varchar">
                    ,breweryId = <cfqueryparam value="#arguments.breweryId#"
                        null="#hs.isEmptyString( arguments.breweryId )#" cfsqltype="cf_sql_integer">
                    ,type = <cfqueryparam value="#arguments.type#" 
                        null="#hs.isEmptyString( arguments.type )#" cfsqltype="cf_sql_varchar">
                    ,abv = <cfqueryparam value="#arguments.abv#" cfsqltype="cf_sql_decimal">
                    ,ibu = <cfqueryparam value="#arguments.ibu#" cfsqltype="cf_sql_decimal">
                WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn arguments.id>
        <cfelseif arguments.id EQ 0>
            <cfset var result = "">
            <cfquery result="result">
                INSERT INTO dbo.Beer
                ( name, breweryId, type, abv, ibu )
                VALUES ( <cfqueryparam value="#arguments.name#" 
                          null="#hs.isEmptyString( arguments.name )#" cfsqltype="cf_sql_varchar">
                        ,<cfqueryparam value="#arguments.breweryId#"
                          null="#hs.isEmptyString( arguments.breweryId )#" cfsqltype="cf_sql_integer">
                        ,<cfqueryparam value="#arguments.type#" 
                          null="#hs.isEmptyString( arguments.type )#" cfsqltype="cf_sql_varchar">
                        ,<cfqueryparam value="#arguments.abv#" cfsqltype="cf_sql_decimal">
                        ,<cfqueryparam value="#arguments.ibu#" cfsqltype="cf_sql_decimal">
                )
            </cfquery>
            <cfreturn result.generatedkey>
        </cfif>
    </cffunction>
    
    <cffunction name="delete" access="public" returntype="void">
        <cfargument name="id" type="numeric" required="true">
        <cfquery>
            DELETE FROM dbo.Beer
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>
</cfcomponent>