<cfscript>
	// This cfobject creates a java object of type Class.  Leave this statement as it is.
	oClass = createObject("java","java.lang.Class");
	// The java class name for your driver is the argument for Class.forName
	oClass.forName("macromedia.jdbc.MacromediaDriver");
	// This cfobject creates a DriverManager java object which provides your connection
	oDriverManager = createObject("java", "java.sql.DriverManager");
    // The getConnection method takes the JDBC URL for your driver as its arguement

	oCon = oDriverManager.getConnection(
		"jdbc:macromedia:sqlserver://localhost:1433;databaseName=tn;SelectMethod=direct;sendStringParametersAsUnicode=false;MaxPooledStatements=1000",
		"tn",
		"tn"
	);

	oMetadata = oCon.getMetaData();

</cfscript>
<cfdump var="#oMetadata#">