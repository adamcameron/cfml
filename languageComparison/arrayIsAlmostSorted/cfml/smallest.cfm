<cfscript>
f =(a)=>a.some((_,i)=> duplicate(a).slice(i).some((_,j)=>duplicate(a).sort("numeric").equals(duplicate(a).swap(i,i+j-1))))

tests = [
    // sorted
     [true,[1,2,3,4,5]]
    ,[true,[2,4,6,8,10]]
    
    // 1 swap
    ,[true,[1,2,3,5,4]]
    ,[true,[5,2,3,4,1]]
    ,[true,[1,2,3,5,3]]
    
    // +1 swap
    ,[false,[5,2,3,1,4]]
    ,[false,[2,3,1,5,4]]
    ,[false,[5,1,2,3,4]]
    ,[false,[2,3,1,5,4]]
    ,[false,[2,3,1,4,5]]
    ,[false,[1,2,3,5,2]]
];


tests.each(function(test){
	var expectation = test[1];
	var testArray = test[2];
	writeOutput(serializeJson(testArray) & " => " & f(testArray) & " (Expectation: " & expectation & ")<br>");
});

</cfscript>