<cfflush interval="1">
<cfset o = createObject("webservice", "http://localhost:8308/shared/CF/CFML/tags/extensibility/function/ReturnTypeStructVoidReturn.cfc?wsdl")>

<cfdump var="#o.f(raiseException=false)#" label="false">
<cftry>
<cfdump var="#o.f(raiseException=true)#" label="true">
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>

<cfset o = createObject("component", "shared.CF.CFML.tags.extensibility.function.ReturnTypeStructVoidReturn")>

<cfdump var="#o.f(raiseException=false)#" label="false">
<cftry>
<cfdump var="#o.f(raiseException=true)#" label="true">
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>


