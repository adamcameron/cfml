<cfflush interval="1">
Testing simple variable names&hellip;<br />
<cfset  simpleNull	= javacast("null", "")>
<cfset simpleVal	= "">
<cftry>
	<cfoutput>isNull(simpleNull): [#isNull(simpleNull)#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />

<cftry>
	<cfoutput>isNull(simpleVal): [#isNull(simpleVal)#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<hr />

Testing dotted variable names&hellip;<br />
<cftry>
	<cfoutput>isNull(variables.simpleNull): [#isNull(variables.simpleNull)#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />

<cftry>
	<cfoutput>isNull(variables.simpleVal): [#isNull(variables.simpleVal)#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<hr />

Testing associative-array variable names&hellip;<br />
<cftry>
	<cfoutput>!structKeyExists(variables, "simpleNull"): [#!structKeyExists(variables, "simpleNull")#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />
<cftry>
	<cfoutput>isNull(variables["simpleNull"]): [#isNull(variables["simpleNull"])#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />
<cftry>
	<cfoutput>!structKeyExists(variables, "simpleVal"): [#!structKeyExists(variables, "simpleVal")#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />
<cftry>
	<cfoutput>isNull(variables["simpleVal"]): [#isNull(variables["simpleVal"])#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<hr />

Testing indexed-array variable names&hellip;<br />
<cfset a = arrayNew(1)>
<cfset a[2] = "">
<cftry>
	<cfoutput>!arrayIsDefined(a, 1): [#!arrayIsDefined(a, 1)#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />
<cftry>
	<cfoutput>isNull(a[1]): [#isNull(a[1])#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />
<cftry>
	<cfoutput>!arrayIsDefined(a, 2): [#!arrayIsDefined(a, 2)#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />
<cftry>
	<cfoutput>isNull(a[2]): [#isNull(a[2])#]</cfoutput>
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<hr />