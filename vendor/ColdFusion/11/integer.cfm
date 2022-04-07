<cfscript>
values = ["100", "100.00", "1,000", "1,000.00", "$1,000", "$1000.00", "$,1,2,$,2352345,$", "0,6", "1,2,3,4"];

values.each(function(value){
	var expression = 'isValid("integer", "#value#")';
	writeOutput("#expression#: #evaluate(expression)#<br>");
	try {
		writeOutput("Can be <em>used</em> as integer by CFML: ");
		1 MOD value;
		writeOutput(" YES");
	}catch(any e){
		writeOutput(" NO: #e.message#");
	}
	writeOutput("<br><hr>");
});
</cfscript>