<cfscript>
    parent = new Parent()
    sub = parent.getSub()
    writeDump([
        sub=sub,
        metadata = getMetaData(sub)
    ])
</cfscript>
