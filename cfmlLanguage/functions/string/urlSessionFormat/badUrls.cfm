<cfflush interval="1">
<table border="1">
    <tr><th>Expression</th><th>URL</th><th>Result</th><th>Correct</th><th>Reason</th></tr>
<cfscript>
    aPaths        = ["","/dir","/dir/subdir"];
    aFiles        = ["","/","/file.cfm"];
    aParams        = ["","?", "?param","?param=value"];
    aAnchors    = ["","##anchor"];

    for (iPath=1; iPath <= arrayLen(aPaths); iPath++){
        sPath = aPaths[iPath];

        for (iFile=1; iFile <= arrayLen(aFiles); iFile++){
            sFile = aFiles[iFile];

            for (iParam=1; iParam <= arrayLen(aParams); iParam++){
                sParam = aParams[iParam];

                for (iAnchor=1; iAnchor <= arrayLen(aAnchors); iAnchor++){
                    sAnchor = aAnchors[iAnchor];

                    sUrlToTest = sPath & sFile & sParam & sAnchor;
                    writeOutput('<tr>');
                    writeOutput('<td>urlSessionFormat("#sUrlToTest#") </td>');
                    writeOutput('<td>#sUrlToTest# </td>');
                    writeOutput('<td>#urlSessionFormat(sUrlToTest)# </td>');
                    writeOutput('<td>&nbsp;</td>');
                    writeOutput('<td>&nbsp;</td>');
                    writeOutput('</tr>');
                }
            }
        }
    }
</cfscript>
</table>