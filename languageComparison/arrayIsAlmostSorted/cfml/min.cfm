<cfscript>
f =(a)=>a.some((_,i)=> duplicate(a).slice(i).some((_,j)=>duplicate(a).sort("numeric").equals(duplicate(a).swap(i,i+j-1))))

new Tester().runTests(f)
</cfscript>