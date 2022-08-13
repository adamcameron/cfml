<cfscript>
writeOutput("C::myStaticVar: [#C::myStaticVar#]<br>")
o = new C()
writeOutput("o.myStaticVar: [#o.myStaticVar#]<br>")
writeDump(o)
o.myStaticVar = "set in test"
writeOutput("o.myStaticVar: [#o.myStaticVar#]<br>")
writeDump(o)
</cfscript>
