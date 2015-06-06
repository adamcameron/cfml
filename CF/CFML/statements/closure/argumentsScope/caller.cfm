<cfscript>
	o = new C();

	c = o.f("function arg value");

	writeOutput(c("closure arg value") & "<br />");
</cfscript>