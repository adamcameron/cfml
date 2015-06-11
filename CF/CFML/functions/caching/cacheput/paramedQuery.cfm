<cffunction name="getUserByFilters" returntype="query" hint="Takes various optional filters and returns users matching them">
    <cfargument name="firstName" type="string" required="false">
    <cfargument name="lastName" type="string" required="false">
    <cfargument name="city" type="string" required="false">
    
    <cfset var qFilteredUsers = "">
     
    <cfquery name="qFilteredUsers" cachedwithin="#createTimespan(0, 1, 0, 0)#">
        SELECT    *
        FROM    t_users
        
        WHERE    1=1
        <cfif structKeyExists(arguments, "firstName")>
            AND    usr_firstName    = <cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">
        </cfif>
        <cfif structKeyExists(arguments, "lastName")>
            AND    usr_lastName    = <cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_idstamp">
        </cfif>
        <cfif structKeyExists(arguments, "city")>
            AND    usr_city    = <cfqueryparam value="#arguments.city#" cfsqltype="cf_sql_idstamp">
        </cfif>
    </cfquery>
    <cfreturn qFilteredUsers>
</cffunction>

<cffunction name="getUserByFilters2" returntype="query" hint="Takes various optional filters and returns users matching them">
    <cfargument name="firstName" type="string" required="false">
    <cfargument name="lastName" type="string" required="false">
    <cfargument name="city" type="string" required="false">
    
    <cfset var qFilteredUsers = "">
    <cfset var sCacheKey = "getUserByFilters2" & hash(arguments[1] & arguments[2] & arguments[3])>
    
    <cfset qFilteredUsers = cacheGet(sCacheKey)>
    <cfif structKeyExists(local, "qFilteredUsers") && isQuery(qFilteredUsers)>
        <cfreturn qFilteredUsers>
    <cfelse>
        <cfquery name="qFilteredUsers">
            SELECT    *
            FROM    t_users
            
            WHERE    1=1
            <cfif structKeyExists(arguments, "firstName")>
                AND    usr_firstName    = <cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">
            </cfif>
            <cfif structKeyExists(arguments, "lastName")>
                AND    usr_lastName    = <cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_idstamp">
            </cfif>
            <cfif structKeyExists(arguments, "city")>
                AND    usr_city    = <cfqueryparam value="#arguments.city#" cfsqltype="cf_sql_idstamp">
            </cfif>
        </cfquery>
        <cfset cachePut(sCacheKey, qFilteredUsers, createTimespan(0, 1, 0, 0))>
        <cfreturn qFilteredUsers>
    </cfif>
</cffunction>

<cfset q1 = getUserByFilters2(firstName="Alan")>
<cfset q2 = getUserByFilters2(lastName="Brown")>
<cfset aCache = cacheGetAllIds()>
<cfdump var="#variables#">