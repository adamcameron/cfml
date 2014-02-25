<cfscript>
//tagCount.cfm
tagTallies = {};
linesOfCode = 0;
overallTally = 0;

xmlParse(expandPath("/WEB-INF/cftags/META-INF/taglib.cftld"))
	.search("/taglib/tag/name/text()")
	.each(function(v){
		tagTallies[v.xmlValue] = 0;
	});


directoryList("C:\temp\code\", true, "array", "*.cf?", "directory, name").each(function(filePath){
	var code = fileRead(filePath);
	linesOfCode += code.listLen(chr(13) & chr(10));

	reMatchNoCase("<cf[a-z]+", code).each(function(tag){
		var tagName = tag.removeChars(1, 3);
		overallTally++;
		if (structKeyExists(tagTallies, tagName)){
			tagTallies[tagName]++;	
		}else{
			tagTallies[tagName] = 1;
		}
	});
});

writeOutput('<table border="1"><thead><tr><th>Place</th><th>Tag</th><th>Count</th><th>Percent</th></tr></thead><tbody>');
tagTallies.sort("numeric", "DESC").each(function(v){
	param place=0;
	if (tagTallies[v]){
		writeOutput("<tr><td>#++place#</td><td>#v#</td><td>#tagTallies[v]#</td><td>#numberFormat((tagTallies[v]/overallTally)*100,'99.99')#</td></tr>");
	}
});
writeOutput("</tbody></table>");
writeDump({linesOfCode=linesOfCode});
</cfscript>