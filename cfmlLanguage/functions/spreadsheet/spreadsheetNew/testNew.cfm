<cfscript>
	oX		= excelNew("Sheet1,Sheet2");	// how to add more sheets?

	sXlsPath= expandPath("./testNew.xls");
	sCsvPath= expandPath("./testNew.csv");
</cfscript>
<cfexcel action="write" filename="#sXlsPath#" name="oX" overwrite="true"><!--- why only tag for writing?  flename as opposed to file --->
<cfheader name="content-disposition" value="inline; filename=#getFileFromPath(sXlsPath)#">
<cfcontent file="#sXlsPath#" reset="true" type="application/excel">