<cfset o = createObject("component", "cProp")>

<cfset md = getMetadata(o)>
<cfset getMetadata(o).properties[1].value = "test">
<cfdump var="#md#" label="metadata">
<cfdump var="#o#" label="object">
<cfset o.f()>


