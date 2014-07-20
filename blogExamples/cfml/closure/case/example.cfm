<cfscript>
// example.cfm

param name="URL.number" default="";
param name="URL.colour" default="";

include "case.cfm"

result =
	case()
		.when(URL.number=="tahi")
			.then(function(){return "one"})
		.when(function(){return URL.colour=="whero"})
			.then(function(){return "red"})
		.else(function(){return "I dunno what to say"})
	.end()

echo(result)
</cfscript>