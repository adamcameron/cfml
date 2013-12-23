<!--- readWholeThing.cfm --->
<cffile action="read" file="#expandPath('./data2.txt')#" variable="data">
<cfoutput>#len(data)#</cfoutput>