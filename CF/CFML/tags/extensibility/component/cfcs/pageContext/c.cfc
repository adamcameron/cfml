<!--- c.cfc --->
<cfcomponent>
	top of cfc<br />
	<cfset request.buffer["2. CFC"] = getPageContext().getOut().getString()>
	<cfoutput>#getPageContext().toString()#</cfoutput><br />
	<cffunction name="f">
		top of function<br />
		<cfset request.buffer["3. f()"] = getPageContext().getOut().getString()>
		<cfoutput>#getPageContext().toString()#</cfoutput><br />
	</cffunction>
</cfcomponent>