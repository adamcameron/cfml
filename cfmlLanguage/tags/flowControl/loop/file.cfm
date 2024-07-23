<cfloop file="#expandPath('./')#file.txt" index="sLine">
    <cfoutput>[#sLine#]</cfoutput><br/>
</cfloop>

<cfloop file="#expandPath('./')#file.txt" index="c" characters="0">
    <cfoutput>[#c#][#asc(c)#]</cfoutput><br/>
</cfloop>
