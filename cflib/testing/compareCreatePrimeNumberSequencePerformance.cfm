<cfscript>
// compareCreatePrimeNumberSequencePerformance.cfm

include "./udfs/createPrimeNumberSequence.cfm";
include "./udfs/getPrimes.cfm";

function timeIt(job){
	var start = getTickCount();
	job();
	var end = getTickCount();
	writeOutput("Execution time: #end-start#ms<hr>");
}

iterations = URL.iterations ?: 0;

timeIt(function(){
	primeSequence = createPrimeNumberSequence();
	primes1 = [];
	for (i=1; i++ <= iterations;){
		primes1.append(primeSequence());
	}
});

max = primes1[primes1.len()] + 1;
timeIt(function(){
	primes2 = getPrimes(max);
});

writeOutput("1 & 2 match: #primes1.equals(primes2)#<br>");

</cfscript>