<cfscript>
colours =  ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
cfloop(array=colours, index="colour"){
	writeOutput("#colour#<br>");
}
</cfscript>