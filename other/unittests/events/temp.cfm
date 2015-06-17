<cfscript>
//temp.cfm
writeDump(var=[expandPath("/testCreateEventObject")]);


o = createObject("testCreateEventObject.Test");
writeDump(var=o);
</cfscript>