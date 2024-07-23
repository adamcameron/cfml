<cfapplication name="test1">
<cfset application.test1.key = "value1">
<cfapplication name="test2">
<cfset application.test2.key = "value2">

<cfset oAppScopeTracker = createObject("java", "coldfusion.runtime.ApplicationScopeTracker").init()>
<cfset stTemp = oAppScopeTracker.getApplicationScope('test1')>
<cfdump var="#stTemp#">
<cfset stTemp = oAppScopeTracker.getApplicationScope('test2')>
<cfdump var="#stTemp#">
<cfset stTemp.test2.key = "updated">
<cfset stTemp = oAppScopeTracker.getApplicationScope('test2')>
<cfdump var="#stTemp#">
