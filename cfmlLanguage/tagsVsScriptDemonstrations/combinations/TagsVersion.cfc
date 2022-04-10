<cfcomponent output="false">

    <cffunction name="getCombinations" returntype="array" access="public" output="false">
        <cfargument name="array" type="array" required="true">

        <cfset working = duplicate(array)>
        <cfset combinations = arrayNew(1)>
        <cfloop array="#array#" item="prefix">
            <cfset arrayDeleteAt(working, 1)>
            <cfset subCombinations = arrayNew(1)>
            <cfloop array="#working#" item="element">
                <cfset arrayAppend(subCombinations, "#prefix##element#")>
            </cfloop>
            <cfset arrayAppend(combinations, subCombinations, true)>
        </cfloop>
        <cfreturn combinations>
    </cffunction>

</cfcomponent>
