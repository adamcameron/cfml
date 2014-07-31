<!--- redden.cfm --->
<cfimport taglib="lib" prefix="t">

<t:requiredAttributes message="G'day world">


<cftry>
	<t:requiredAttributes>
	<cfcatch type="MissingAttributeException" >
		<cfdump var="#[cfcatch.type,cfcatch.message,cfcatch.detail]#">
	</cfcatch>
</cftry>