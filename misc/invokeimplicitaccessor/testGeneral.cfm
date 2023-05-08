<cfscript>
o = new General();
o.x = "value"; // calls setX()
writeOutput("Value from o.x: #o.x#<br>"); // calls getX()
</cfscript>