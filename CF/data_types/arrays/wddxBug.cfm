<cfset source = []>
<cfwddx action="cfml2wddx" input="#source#" output="packet">
<cfwddx action="wddx2cfml" input="#packet#" output="mirrorUniverseSource">
<cfdump var="#mirrorUniverseSource#">
<cfoutput>
isArray? #isArray(mirrorUniverseSource)#<br/>
len? #arrayLen(mirrorUniverseSource)#<br/>
</cfoutput>

<cfset arrayResize(source,10)>
<cfdump var="#source#">
<cfset arrayResize(mirrorUniverseSource,10)>