<cfflush interval="128">

<cfset oFusionContext = createObject("java", "coldfusion.filter.FusionContext")>
<cfdump var="#oFusionContext#">
<cfdump var="#oFusionContext.getServletContext()#">
<cfabort>
<cfset oCfml = createObject("component", "com.pixl8.sycamore.components.util.Cfml")>

<cfscript>
	o = oHttpServletRequestWrapper.getAuthType();
	oCfml.cfDUmp(o);
	oCfml.cfAbort();
	while(o.hasMoreElements()){
		writeOutput(o.next());
	}

</cfscript>
