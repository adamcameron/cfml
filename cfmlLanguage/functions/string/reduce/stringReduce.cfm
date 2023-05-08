<cfscript>
    l = "a,b,c,d,e,f,g,h,i,j"
    s = "abcdefghij"

    x = s.reduce((a=[], c) => a.append(c))
    y = l.listReduce((a=[], c) => a.append(c))

    writeDump([x,y])
</cfscript>
