<cfscript>
function getSubseries(series, threshold){

    /*
     * Setup a subseries container, to be replaced whenever a longer series is
     * found. As well, let's calculate the length of the original series to avoid
     * doing it repeatedly with every iteration of the following for loop;
     */
    var subseries = [];
    var seriesLen = arrayLen(series);
    
    /* 
     * Setup two for loops, the first to keep track of the start index (a) and the second
     * will be used to keep track of the end index (z). We'll increment through each start
     * index then reduce the array from the end, replacing the subseries whenever BOTH the 
     * sum is <= threshold AND the array length is greater than the length of the value
     * currently stored there.
     */
    for(var a = 1; a <= seriesLen; a++){
        
        var z = seriesLen;
        var buffer = {
                'array' = [],
                'sum'   = 0
            };
        
        for( z; z > a; z--){
        
            buffer.array = arraySlice(series, a, z-a+1);
            buffer.sum   = arraySum( buffer.array );

            var withinThreshold = arraySum(buffer.array) <= threshold;
            var betterLength = arrayLen(buffer.array) > arrayLen(subseries);

            if (withinThreshold && betterLength){
                subseries = buffer.array;
            }
            
        }

    }

    return(subseries);
}
</cfscript>