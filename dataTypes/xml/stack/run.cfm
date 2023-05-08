<cfparam name="URL.message" default="No Message">

<cfset sXmlPath = getDirectoryFromPath(getCurrentTemplatePath()) & "stack.xml">
<cfif fileExists(sXmlPath)>
	<cfset x = xmlParse(sXmlPath)>
<cfelse>
	<cfxml variable="x">
		<stack>
			<cfoutput><entry timestamp="#dateFormat(now(), 'YYYY-MM-DD')# #timeformat(now(), 'HH:MM:SS.LLL')#">Initialised</entry></cfoutput>
		</stack>
	</cfxml>
</cfif>

<!--- append to stack --->
<cfset x.stack.xmlChildren[arrayLen(x.stack.xmlChildren)+1] = xmlElemNew(x, "entry")>
<cfset x.stack.xmlChildren[arrayLen(x.stack.xmlChildren)].xmlAttributes['timestamp'] = "#dateFormat(now(), 'YYYY-MM-DD')# #timeformat(now(), 'HH:MM:SS.LLL')#">
<cfset x.stack.xmlChildren[arrayLen(x.stack.xmlChildren)].xmltext = URL.message>

<!--- make sure stack is only five entries long --->
<cfloop condition="arrayLen(x.stack.xmlChildren) gt 5">
	<cfset arrayDeleteAt(x.stack.entry, 1)>
</cfloop>
<cffile action="write" file="#sXmlPath#" output="#toString(x)#">