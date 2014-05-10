<cfscript>
numbers = "rua";
writeDump(var=[numbers]);
numbers = numbers.listAppend("wha");
writeDump(var=[numbers]);
numbers = numbers.listPrepend("tahi");
writeDump(var=[numbers]);
numbers = numbers.listInsertAt(3, "toru");
writeDump(var=[numbers]);
numbers = numbers.listDeleteAt(3);
writeDump(var=[numbers]);
writeDump(var={listLen=numbers.listLen()});
numbers = numbers.changeDelims(";");
writeDump(var=[numbers]);
</cfscript>