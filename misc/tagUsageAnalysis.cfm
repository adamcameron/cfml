<cfscript>
	// count the tags
	tagTally = {};
	for (fullFilePath in directoryList(URL.directory, true, "path", "*.cf?")){
		for (tag in reMatchNoCase("<cf[a-z]+", fileRead(fullFilePath, "UTF-8"))){
			tag = removeChars(tag, 1, 1);
			if (structKeyExists(tagTally, tag)){
				tagTally[tag]++;
			}else{
				tagTally[tag] = 1;
			}
		}
	}


	// group the tallies
	tallies = {};
	for (tag in tagTally){
		if (structKeyExists(tallies, tagTally[tag])){
			tallies[tagTally[tag]] = listAppend(tallies[tagTally[tag]], tag);
		}else{
			tallies[tagTally[tag]] = tag;
		}
	}

	// sort 'em & output 'em
	sortedTally = structKeyArray(tallies);
	arraySort(sortedTally, "numeric", "desc");
	line = 1;
	for (tally in sortedTally){
		writeOutput("#line#: #tallies[tally]# (#tally#)<br/>");
		if (!(line++ mod 10)){
			writeOutput("<hr />");
		}
	}
</cfscript>