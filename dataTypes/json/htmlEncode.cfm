<cfscript>
mystruct = {
    key1 = "&microl;"
};
json = serializeJson(mystruct);
writeoutput( json );

fileWrite("C:\temp\out.json",json);

</cfscript>