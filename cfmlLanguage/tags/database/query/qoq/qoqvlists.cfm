<cfscript>
/**
 * Returns elements in list1 that are found in list2.
 * Based on ListCompare by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param List1 	 Full list of delimited values.  
 * @param List2 	 Delimited list of values you want to compare to List1.  
 * @param Delim1 	 Delimiter used for List1.  Default is the comma.  
 * @param Delim2 	 Delimiter used for List2.  Default is the comma.  
 * @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma.  
 * @return Returns a delimited list of values. 
 * @author Michael Slatoff (michael@slatoff.com) 
 * @version 1, August 20, 2001 
 */
function ListInCommon(List1, List2)
{
  var TempList = "";
  var Delim1 = ",";
  var Delim2 = ",";
  var Delim3 = ",";
  var i = 0;
  // Handle optional arguments
  switch(ArrayLen(arguments)) {
    case 3:
      {
        Delim1 = Arguments[3];
        break;
      }
    case 4:
      {
        Delim1 = Arguments[3];
        Delim2 = Arguments[4];
        break;
      }
    case 5:
      {
        Delim1 = Arguments[3];
        Delim2 = Arguments[4];          
        Delim3 = Arguments[5];
        break;
      }        
  } 
   /* Loop through the second list, checking for the values from the first list.
    * Add any elements from the second list that are found in the first list to the
    * temporary list
    */  
  for (i=1; i LTE ListLen(List2, "#Delim2#"); i=i+1) {
    if (ListFindNoCase(List1, ListGetAt(List2, i, "#Delim2#"), "#Delim1#")){
     TempList = ListAppend(TempList, ListGetAt(List2, i, "#Delim2#"), "#Delim3#");
    }
  }
  Return TempList;
}
</cfscript>

<cfparam name="url.iterations" default="1">
<cfscript>
	q1 = queryNew("q1PK,q1Data");
	q2 = queryNew("q2PK,q1PK,q2Data");
	for (i=1; i le url.iterations; i=i+1){
		queryAddRow(q1); querySetCell(q1, "q1PK", 100000+i); querySetCell(q1, "q1Data", "q1 data for [#i#]");
		if (i mod 2){
			queryAddRow(q2); querySetCell(q2, "q2PK", 600000+i); querySetCell(q2, "q1PK", 100000+i); querySetCell(q2, "q2Data", "q2 data for [#i#]");
		}
	}
</cfscript>
<cfset createObject("java", "java.lang.Thread").sleep(2000)>
<cf_timeit>
<cfquery name="q3" dbtype="query">
	select	*
	from	q1, q2
	where	q1.q1PK = q2.q1PK
</cfquery>
</cf_timeit>
<cfset createObject("java", "java.lang.Thread").sleep(2000)>
<cf_timeit>
<cfset l1 = valueList(q1.q1PK)>
<cfset l2 = valueList(q2.q1PK)>
<cfset l3 = ListInCommon(l1, l2)>
</cf_timeit>
<cfset createObject("java", "java.lang.Thread").sleep(2000)>
<cf_timeit>
<cfset l1 = valueList(q1.q1PK)>
<cfset l2 = valueList(q2.q1PK)>
<cfset l3 = ListInCommon(l2, l1)>
</cf_timeit>