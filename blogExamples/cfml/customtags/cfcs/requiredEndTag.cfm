<!--- redden.cfm --->
<cfimport taglib="lib" prefix="t">

<t:RequiredEndTag message="G'day world" />


<cftry>
	<t:RequiredEndTag>
	<cfcatch type="MissingEndTagException">
		<cfdump var="#[cfcatch.type,cfcatch.message,cfcatch.detail]#">
	</cfcatch>
</cftry>