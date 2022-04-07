<!--- caller.cfm --->
<cfset request.buffer = structNew()>
top of caller.cfm<br />
<cfset request.buffer["1. Before createObject"] = getPageContext().getOut().getString()>

<cfset o = createObject("component", "c")>
after object creation<br />
<cfset o.f()>
after f()<br />
<cfset request.buffer["4. after f()"] = getPageContext().getOut().getString()>

before dump<br />
<cfoutput>
	<table border="1">
		<cfloop collection="#request.buffer#" item="entry">
			<tr><td>#entry#</td><td>#htmlEditFormat(request.buffer[entry])#</td></tr>
		</cfloop>
	</table>

</cfoutput>
after dump<br />
<cfoutput>#getPageContext().toString()#</cfoutput><br />
