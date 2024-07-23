<cfscript>
a = [];
a[1] = "Tahi";
a[3] = "Toru";
a[5] = "Rima";
a[7] = "Whitu";
a[9] = "Iwa";
a[11] = "tekau ma tahi";
arrayDeleteAt(a, 11);	// leaves the last element, 10, empty

arrayEach(
	a,
	function(element){
		if (isDefined("element")){
			writeOutput(uCase(element));
		}else{
			writeOutput("Not defined");
		}
		writeOutput("<br />");
	}
);
</cfscript>