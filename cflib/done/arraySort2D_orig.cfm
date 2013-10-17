<cfscript>
function ArraySort2D(arrayToSort, sortColumn, type) {
    var order = "asc";
    var i = 1;
    var j = 1;
    var thePosition = "";
    var theList = "";
    var arrayToReturn = ArrayNew(2);
    var sortArray = ArrayNew(1);
    var counter = 1;
    if (ArrayLen(Arguments) GT 3){
        order = Arguments[4];
    }
    for (i=1; i LTE ArrayLen(arrayToSort); i=i+1) {
        ArrayAppend(sortArray, arrayToSort[i][sortColumn]);
    }
    theList = ArrayToList(sortArray);
    ArraySort(sortArray, type, order);
    for (i=1; i LTE ArrayLen(sortArray); i=i+1) {
        thePosition = ListFind(theList, sortArray[i]);
        theList = ListDeleteAt(theList, thePosition);
        for (j=1; j LTE ArrayLen(arrayToSort[thePosition]); j=j+1) {
            arrayToReturn[counter][j] = arrayToSort[thePosition][j];
        }
        ArrayDeleteAt(arrayToSort, thePosition);
        counter = counter + 1;
    }
    return arrayToReturn;
}
</cfscript>

<cfset arr = [[1,'one,1'],[2,'two,2'],[3,'three,3']]>
<cfdump var="#ArraySort2D(arr, 2, "textnocase", "asc", "|")#">