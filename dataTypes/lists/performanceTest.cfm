<cfsetting requesttimeout="10" showdebugoutput="yes">
<cffunction name="f">
	<cfargument name="list" type="string" required="yes">
	<cfargument name="delimiter" type="string" required="no" default=",">

	<cfset var returnValue = ''>
	<cfset var element = ''>

	<cfloop index="element" list="#arguments.list#" delimiters="#arguments.delimiter#">
		<cfif not listFind(returnValue, element)>
			<cfset returnValue = listAppend(returnValue, element, arguments.delimiter)>
		</cfif>
	</cfloop>
	<cfreturn returnValue>

</cffunction>

<cfscript>
/**
 * Case-sensitive function for removing duplicate entries in a list.
 * Based on dedupe by Raymond Camden
 * 
 * @param list 	 The list to be modified. 
 * @return Returns a list. 
 * @author Jeff Howden (jeff@members.evolt.org) 
 * @version 1, March 21, 2002 
 */
function ListDeleteDuplicates(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  for(i = 1; i LTE ArrayLen(list); i = i + 1)
    if(NOT ListFind(returnValue, list[i], delimiter))
      returnValue = ListAppend(returnValue, list[i], delimiter);
  return returnValue;
}

</cfscript>
<cftimer label="makelist" style="inline">
<cfscript>
myList = "";
for (i=1; i le 1000; i=i+1){
	myList = listAppend(myList, i);
}
for (i=1; i le 5; i=i+1){
	myList = listAppend(myList, myList);
}

</cfscript>
</cftimer>
<br />

<cftimer label="cflib" style="inline">
<cfset ListDeleteDuplicates(myList)>
</cftimer>
<br />
<cftimer label="adam" style="inline">
<cfset f(myList)>
</cftimer>
<br />