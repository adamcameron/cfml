<cfquery name="oQuery" datasource="intranet">
	select	*
	from	circuits
	where rownum <= 1
</cfquery>

<cfscript>
	oClass = createObject("java", "java.lang.Class");
//	oQuery = queryNew("");
	thisClass = oQuery.getClass();
	while (isDefined("thisClass")){
		writeOutput(thisClass.getName() & "<br />");
		thisClass = oClass.forName(thisClass.getName()).getSuperClass();
	}
</cfscript>