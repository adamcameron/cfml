<cfprocessingdirective pageencoding="UTF-8">
	<table><tr>
<cfscript>
a = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","é","à","è","ù","â","ê","î","ô","û","ë","ï","ü","ÿ","ç"];
arraySort(a, "text", "asc", false);
writeOutput("<td>");
writeDump(a);
writeOutput("</td>");

arraySort(a, "text", "asc", true);
writeOutput("<td>");
writeDump(a);
writeOutput("</td>");
</cfscript>
</tr></table>