<cfscript>
rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];

arrayEach(
	rainbow,
	function(v){
		return ucase(v);
	}
);

writeOutput(rainbow.toString());
</cfscript>