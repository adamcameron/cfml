<cfscript>
// thing.cfm

import "cfcs.*";

thing = new Thing();
thing.setKey("foo");
writeDump({key=thing.key});
</cfscript>