<cftry>
	<cfinclude template="/Application.cfm">
	<cfcatch><!--- no probs... just wanted to load this for a client-specific situation ---></cfcatch>
</cftry>


<cfset cv = createObject("java", "ClassViewer")>
<cfset q = application.intranet.variableCache.getPageObject.en.5c['en-618739FB-B060-CF7D-E848-562216BD1B0C'].value>
<pre>
<cfoutput>#cv.viewObject(q["uuid"])#</cfoutput>
</pre>

<cfdump var="#q['uuid'].size()#">

<cfsetting showdebugoutput="no">