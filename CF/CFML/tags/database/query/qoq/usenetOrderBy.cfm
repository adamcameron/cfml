<!--- <cfscript>
   qOriginal = queryNew("sName", "VarChar");
   newRow = queryAddRow(qOriginal, 7);

   querySetCell(qOriginal, "sName", "AAA", 4);
   querySetCell(qOriginal, "sName", "aaa", 6);
   querySetCell(qOriginal, "sName", " Space test", 3);
   querySetCell(qOriginal, "sName", "bbb", 1);
   querySetCell(qOriginal, "sName", "Ccc", 5);
   querySetCell(qOriginal, "sName", " another space test", 5);
   querySetCell(qOriginal, "sName", "c c C C", 2);
 </cfscript> --->

<cfscript>
	qOriginal = queryNew("sName", "VarChar");

	queryAddRow(qOriginal); querySetCell(qOriginal, "sName", "bbb");
	queryAddRow(qOriginal); querySetCell(qOriginal, "sName", "c c C C");
	queryAddRow(qOriginal); querySetCell(qOriginal, "sName", " Space test");
	queryAddRow(qOriginal); querySetCell(qOriginal, "sName", "AAA");
//	queryAddRow(qOriginal); querySetCell(qOriginal, "sName", "Ccc");
	queryAddRow(qOriginal); querySetCell(qOriginal, "sName", " another space test");
	queryAddRow(qOriginal); querySetCell(qOriginal, "sName", "aaa");
//	queryAddRow(qOriginal);
</cfscript>

<cfdump var="#qOriginal#"/>

<cfquery dbtype="query" name="qNewStar">
	SELECT *
	FROM qOriginal
	ORDER BY sName ASC
</cfquery>
<cfdump var="#qNewStar#">

<cfquery dbtype="query" name="qNewNames">
	SELECT sName
	FROM qOriginal
	ORDER BY sName ASC
</cfquery>
<cfdump var="#qNewNames#">

<cfquery dbtype="query" name="qNewNum">
	SELECT sName as sName, upper(sName) as sNameUpper
	FROM qOriginal
	ORDER BY sNameUpper ASC
</cfquery>
<cfdump var="#qNewNum#">