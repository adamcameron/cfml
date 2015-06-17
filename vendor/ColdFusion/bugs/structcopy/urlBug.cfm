<cfscript>
// urlBug.cfm

URL.testKey = "value set in URL scope";
writeDump(var=URL, label="URL scope");

writeOutput('<br><div style="padding-left: 20px;">');
copy = structCopy(URL);
writeDump(var=copy, label="initial state of copy of URL scope");

copy.testKey = "value set in copy";
writeDump(var=copy, label="updated state of copy");
writeOutput('</div><br>');

writeDump(var=URL, label="URL scope after change made to copy");
</cfscript>