<cfscript>
writeOutput("#now()#<br>")
writeDump(label=now(), var=My::getVars())

sleep(1000)
o = new My()
writeDump(label=now(), var=My::getVars())

sleep(1000)
o2 = new My()
writeDump(label=now(), var=My::getVars())
</cfscript>
