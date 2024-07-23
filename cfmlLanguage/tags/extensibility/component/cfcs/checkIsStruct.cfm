<cfset o =createObject("component", "cfml")>
<cfdump var="#isStruct(o)#">
<cfdump var="#getmetaData(o)#">
<cfdump var="#getmetaData(structNew()).getname()#">