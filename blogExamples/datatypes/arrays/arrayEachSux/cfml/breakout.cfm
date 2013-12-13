<cfscript>
rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
arrayeach(
	rainbow,
	function(v){
		param i=0;
		rainbow[++i] = ucase(v);
	}
);
writeOutput(rainbow.toString() & "<br>");
writeOutput(i); 
</cfscript>