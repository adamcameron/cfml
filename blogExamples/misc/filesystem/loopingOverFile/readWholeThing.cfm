<!--- readWholeThing.cfm --->
<cffile action="read" file="#expandPath('./data.txt')#" variable="data">
<cfoutput>#len(data)#</cfoutput>