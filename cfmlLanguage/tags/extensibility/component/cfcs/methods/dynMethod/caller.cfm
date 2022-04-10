<cfset o = createObject("component", "c")>

<cfset dynamicMethod = o["f"]>
<cfoutput>#dynamicMethod()#<br /></cfoutput>

<cfset dynamicMethod = o["g"]>
<cfoutput>#dynamicMethod()#<br /></cfoutput>