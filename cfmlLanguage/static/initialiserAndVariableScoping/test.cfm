<cfscript>
writeOutput("C::someVar: #C::someVar#<br>")
o1 = new C()
o1.setSomeVar("set via o1 @ #now()#")

o2 = new C()
writeOutput("C::someVar: #C::someVar#<br>")
writeOutput("C::someVar: #o2.getSomeVar()#<br>")


</cfscript>
