<cfscript>
function serializeJSONArray(arrayIn) {
            var jsonString = "[";
            var columnList = "";
            var i = 0;
            var j = 0;

            for (i=1; i<=ArrayLen(ARGUMENTS.arrayIn); i++) {
                columnList = StructKeyList(ARGUMENTS.arrayIn[i]);

                for (j=1; j<=ListLen(columnList); j++) {
                    if (j == 1)
                        jsonString = jsonString & "{";

                    jsonString = jsonString
                        & Chr(34)
                        & UCase(ListGetAt(columnList, j))
                        & Chr(34) & ":"
                        & Chr(34)
                        & Arguments.arrayIn[i][ListGetAt(columnList, j)]
                        & Chr(34);

                    if (j != ListLen(columnList))
                        jsonString = jsonString & ",";
                    else
                        jsonString = jsonString & "}";
                }

                if (i != ArrayLen(ARGUMENTS.arrayIn))
                    jsonString = jsonString & ",";
            }

            jsonString = jsonString & "]";

            return jsonString;
}


</cfscript>

<cfscript>
    aCoords = [{x=1, y=2}, {x=3, y=4}];
</cfscript>

<cfoutput>
    #serializeJSONArray(aCoords)#<br />
    #serializeJSON(aCoords)#<br />
</cfoutput>
