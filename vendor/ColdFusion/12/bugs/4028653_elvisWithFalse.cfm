<cfscript>
CLI.writeln(false ?: "false=>default");	
CLI.writeln(javacast("null", "") ?: "null=>default");	
CLI.writeln("No" ?: "No=>default");	
CLI.writeln(0 ?: "0=>default");	
</cfscript>