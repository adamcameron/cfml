<cfscript>
/**
 * Creates an array of all the prime numbers from 1 to the specified integer.
 * 
 * @param topInt 	 The number to calculate primes for. (Required)
 * @return Returns an array. 
 * @author Steven Van Gemert (&#115;&#118;&#103;&#50;&#64;&#112;&#108;&#97;&#99;&#115;&#46;&#110;&#101;&#116;) 
 * @version 3, July 31, 2004 
 */
function GetPrimes(topInt) {
	var stepInt = 0;
	var i = 0;
	var primes = arraynew(1);
	var di = 4; //Wheel factor.
	var maxfactor = 0;
	var thisnumberoffactors = 0;
	var thismaxfactor = 0;
	var isprime = "yes";

	if(topInt is 1) return primes;
	primes[1] = 2;
	if(topInt is 2) return primes;
	primes[2] = 3;
	if(topInt LTE 4) return primes;

	maxfactor = ceiling(sqr(topInt));
	primes = getPrimes(maxfactor); //Recursion call. Find the primes for the square root of the passed number.

	//Make the current maxfactor odd. We will use this as a starting point for checking for primes above the square root of this number.
	maxfactor = maxfactor + 1 + (1 * (not ((maxfactor + 1) mod 2)));

	//Now determine the appropriate wheel factor beginning value.
	if(not (maxfactor mod 3)){
		maxfactor = maxfactor + 2;
		di = 4;
	} else if(not ((maxfactor + 2) mod 3)){
		di = 2;
	}
	else{
		di = 4;
	}

	thisnumberoffactors = arraylen(primes);  
	for(stepInt=maxfactor; stepInt lte topInt; stepInt=stepInt+di) {
		di = 6 - di; //Implement wheel factor. Every third odd number will be divisible by 3. Don't check it.
	
		//This will be the limit to where we check for factors. There must be at least one factor less than the square root of the number.
		thismaxfactor = sqr(stepInt);

		isprime = "yes"; //Assume this number is prime.

		for(i=1; i LTE thisnumberoffactors; i = i + 1){ //For each factor...
			if(not (stepInt mod primes[i])){
			isprime = "no"; //Indicate that this number is not prime.
			break; //Break if we find a valid factor.
			} else if(primes[i] GT thismaxfactor){ //If we have reached the square root.
			break; //Stop processing...we have now validated this number as a prime.
			}
		}
		if(isprime)ArrayAppend(primes,stepInt); //If this number is prime, then add it to the array of primes.
	}

	return primes;
}	
</cfscript>