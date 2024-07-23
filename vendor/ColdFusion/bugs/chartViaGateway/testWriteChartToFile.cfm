<!--- testWriteChartToFile.cfm --->
<cfset fileName = createUuid()>
<cfset new Chart().writeChartToFile(fileName)>
<cfoutput><img src="#fileName#.png"></cfoutput>