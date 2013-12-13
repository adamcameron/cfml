<cfscript>
truths = [-2,-1,1,2,true,'"yes"'];

for (A in truths){
	test(A, true);
	for (B in truths){
		same = A==B;
		bothNumeric = isNumeric(A) && isNumeric(B);
		expression =
		test("#A# EQ #B#", same || !bothNumeric);
	}
	writeOutput("<hr>");
}

function test(expression, expected){
	var result = evaluate("#expression# ? true : false");
	var colour = result == expected ? "green" : "red";

	writeOutput('<span style="color:#colour#">#expression#: #result#</span><br>');
}
</cfscript>