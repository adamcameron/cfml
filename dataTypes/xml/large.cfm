<cfflush interval="16">
<cfset iStart = getTickCount()>
<cffile action="read" file="#expandPath('./large.xml')#" variable="sDoc">
<cfoutput>Runtime: [#getTickCount()-iStart#ms]<br /></cfoutput>
<cfoutput>len: #len(sDoc)#<br /></cfoutput>
<cfset iStart = getTickCount()>
<cfset xDoc = xmlParse(sDoc)>
<cfoutput>Runtime: [#getTickCount()-iStart#ms]<br /></cfoutput>
