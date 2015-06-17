<cfparam name="URL.rows" type="integer">
<cfparam name="URL.cols" type="integer">
<cfparam name="URL.dataLen" type="integer">
<cfscript>
	lCols = "";
	for (i=1; i le URL.cols; i=i+1){
		lCols = listAppend(lCols, "col#i#");
	}
	q = queryNew(lCols);

	for (iRow=1; iRow le URL.rows; iRow=iRow+1){
		queryAddRow(q);
		for (iCol=1; iCol le URL.cols; iCol=iCol+1){
			sCol = listGetAt(lCols, iCol);
			sData = repeatString(chr(randRange(65, 90)), URL.dataLen);
			querySetCell(q, sCol, sData);
		}
	}
</cfscript>
<cfsavecontent variable="sDump">
	<cfdump var="#q#">
</cfsavecontent>
<cffile action="write" file="#expandPath('./dump_#URL.rows#_#URL.cols#_#URL.dataLen#.html')#" output="#sDump#">
<cfoutput>#sDump#</cfoutput>