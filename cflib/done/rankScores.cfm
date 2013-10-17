<cfscript>
void function rankScores(required query query, required string scoreColumn, required string rankColumn, sortOrder="ASC"){
	var currentRank		= 0;
	var previousScore	= 0;
	var rankIncrement	= 1;
	var row				= 0;

	if (!(listFindNoCase(query.columnlist, scoreColumn) || listFindNoCase(query.columnlist, rankColumn))) {
		throw(type="InvalidColumnException", message="Invalid score or rank column", detail="One or both of #scoreColumn# or #rankColumn# not found in #query.columnlist#");
	}

	if (!isValid("Regex", sortOrder, "(?i)^(?:ASC|DESC)$" )){
		throw(type="InvalidArgumentException", message="Invalid sortOrder", detail="The sortOrder argument - current value #sortOrder# - must be one of ASC or DESC");
	}

	if (sortOrder == "ASC"){
		previousScore = arrayMin(query[scoreColumn]) - 1;
	}else{
		previousScore = arrayMax(query[scoreColumn]) + 1;
	}

	for (row=1; row <= arrayLen(query[scoreColumn]); row++){
		if (query[scoreColumn][row] == previousScore){
			rankIncrement++;
		}else{
			currentRank += rankIncrement;
			rankIncrement = 1;
		}
		query[rankColumn][row] = currentRank;

		previousScore = query[scoreColumn][row];
	}
}



qBase = queryNew("id,score,rank");
for (i=1; i <= 10; i++){
	queryAddRow(qBase);
	querySetCell(qBase, "id", i);
	querySetCell(qBase, "score", randRange(1,5));
}

qSorted = new Query(sql="SELECT * FROM qBase ORDER BY score", dbtype="query", qBase=qBase).execute().getResult();
writeDump(var=qSorted, label="Before");

rankScores(qSorted, "score", "rank", "ASC");

writeDump(var=qSorted, label="After");
</cfscript>
