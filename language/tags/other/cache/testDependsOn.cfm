<cfscript>
// testDependsOn.cfm
foo = timeFormat(now(), "HHMMSS");

writeOutput("<h3>First pass</h3>");
cache dependsOn="foo" {
	writeOutput("getTickCount(): #getTickCount()#<br>");
	writeOutput("foo: #foo#<br>");
}
sleep(200);

writeOutput("<h3>Second pass</h3>");
foo = timeFormat(now(), "HHMMSS");
cache dependsOn="foo" {
	writeOutput("getTickCount(): #getTickCount()#<br>");
	writeOutput("foo: #foo#<br>");
}
sleep(1000);

writeOutput("<h3>Third pass</h3>");
foo = timeFormat(now(), "HHMMSS");
cache dependsOn="foo" {
	writeOutput("getTickCount(): #getTickCount()#<br>");
	writeOutput("foo: #foo#<br>");
}

writeOutput("<h3>Fourth pass</h3>");
foo = "completely different";
cache dependsOn="foo" {
	writeOutput("getTickCount(): #getTickCount()#<br>");
	writeOutput("foo: #foo#<br>");
}

</cfscript>