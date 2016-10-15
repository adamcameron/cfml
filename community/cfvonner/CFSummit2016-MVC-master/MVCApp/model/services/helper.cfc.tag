<cfcomponent displayname="Helpful functions">

    <cffunction name="isEmptyString" access="public" returntype="string">
        <cfargument name="str" required="true" type="string">
        <cfreturn Len( Trim ( str ) ) EQ 0>
    </cffunction>
</cfcomponent>