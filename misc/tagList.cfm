<cfscript>
// tagList.cfm

tags = xmlParse(expandPath("/WEB-INF/cftags/META-INF/taglib.cftld"))
		.search("/taglib/tag/name/text()");
tags.sort(function(v1,v2){
	return compareNoCase(v1.xmlValue, v2.xmlValue);
});

writeOutput(
	tags.reduce(function(prev="", current){
		var tag = "&lt;cf" & current.xmlValue.lcase() & "&gt;";
		return prev & tag & "<br>";
	})
);
</cfscript>