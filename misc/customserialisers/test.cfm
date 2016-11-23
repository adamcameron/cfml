<cfscript>
o = new C();
 
a1 = ["tahi", "rua", "toru", "wha"];
 
s = o.serialize(a1);
a2 = o.deserialize(s);
 
writeDump([a1,s,a2]);

//function deserialize(){}
</cfscript>