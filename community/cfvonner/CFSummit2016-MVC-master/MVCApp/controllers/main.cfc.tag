<cfcomponent accessors="true">

    <cffunction name="init" access="public" returntype="any">
        <cfargument name="fw" >
        <cfset variables.fw = arguments.fw>
        <cfreturn this>
    </cffunction>
    
    <cffunction name="default" access="public" returntype="void">
        <cfargument name="rc" >
    </cffunction> 
</cfcomponent>