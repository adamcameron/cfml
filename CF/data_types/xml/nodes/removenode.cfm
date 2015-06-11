<cfset x = xmlParse(getDirectoryFromPath(getCurrentTemplatePath()) & "sample.xml")>
<cfdump var="#x#" label="before" expand="false">
Children before:<cfoutput>#arrayLen(x.aaa.bbb.xmlChildren)#</cfoutput><br />
<cfset a = xmlSearch(x, "//ccc[@id='4']/preceding-sibling::ccc")>
<cfset i = xmlChildPos(a[1].xmlParent, "ccc", arrayLen(a)+1)>
<cfset arrayDeleteAt(x.aaa.bbb.xmlChildren, i)>

<cfdump var="#x#" label="after" expand="false">
<cfdump var="#x.aaa.bbb.xmlChildren#" label="remaining children" expand="false">
Children after:<cfoutput>#arrayLen(x.aaa.bbb.xmlChildren)#</cfoutput><br />

