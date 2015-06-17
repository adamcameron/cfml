<cfscript>
    function convertCaseForArray(Array array, function convertor)
    {
        for (var i=1; i <= arrayLen(array); i++){
            array[i] = convertor(array[i]);
        } 
        return array;
    }
 
    functionToUse = reverse;
    resultantArray = convertCaseForArray(['One', 'Two','Three'], functionToUse); 
 
    writedump(resultantArray);
</cfscript>