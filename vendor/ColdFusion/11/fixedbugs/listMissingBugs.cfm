<cfscript>
// listMissingBugs.cfm
baseUrl = "https://bugbase.adobe.com/index.cfm?event=bug&id=";
listElements = deserializeJson(fileRead(expandPath("./bug.json"))).reduce(function(previous="",value){
	param value.priority="";
	if (val(value.priority) >= 3){
		return previous & '<li><a href="#encodeForHtmlAttribute("#baseUrl##value.id#")#">#encodeForHtml("#value.id#: #value.title# [#value.priority#]")#</a></li>';
	}
	return previous;
});

writeOutput("<ul>#listElements#</ul>");
	
</cfscript>