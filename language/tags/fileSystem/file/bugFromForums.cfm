 <cfset sServerPathFull = "C:\Program Files\cigna\excel2querytest.xls">
 <cfset sNewFile = "C:\Program Files\cigna\excel2querytesta.xls">

 <!--- THIS ALWAYS RETURNS: YES --->
 <cfoutput>#FileExists(sServerPathFull)#</cfoutput>

 <!--- THIS GENERATES AN ERROR --->
 <cffile action="RENAME" source="C:\Program Files\cigna\excel2querytest.xls"
destination="C:\Program Files\cigna\excel2querytesta.xls" attributes="Normal">

 <!--- AS DOES THIS --->
 <cffile action="RENAME" source="#sNewFile#" destination="#sServerPathFull#"
attributes="Normal">