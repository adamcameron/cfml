<cffile action="read" file="#expandPath('./Word.xml')#" variable="sDoc" charset="utf-8">
<cfset xDoc = xmlParse(SDoc)>
<cfdump var="#xDoc#">