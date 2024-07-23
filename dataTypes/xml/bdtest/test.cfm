<cfxml variable="xDoc">
<aaa>
	<bbb />
	<bbb ccc="ddd" />
	<bbb>eee</bbb>
	<bbb>
		<fff ggg="hhh">iii</fff>
	</bbb>
</aaa>
</cfxml>
<cfdump var="#xDoc#" label="Actual doc">
<br />
<cfset aX = xDoc.aaa.bbb><!--- This is an array of four bbb nodes --->

<cfoutput>
	Is it an array? #isArray(aX)#<br />
	How long is the array: #arrayLen(aX)#<br />
	Is it XML? #isXml(aX)#<br />
</cfoutput>

<cfdump var="#aX#" label="Only dumps out first element">
<br />
<!--- demonstrate it DOES contain all four nodes --->
Check each element:<br />
<cfloop index="i" from="1" to="#arrayLen(aX)#">
	<cfdump var="#aX[i]#" label="aX[#i#]">
</cfloop>


<cffunction name="f" returntype="string">
	<cfargument name="arg1" type="array" required="false">
	<cfargument name="arg2" type="xml" required="false">
	<cfargument name="arg3" type="any" required="false">
	<cfreturn "Function executed fine">
</cffunction>

<cfoutput>
<cftry>
	Passing as array argument: #f(arg1=aX)#
	<cfcatch>#cfcatch.message#</cfcatch>
</cftry>
<br />
<cftry>
	Passing as XML argument: #f(arg2=aX)#
	<cfcatch>#cfcatch.message#</cfcatch>
</cftry>
<br />
<cftry>
	Passing as "any" argument: #f(arg3=aX)#
	<cfcatch>#cfcatch.message#</cfcatch>
</cftry>
<br />
</cfoutput>

<cfset arrayAppend(aX, xmlElemNew(aX, "jjj"))>