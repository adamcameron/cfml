<cfscript>
	oX		= excelNew();

	sCsvPath= expandPath("./testNewCsv.csv");
</cfscript>
<cfexcel action="write" filename="#sCsvPath#" name="oX" format="csv" overwrite="true">
