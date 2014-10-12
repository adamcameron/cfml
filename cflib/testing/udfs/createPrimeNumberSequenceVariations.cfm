<cfflush interval="16">
<cfscript>
// createPrimeNumberSequenceVariations.cfm

function createPrimeNumberSequence1(){
	var primes = []
	var potential = 1
	return function(){
		while(true) {
			var upperThresholdToCheck = sqr(++potential)
			var potentialIsPrime = primes.every(function(prime){
				return potential mod prime != 0 || potential <= upperThresholdToCheck
			});
			if (potentialIsPrime) {
				primes.append(potential)
				return potential
			}
		}
	}
}

function createPrimeNumberSequence2(){
	var primes = [];
	var potential = 1;
	return function(){
		while(true) {
			var upperThresholdToCheck = sqr(++potential);
			var potentialIsPrime = true;
			for (var prime in primes){
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

function createPrimeNumberSequence3(){
	var primes = [];
	var potential = 1;
	var upperThresholdToCheck = false;

	var everyHandler = function(prime){
		return potential mod prime != 0 || potential <= upperThresholdToCheck;
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

function createPrimeNumberSequence4(){
	var primes = [];
	var potential = 1;
	var upperThresholdToCheck = false;

	var everyHandler = function(prime){
		if (potential mod prime != 0) return true;
		if (potential <= upperThresholdToCheck) return true;
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

iterations = URL.iterations ?: 0;

function timeIt(job, title=""){
	writeOutput("<h3>#title#</h3>");
	var start = getTickCount();
	job();
	var end = getTickCount();
	writeOutput("Execution time: #end-start#ms<hr>");
}


timeIt(function(){
	primeSequence = createPrimeNumberSequence1();
	primes1 = [];
	for (i=1; i++ <= iterations;){
		primes1.append(primeSequence());
	}
}, "Original using every() and inline handler");


timeIt(function(){
	primeSequence = createPrimeNumberSequence2();
	primes2 = [];
	for (i=1; i++ <= iterations;){
		primes2.append(primeSequence());
	}
}, "Using for() loop");


timeIt(function(){
	primeSequence = createPrimeNumberSequence3();
	primes3 = [];
	for (i=1; i++ <= iterations;){
		primes3.append(primeSequence());
	}
}, "Original using every() and predefined handler");


timeIt(function(){
	primeSequence = createPrimeNumberSequence4();
	primes4 = [];
	for (i=1; i++ <= iterations;){
		primes4.append(primeSequence());
	}
}, "Original using every() and predefined handler and separate exit conditions");


writeOutput("<h3>Validating results</h3>");
writeOutput("1 & 2 match: #primes1.equals(primes2)#<br>");
writeOutput("1 & 3 match: #primes1.equals(primes3)#<br>");
writeOutput("1 & 4 match: #primes1.equals(primes4)#<br>");
</cfscript>