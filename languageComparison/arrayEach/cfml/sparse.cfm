<cfscript>
rainbow = [];
rainbow[1] = "Whero";
// no [2]
rainbow[3] = "Kowhai";
// no [4]
rainbow[5] = "Kikorangi";
// no [6]
rainbow[7] = "Mawhero";

callCounter = 0;
arrayEach(
	rainbow,
	function(v){
		callCounter++;
		if (structKeyExists(arguments, "v")){
			writeOutput(v & "<br>");
		}
	}
);
writeOutput("callback was called: " & callCounter & " times");
</cfscript>