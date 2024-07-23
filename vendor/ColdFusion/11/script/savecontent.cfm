<cfset days = ["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"]>
<cfsavecontent variable="contentViaTags">
<ul>
<cfloop index="day" array="#days#">
	<cfoutput><li>#day#</li></cfoutput>
</cfloop>
</ul>
</cfsavecontent>
<cfoutput>#contentViaTags#</cfoutput>

<cfscript>
savecontent variable="contentViaScript" {
	writeOutput(days.reduce(function(previousResult, thisValue){
		return previousResult & "<li>#thisValue#</li>";
	},"<ul>") & "</ul>");

}
writeOutput(contentViaScript);

cfsavecontent(variable="contentViaScriptNew") {
	writeOutput("<ul>");
	days.each(function(v){
		writeOutput("<li>#v#</li>");
	});
	writeOutput("</ul>");
}
writeOutput(contentViaScriptNew);


contentViaFunction = savecontent(function(){
	var decoratedDays = days.map(function(v){
		return "<li>#v#</li>";
	});
	writeOutput("<ul>#decoratedDays.toList('')#</ul>");
});
writeOutput(contentViaFunction);

function saveContent(required function content){
	savecontent variable="local.saved" {
		content();
	}
	return local.saved;
}
</cfscript>



