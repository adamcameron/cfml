<cfcomponent displayname="Formatting functions">

    <cffunction name="longdate" access="public" returntype="string">
        <cfargument name="when" type="any">
        <cfreturn dateFormat( when, 'long' ) & " at " & timeFormat( when, 'long' )>
    </cffunction>
</cfcomponent>