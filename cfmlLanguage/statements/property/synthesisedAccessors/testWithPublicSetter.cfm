<cfscript>
// testWithPublicSetter.cfm

o = new WithPublicSetter("set via constructor");
writeDump(var=o, label="After init()");
writeOutput("<hr>");

o.setMyProperty("set via synthesised setter");
writeDump(var=o, label="After setMyProperty()");
</cfscript>