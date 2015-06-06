<cfscript>
function isArrayOf(object, validator){
    if (!isArray(object)){
        return false;
    }

    for (var element in object){
        if (!validator(element)){
            return false;
        }
    }
    return true;
}

numbers = [
    {number=1, english="one", maori="tahi"},
    {number=2, english="two", maori="rua"},
    {number=3, english="three", maori="toru"},
    {number=4, english="four", maori="wha"}
];

function numbersValdiator(number){
    return structKeyExists(number, "number") && structKeyExists(number, "english") && structKeyExists(number, "maori");
}

writeOutput(isArrayOf(numbers, numbersValdiator));
</cfscript>