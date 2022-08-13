FLAT TEXT
<cfset msg = "cfoutput">
<cfoutput>#msg#</cfoutput>
<cfscript>
msg = "writeoutput";
writeOutput(msg);

msg = "cli.write";
cli.write(msg);

msg = "cli.writeln";
cli.writeln(msg);
</cfscript>