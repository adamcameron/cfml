<cfscript>
	include "lib/udfs.cfm";

	import components.*;
	heading = "Hello World"; 
	heading = h1(heading);
	
	o = new My();

	heading = o.green(heading);
	
	writeOutput(heading);
	writeDump(variables);
</cfscript>