<cfflush interval="16">
<cfsetting requesttimeout="5">
<cfscript>
// createPrimeNumberSequenceVariationsImproved.cfm


function createPrimeNumberSequenceLoopOriginal(){
	var primes = [];
	var potential = 1;
	return function(){
		while(true) {
			var upperThresholdToCheck = sqr(++potential);
			var potentialIsPrime = true;
			for (var prime in primes){
				request.called++;
				if (potential mod prime == 0) {
					potentialIsPrime = false;
					break;
				}
				if (prime > upperThresholdToCheck){
					break;
				}
			}
			if (potentialIsPrime) {
				primes.append(potential);
				return potential;
			}
		}
	};
}


function createPrimeNumberSequenceEveryOriginal(){
	var primes = [];
	var potential = 1;
	var upperThresholdToCheck = false;

	var everyHandler = function(prime){
		request.called++;
		if (prime > upperThresholdToCheck) return true;
		if (potential mod prime != 0) return true;
		return false;
	}

	return function(){
		while(true) {
			upperThresholdToCheck = sqr(++potential);
			var potentialIsPrime = primes.every(everyHandler);
			if (potentialIsPrime) {
				primes.append(potential);
				return potential;
			}
		}
	};
}


function createPrimeNumberSequenceEveryUpdated(){
	var primes = [];
	var potential = 1;
	var upperThresholdToCheck = false;
	var potentialIsPrime = false;

	var someHandler = function(prime){
		request.called++;
		if (potential mod prime == 0){
			potentialIsPrime = false;
			return true;
		}
		if (prime > upperThresholdToCheck) return true;
		return false;
	}

	return function(){
		while(true) {
			upperThresholdToCheck = sqr(++potential);
			potentialIsPrime = true;
			primes.some(someHandler);
			if (potentialIsPrime) {
				primes.append(potential);
				return potential;
			}
		}
	};
}

iterations = URL.iterations ?: 0;

function timeIt(job, title=""){
	writeOutput("<h3>#title#</h3>");
	var start = getTickCount();
	job();
	var end = getTickCount();
	writeOutput("Execution time: #end-start#ms<hr>");
}


timeIt(function(){
	primeSequence = createPrimeNumberSequenceLoopOriginal();
	primesLoopOriginal = [];
	request.called = 0;
	for (i=1; i++ <= iterations;){
		primesLoopOriginal.append(primeSequence());
	}
	echo("Loop iterated: #request.called# times<br>");
}, "Original Using for() loop");


timeIt(function(){
	primeSequence = createPrimeNumberSequenceEveryOriginal();
	primesEveryOriginal = [];
	request.called = 0;
	for (i=1; i++ <= iterations;){
		primesEveryOriginal.append(primeSequence());
	}
	echo("Handler called: #request.called# times<br>");
}, "Original using every()");


timeIt(function(){
	primeSequence = createPrimeNumberSequenceEveryUpdated();
	primesEveryUpdated = [];
	request.called = 0;
	for (i=1; i++ <= iterations;){
		primesEveryUpdated.append(primeSequence());
	}
	echo("Handler called: #request.called# times<br>");
}, "Updated using every()");

writeOutput("<h3>Validating results</h3>");
writeOutput("originals match: #primesLoopOriginal.equals(primesEveryOriginal)#<br>");
writeOutput("Everys match: #primesEveryOriginal.equals(primesEveryUpdated)#<br>");


writeDump([
	primesLoopOriginal.toList(chr(160))
	,primesEveryOriginal.toList(chr(160))
	,primesEveryUpdated.toList(chr(160))
]);
</cfscript>