<cfscript>
	oMockBox	= createObject("component", "mockbox.system.testing.MockBox").init();

	oMocked		= oMockBox.createStub();


	qMockResult	 = queryNew("usr_id,usr_firstname,usr_lastname");
	
	queryAddRow(qMockResult);
	querySetCell(qMockResult, "usr_id", 1);
	querySetCell(qMockResult, "usr_firstname", "Adam");
	querySetCell(qMockResult, "usr_lastname", "Cameron");

	oMocked.$(method="mockedMethod").$args(
		usrid		= 1,
		isactiveonly= "Adam",
		usrlastname	= "Cameron"
	).$results(qMockResult);

	qResult = oMocked.mockedMethod(
		usrid		= 1,
		isactiveonly= "Adam",
		usrlastname	= "Cameron"
	);
</cfscript>

<cfdump var="#qResult#">