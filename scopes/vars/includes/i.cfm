<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope() top of include">
<cfdump var="#variables#" label="variables top of include">

<cfset stVars.inInclude = true>
<cfset unScopedInInclude = true>

<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope() bottom of include">
<cfdump var="#variables#" label="variables bottom of include">
