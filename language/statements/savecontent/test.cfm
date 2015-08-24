<cfscript>
savecontent variable="content"{
	writeDump(server);
}
writeOutput(content);
</cfscript>