<cfcomponent displayname="Brewery service" accessors="true">

    <!--- alternate way of using Dependency Injection to load necessary objects --->
    <cffunction name="init">
        <cfargument name="helperService">
        <cfset variables.hs = arguments.helperService>
    </cffunction>
    
    <cffunction name="getAllBreweries" access="public" returntype="query">
        <cfset var q = "">
        <cfquery name="q">
            SELECT  id
                    ,name
                    ,city
                    ,state
                    ,country
            FROM dbo.Brewery
            ORDER BY name
        </cfquery>
        <cfreturn q>
    </cffunction>
    
    <cffunction name="getBrewery" access="public" returntype="query">
        <cfargument name="id" required="true" type="numeric">
        <cfset var q = "">
        <cfquery name="q">
            SELECT  id
                    ,name
                    ,city
                    ,state
                    ,country
            FROM dbo.Brewery
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn q>
    </cffunction>
    
    <cffunction name="save" access="public" returntype="numeric">
        <cfargument name="id" type="numeric" default=0>
        <cfargument name="name" type="string" default="">
        <cfargument name="city" type="string" default="">
        <cfargument name="state" type="string" default="">
        <cfargument name="country" type="string" default="">
        <cfset var breweryExists = getBrewery( id ).recordcount>
        <cfif arguments.id GT 0 AND breweryExists>
            <cfquery>
                UPDATE dbo.Brewery
                SET name = <cfqueryparam value="#arguments.name#" 
                        null="#hs.isEmptyString( arguments.name )#" cfsqltype="cf_sql_varchar">
                    ,city = <cfqueryparam value="#arguments.city#" 
                        null="#hs.isEmptyString( arguments.city )#" cfsqltype="cf_sql_varchar">
                    ,state = <cfqueryparam value="#arguments.state#" 
                        null="#hs.isEmptyString( arguments.state )#" cfsqltype="cf_sql_varchar">
                    ,country = <cfqueryparam value="#arguments.country#" 
                        null="#hs.isEmptyString( arguments.country )#" cfsqltype="cf_sql_varchar">
                WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn arguments.id>
        <cfelseif arguments.id EQ 0>
            <cfset var result = "">
            <cfquery result="result">
                INSERT INTO dbo.Brewery
                ( name, city, state, country )
                VALUES ( <cfqueryparam value="#arguments.name#" 
                          null="#hs.isEmptyString( arguments.name )#" cfsqltype="cf_sql_varchar">
                        ,<cfqueryparam value="#arguments.city#" 
                          null="#hs.isEmptyString( arguments.city )#" cfsqltype="cf_sql_varchar">
                        ,<cfqueryparam value="#arguments.state#" 
                          null="#hs.isEmptyString( arguments.state )#" cfsqltype="cf_sql_varchar">
                        ,<cfqueryparam value="#arguments.country#" 
                          null="#hs.isEmptyString( arguments.country )#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfreturn result.generatedkey>
        </cfif>
    </cffunction>
    
    <cffunction name="delete" access="public" returntype="void">
        <cfargument name="id" type="numeric" required="true">
        <cfquery>
            DELETE FROM dbo.Brewery
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>
</cfcomponent>