<cfscript>
// testPublicAndPrivate.cfm
o = new PublicAndPrivate("initialised");
writeDump(var=o, label="initialised");

o.setPropertyWithPrivateSetter("set via synthesised setter");
writeDump(var=o, label="after public");

o.exposePrivateMethod("set via private setter");
writeDump(var=o, label="after private");

writeOutput("<hr>");
o.setPropertyWithExplicitSetter("set via explicit setter");
writeDump(var=o, label="after explicit setter");
</cfscript>
