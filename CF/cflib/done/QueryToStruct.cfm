<cffunction name="QueryToStruct" returntype="any" hint="Converts a query to a struct, or an array of structs">
    <cfargument name="query" type="query" required="true"/>
    <cfargument name="row" type="query"/>
    <cfargument name="forceArray" type="boolean" default="false"/>

    <cfscript>
    var local = StructNew();
    var result = StructNew();
    var idx = "";
    var colName = "";
    var columnLabels = arguments.query.getMetaData().getColumnLabels();
    </cfscript>

    <cfif isDefined("arguments.row")>
        <cfset local.row = arguments.row/>
    <cfelseif arguments.query.recordCount eq 1>
        <cfset local.row = 1/>
    </cfif>

    <cfif isDefined("local.row") and not arguments.forceArray>
        <cfloop array="#columnLabels#" index="colName">
            <cfset StructInsert(result, colName, arguments.query[colName][local.row])/>
        </cfloop>
    <cfelseif isDefined("local.row")>
        <cfset result = ArrayNew(1)/>
        <cfset ArrayAppend(result, StructNew())/>
        <cfloop array="#columnLabels#" index="colName">
            <cfset StructInsert(result[1], colName, arguments.query[colName][local.row])/>
        </cfloop>
    <cfelse>
        <cfset result = ArrayNew(1)/>

        <cfloop from="1" to="#arguments.query.recordCount#" index="idx">
            <cfset local.tempStruct = StructNew()/>

            <cfloop array="#columnLabels#" index="colName">
                <cfset StructInsert(local.tempStruct, colName, arguments.query[colName][idx])/>
            </cfloop>

            <cfset ArrayAppend(result, local.tempStruct)/>
        </cfloop>
    </cfif>

    <cfreturn result/>
</cffunction>


<cfscript>
/**
 * Converts a query object into an array of structures.
 * 
 * @param query 	 The query to be transformed 
 * @return This function returns a structure. 
 * @author Nathan Dintenfass (&#110;&#97;&#116;&#104;&#97;&#110;&#64;&#99;&#104;&#97;&#110;&#103;&#101;&#109;&#101;&#100;&#105;&#97;&#46;&#99;&#111;&#109;) 
 * @version 1, September 27, 2001 
 */
function QueryToArrayOfStructures(theQuery){
	var theArray = arraynew(1);
	var cols = ListtoArray(theQuery.columnlist);
	var row = 1;
	var thisRow = "";
	var col = 1;
	for(row = 1; row LTE theQuery.recordcount; row = row + 1){
		thisRow = structnew();
		for(col = 1; col LTE arraylen(cols); col = col + 1){
			thisRow[cols[col]] = theQuery[cols[col]][row];
		}
		arrayAppend(theArray,duplicate(thisRow));
	}
	return(theArray);
}
</cfscript>


<cfscript>
    q = queryNew("id,name,group");
    queryAddRow(q);
    querySetCell(q,"ID","a");
    querySetCell(q,"Name","Obiwon");
    querySetCell(q,"Group","Jedi");
    queryAddRow(q);
    querySetCell(q,"ID","b");
    querySetCell(q,"Name","Adam");
    querySetCell(q,"Group","People");
</cfscript>

<cfdump var="#QueryToStruct(query=q)#"/>
<cfdump var="#QueryToArrayOfStructures(q)#">