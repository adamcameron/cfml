<cfscript>
	oCv = createObject("java", "ClassViewer");

	// This cfobject creates a java object of type Class.  Leave this statement as it is.
	oClass = createObject("java","java.lang.Class");
	// The java class name for your driver is the argument for Class.forName
	oClass.forName("macromedia.jdbc.MacromediaDriver");
	// This cfobject creates a DriverManager java object which provides your connection
	oDriverManager = createObject("java", "java.sql.DriverManager");
    // The getConnection method takes the JDBC URL for your driver as its arguement
	/*
	oCon = oDriverManager.getConnection(
		"jdbc:macromedia:sqlserver://localhost:1434;databaseName=scratch;SelectMethod=direct;sendStringParametersAsUnicode=false;MaxPooledStatements=1000",
		"scratch",
		"scratch"
	);
	*/
	oCon = oDriverManager.getConnection(
		"jdbc:macromedia:oracle://localhost:1521;SID=oraadam;AuthenticationMethod=userIDPassword;sendStringParametersAsUnicode=false;querytimeout=0;MaxPooledStatements=300",
		"icm24",
		"icm24"
	);
	oMetadata = oCon.getMetaData();

	oProcs = oMetaData.getProcedures(
		javaCast("null", ""),
		"ICM24",
		"%"
	);

	while (oProcs.next()){
		sSchema		= oProcs.getString('PROCEDURE_SCHEM');
		sProcName	= oProcs.getString('PROCEDURE_NAME');

		oProcColumns = oMetaData.getProcedureColumns(
			javaCast("null", ""),
			sSchema,
			sProcName,
			"%"
		);

		if (oProcs.getString('PROCEDURE_TYPE') eq 1){
			sProcType = "PROCEDURE";
		}else if (oProcs.getString('PROCEDURE_TYPE') eq 2){
			sProcType = "FUNCTION";
			oProcColumns.next();
			sColName = oProcColumns.getString("COLUMN_NAME");
			sColTypeName = oProcColumns.getString("TYPE_NAME");
			writeOutput("#sColTypeName# #sColName# ");
		}

		writeOutput("#sProcType# #sSchema#.#sProcName#");

		writeOutput("(");
		cSep = "";
		while (oProcColumns.next()){
			sColName = oProcColumns.getString("COLUMN_NAME");
			sColType = oProcColumns.getString("COLUMN_TYPE");

			iColType = oProcColumns.getString("COLUMN_TYPE");
			if (iColType eq 1){
				sColType = "IN";
			}else if (iColType eq 4){
				sColType = "OUT";
			}else{
				sColType = iColType;
			}


			sColTypeName = oProcColumns.getString("TYPE_NAME");
			writeOutput("#cSep# #sColType# #sColTypeName# #sColName#");
			cSep = ",";
		}
		writeOutput(")<br />");

	}

</cfscript>
<cfdump var="#oProcColumns#">