<cfscript>
// createPrimeNumberSequence.cfm
function createPrimeNumberSequence(){
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
			};
			if (potentialIsPrime) {
				primes.append(potential);
				return potential;
			}
		}
	};
}
</cfscript>