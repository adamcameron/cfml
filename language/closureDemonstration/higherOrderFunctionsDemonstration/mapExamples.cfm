<cfscript>
    keys = ["ONE", "TWO", "THREE", "FOUR"]

    translationLookup = {
        "ONE" = {mi = "tahi", jp = "一"},
        "TWO" = {mi = "rua", jp = "二"},
        "THREE" = {mi = "toru", jp = "三"},
        "FOUR" = {mi = "wha", jp = "四"}
    }


    maori = keys.map((key) => translationLookup[key].mi)

    writeDump(maori)
</cfscript>

<cfset japanese = []>
<cfloop array="#keys#" item="key">
    <cfset arrayAppend(japanese, translationLookup[key].jp)>
</cfloop>
<cfdump var="#japanese#">


<cfscript>
    values = [1, 22, 333, 4444]
    doubled = values.map((n) => n*2)
    writeDump(doubled)
</cfscript>


<cfset halved = []>
<cfloop array="#values#" item="value">
    <cfset arrayAppend(halved, value / 2)>
</cfloop>
<cfdump var="#halved#">


<cfscript>
    records = [
        {id=1, mi="whero", en="red"},
        {id=2, mi="kakariki", en="green"},
        {id=3, mi="kikorangi", en="blue"}
    ]
    objects = records.map((record) => new Colour(record.id, record.mi, record.en))
</cfscript>

<cfset objects = []>
<cfloop array="#records#" item="record">
    <cfset arrayAppend(objects, new Colour(record.id, record.mi, record.en))>
</cfloop>
<cfdump var="#objects#">

<cfscript>
    s = "The Quick Brown Fox Jumps Over The Lazy Dog"

    a = asc("a")
    z = asc("z")

    rot13 = s.listToArray("").map((c) => {
        checkCode = asc(lcase(c))

        if (checkCode < a || checkCode > z) {
            return c
        }
        offset = (checkCode + 13) <= z ? 13 : -13

        return chr(asc(c) + offset)
    }).toList("")
    writeOutput(rot13)
</cfscript>

<hr>

<cfset a = asc("a")>
<cfset z = asc("z")>

<cfset s2 = "">
<cfloop array="#listToArray(rot13, "")#" item="c">
    <cfset checkCode = asc(lcase(c))>

    <cfif checkCode LT a OR checkCode GT z>
        <cfset s2 &= c>
        <cfcontinue>
    </cfif>
    <cfset offset = 13>
    <cfif checkCode + 13 GT z>
        <cfset offset = -13>
    </cfif>
    <cfset s2 &= chr(asc(c) + offset)>
</cfloop>
<cfoutput>#s2#</cfoutput>
