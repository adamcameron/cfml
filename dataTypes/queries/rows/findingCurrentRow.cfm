<cfscript>
/**
 * Removes rows from a query.
 * Added var col = "";
 * No longer using Evaluate. Function is MUCH smaller now.
 * 
 * @param Query 	 Query to be modified 
 * @param Rows 	 Either a number or a list of numbers 
 * @return This function returns a query. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, October 11, 2001 
 */
function QueryDeleteRows(Query,Rows) {
	var tmp = QueryNew(Query.ColumnList);
	var i = 1;
	var x = 1;

	for(i=1;i lte Query.recordCount; i=i+1) {
//		if(not ListFind(Rows,i)) {
		if(Rows neq i) {
			QueryAddRow(tmp,1);
			for(x=1;x lte ListLen(tmp.ColumnList);x=x+1) {
				QuerySetCell(tmp, ListGetAt(tmp.ColumnList,x), query[ListGetAt(tmp.ColumnList,x)][i]);
			}
		}
	}
	return tmp;
}

q = queryNew("i,c");

for (i=1; i le 100; i=i+1){
	queryAddRow(q);
	querySetCell(q, "i", i);
	querySetCell(q, "c", createUuid());
}
</cfscript>

<cffunction name="QueryDeleteRows2" returntype="query" output="false">
	<cfargument name="query" type="query" required="true">
	<cfargument name="rows" type="string" required="true">
	<cfset var q = false>
	<cfquery name="q" dbtype="query">
		select	*
		from	arguments.query
<!--- 		where	i not in (#arguments.rows#) --->
 		where	i <> #arguments.rows#
	</cfquery>
	<cfreturn q>
</cffunction>


<cf_timeit>
<cfset q2 = QueryDeleteRows(q, 5)>
</cf_timeit>

<cf_timeit>
<cfset q3 = QueryDeleteRows2(q, 5)>
</cf_timeit>
