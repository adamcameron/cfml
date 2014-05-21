<cfscript>
seasons = "kōanga,raumati,ngahuru,hōtoke";

cfloop(list=seasons, index="season"){
	writeOutput("#season#<br>");
}
</cfscript>