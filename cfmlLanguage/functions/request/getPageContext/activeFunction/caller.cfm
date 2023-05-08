<h1>INCLUDE</h1>
<cfinclude template="./grabLocalScope.cfm">
<hr />
<h1>FUNCTION</h1>
<cffunction name="f">
	<cfinclude template="./grabLocalScope.cfm">
</cffunction>
<cfset f()>
<hr />