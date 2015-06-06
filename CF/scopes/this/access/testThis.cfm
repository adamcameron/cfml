<cfset o = createObject("component", "C")>

<cfoutput>
<cftry>
	Calling privateFunction()&hellip;<br />
	<cfset o.privateFunction()>
	Called OK<br />
	<cfcatch>
		Error calling method: [#cfcatch.message#][#cfcatch.detail#]<br />
	</cfcatch>
</cftry>
<hr />

<cftry>
	Calling publicFunction()&hellip;<br />
	<cfset o.publicFunction()>
	Called OK<br />
	<cfcatch>
		Error calling method: [#cfcatch.message#][#cfcatch.detail#]<br />
	</cfcatch>
</cftry>
<hr />

<cftry>
	Calling publicWrapperForPrivateFunction()&hellip;<br />
	<cfset o.publicWrapperForPrivateFunction()>
	Called OK<br />
	<cfcatch>
		Error calling method: [#cfcatch.message#][#cfcatch.detail#]<br />
	</cfcatch>
</cftry>
<hr />

<cftry>
	Calling publicWrapperForPublicFunction()&hellip;<br />
	<cfset o.publicWrapperForPublicFunction()>
	Called OK<br />
	<cfcatch>
		Error calling method: [#cfcatch.message#][#cfcatch.detail#]<br />
	</cfcatch>
</cftry>
</cfoutput>
<hr />

<cfdump var="#o#">
