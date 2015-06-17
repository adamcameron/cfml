<cfscript>
	q1 = queryNew("digit,maori", "Integer,Varchar", [
		[1, "tahi"],
		[2, "Rua"],
		[3, "Toru"],
		[4, "Wha"]
	]);

	st = {
		digit = 5,
		maori	= "FIVE"
	}; 
	a = [st];
	
	queryAddRow(q1, a);

	st.maori = "Rima";
	
	writeDump(variables);
</cfscript>