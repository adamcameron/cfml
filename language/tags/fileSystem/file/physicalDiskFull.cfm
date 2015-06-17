<cfparam name="URL.max" type="integer" default="0">
<cfparam name="URL.size" type="integer" default="16">

<cfflush interval="64">

<cfset sData = repeatString("A", URL.size * 1024)>


<cfloop index="i" from="1" to="#URL.max#">
	Writing <cfoutput>#i#/#URL.max#</cfoutput>&hellip;
	<cffile action="write" file="G:\#makeFileName()#" output="#sData#">
	written<br />
</cfloop>


<cffunction name="makeFileName" output="false" returntype="string">
	<cfset var s = "">
	<cfloop index="i" from="1" to="8">
		<cfset s &= chr(65 + randRange(0,25))>
	</cfloop>
	<cfreturn s & ".dat">
</cffunction>
