<cfscript>
	q1 = queryNew("lastname,firstname");
	queryAddRow(q1);
	q1["lastname"][1] = "Cameron";
	q1["firstname"][1] = "Adam";
	queryAddRow(q1);
	q1["lastname"][2] = "Morrissey";
	queryAddRow(q1);
	q1["lastname"][3] = "Smith";
	q1["firstname"][3] = "Jane";
	queryAddRow(q1);
	q1["firstname"][4] = "Elvis";
	queryAddRow(q1);
	q1["lastname"][5] = "Brown";
	q1["firstname"][5] = "Jim";

	dump(var=q1);

	q2 = queryNew("");
	queryAddColumn(q2, "colour", listToArray("red,orange,yellow,green,blue,indigo,violet"));

	q3 = queryNew("");
	queryAddColumn(q3, "lastName", q1["lastName"]);
	queryAddColumn(q3, "firstName", q1["firstName"]);
	queryAddColumn(q3, "colour", q2["colour"]);

	dump(var=q3);
</cfscript>
