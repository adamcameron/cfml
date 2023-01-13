<cfscript>
    list = "Abc,Def,Efh";
    r = 1;
    needle="Efh";
</cfscript>

<cftry>
<cftimer type="outline" label="mixed">
    <cfscript>
        for (i=0; i lt r; i++){
            x = listFind(list, needle);
        }
    </cfscript>
</cftimer>
<cfcatch>
    <cfdump var=#cfcatch#>
    <cfabort>
</cfcatch>
</cftry>

<h1>done</h1>
