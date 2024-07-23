<cfscript>
writeDump(label=now(), var=MyOther::getVars())

sleep(1000)
o = new MyOther()
writeDump(label=now(), var=o.getVars())

sleep(1000)
o2 = new MyOther()
writeDump(label=now(), var=o2.getVars())
</cfscript>
