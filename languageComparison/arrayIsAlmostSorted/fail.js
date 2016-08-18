function arrayIsAlmostSorted(array){
    var tally = 0;
    array.sort(function(e1, e2){
        if (e1 > e2) {
            tally++;
        }
        return e2 - e1;
    });

    return tally <= 1;
}


var tests = [
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


tests = [
    [true,[1,2,3,4]],
    [true,[1,3,2,4]],
    [false,[2,1,4,3]],
    [false,[4,3,2,1]]
];

tests.forEach(function(test){
    var expectation = test[0];
    var testArray = test[1];
    console.log(JSON.stringify(testArray) + " => " + arrayIsAlmostSorted(testArray) + " (Expectation: " + expectation + ")");
});
