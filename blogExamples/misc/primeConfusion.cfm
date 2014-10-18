<cfflush interval="1">
<cfsetting requesttimeout="10">

<cfscript>
function createPrimeNumberSequence4(){
	var primes = [];
	var potential = 1;
	var upperThresholdToCheck = false;

	var everyHandler = function(prime){
		echo ("#prime# ");
		if (prime > upperThresholdToCheck){
			echo("(is outside threshold) ");
			return true;
		}
		if (potential mod prime != 0){
			echo("(isn't a factor); ");
			return true;
		}

		echo("(is a factor)");
		return false;
	}

	return function(){
		while(true) {
			upperThresholdToCheck = sqr(++potential);
			echo("#potential#/#upperThresholdToCheck#:<br>");
			echo("[#primes.toList(chr(160))#]<br>");
			var potentialIsPrime = primes.every(everyHandler);
			if (potentialIsPrime) {
				echo(" => PRIME<hr>");
				primes.append(potential);
				return potential;
			}else{
				echo(" => not prime<hr>");
			}
		}
	};
}

primeSequence = createPrimeNumberSequence4();
primes4 = [];
for (i=1; i++ <= iterations;){
	primes4.append(primeSequence());
}
writeDump(primes4);

</cfscript>