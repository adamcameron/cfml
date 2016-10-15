<h2>Tags</h2>
<h3>No closing tag:</h3>
<cf_tag>
<hr>

<h3>Short-hand closing tag:</h3>
<cf_tag />
<hr>

<h3>Explicit closing tag:</h3>
<cf_tag>body</cf_tag>
<hr>

<h2>Module</h2>
<h3>No closing tag:</h3>
<cfmodule template="tag.cfm">
<hr>

<h3>Short-hand closing tag:</h3>
<cfmodule template="tag.cfm" />
<hr>

<h3>Explicit closing tag:</h3>
<cfmodule template="tag.cfm">body</cfmodule>
<hr>

<cfscript>
writeOutput("<h2>Script</h2>");
writeOutput("No block:</h3>");
cfmodule(template="tag.cfm"); // this states hasEndTag is TRUE
writeOutput("<hr>");

writeOutput("<h3>With block:</h3>");
cfmodule(template="tag.cfm") {
	writeOutput("body");
}
writeOutput("<hr>");
</cfscript>

