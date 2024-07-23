<cfcomponent output="false">

    <cffunction name="groupByYearAndMonth" returntype="query" access="public">
        <cfargument name="ungroupedRecords" type="query" required="true">

        <cfset grouped = structNew()>
        <cfloop query="ungroupedRecords">
            <cfset y = year(settlementDate)>
            <cfset m = month(settlementDate)>
            <cfset key = "#y#-#m#">

            <cfif not structKeyExists(grouped, key)>
                <cfset grouped[key] = structNew()>
                <cfset grouped[key].stgl = 0>
                <cfset grouped[key].ltgl = 0>
            </cfif>
            <cfset grouped[key].stgl = grouped[key].stgl + ShortTermGainLoss>
            <cfset grouped[key].ltgl = grouped[key].ltgl + LongTermGainLoss>
        </cfloop>

        <cfset records = queryNew("month,year,ltgl,stgl", "Integer,Integer,Double,Double")>
        <cfloop collection="#grouped#" item="key">
            <cfset queryAddRow(records)>
            <cfset querySetCell(records, "month", listLast(key, "-"))>
            <cfset querySetCell(records, "year", listFirst(key, "-"))>
            <cfset querySetCell(records, "ltgl", grouped[key].ltgl)>
            <cfset querySetCell(records, "stgl", grouped[key].stgl)>
        </cfloop>
        <cfset querySort(records, sorter)>

        <cfreturn records>
    </cffunction>

    <cffunction name="sorter" returntype="numeric" access="private">
        <cfargument name="r1" required="true">
        <cfargument name="r2" required="true">

        <cfset yearDiff = r1.year - r2.year>
        <cfif yearDiff NEQ 0>
            <cfreturn yearDiff>
        </cfif>

        <cfreturn r1.month - r2.month>
    </cffunction>

</cfcomponent>
