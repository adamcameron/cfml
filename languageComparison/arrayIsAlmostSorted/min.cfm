<cfscript>
f=(a)=>{s=duplicate(a).sort("numeric")
return a.equals(s)?1:a.some((_,i)=>a.slice(i).some((_,j)=>s.equals(duplicate(a).swap(i,i+j-1))))}

new Tester().runTests(f)
</cfscript>
