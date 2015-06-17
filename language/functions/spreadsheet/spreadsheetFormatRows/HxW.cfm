<!--- Get the spreadsheet data as a query. ---> 
<cfquery name="qCourses" datasource="cfdocexamples"> 
       SELECT	CORNUMBER,DEPT_ID,CORLEVEL,COURSE_ID,CORNAME,CORDESC,LASTUPDATE 
       FROM		COURSELIST 
</cfquery> 
 
<cfscript> 
	sFileName	= getDirectoryFromPath(getCurrentTemplatePath()) & "qCourses.xls"; 
	oXlsSheet	= spreadsheetNew("CourseData"); 
	spreadsheetAddRows(oXlsSheet, qCourses); 
	stFormat	= { 
		font				= "Courier", 
		fontsize			= "10", 
		color				= "dark_blue,", 
		italic				= "true", 
		bold				= "true", 
		alignment			= "left", 
		textwrap			= "true", 
		fgcolor				= "pale_blue", 
		bottomborder		= "thick", 
		bottombordercolor	= "blue_grey", 
		topbordercolor		= "blue_grey", 
		topborder			= "thick", 
		leftborder			= "dotted", 
		leftbordercolor		= "blue_grey", 
		rightborder			= "dotted", 
		rightbordercolor	= "blue_grey"
	};
	spreadsheetFormatRow(oXlsSheet, stFormat, "5"); 
	//oXlsSheet.setColumnWidth(0, 20*256);
</cfscript> 
 
<cfspreadsheet
	action	= "write"
	filename	= "#sFileName#"
	name		= "oXlsSheet"  
    sheet		= "1"
	sheetname	= "qCourses"
	overwrite	= "true"
>