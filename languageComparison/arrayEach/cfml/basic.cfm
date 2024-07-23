<cfscript>
rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];

arrayEach(
	rainbow,
	function(v){
		writeOutput(v & "<br>");
	}
);
</cfscript>