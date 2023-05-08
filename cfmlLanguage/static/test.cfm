<cfscript>
    result = C::doubleAll(1,2,3)
    writeDump(result)
    o1 = new C()
    result = o1.doubleAll(4,5,6)
    writeDump(result)

    result = C::tripleAll(1,2,3)
    writeDump(result)
    o2 = new C()
    result = o2.tripleAll(4,5,6)
    writeDump(result)
</cfscript>
