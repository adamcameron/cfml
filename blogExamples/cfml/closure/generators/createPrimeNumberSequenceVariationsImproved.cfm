<cfflush interval="16">
<!--- <cfsetting requesttimeout="20">--->
<cfscript>
// createPrimeNumberSequenceVariationsImproved.cfm


function createPrimeNumberSequenceLoopOriginal(){
	var primes = []
	var potential = 1
	return function(){
		while (true) {
			var upperThresholdToCheck = sqr(++potential)
			var potentialIsPrime = true
			for (var prime in primes){
				request.called++
				if (potential mod prime == 0) {
					potentialIsPrime = false
					break;
				}
				if (prime > upperThresholdToCheck) break;
			}
			if (potentialIsPrime) {
				primes.append(potential)
				return potential
			}
		}
	}
}

function createPrimeNumberSequenceLoopImproved(){
	var primes = [2]
	var potential = 1

	return function(){
		while (true) {
			potential += 2
			var upperThresholdToCheck = sqr(potential)
			var potentialIsPrime = true
			for (var prime in primes){
				request.called++
				if (potential mod prime == 0) {
					potentialIsPrime = false
					break;
				}
				if (prime > upperThresholdToCheck) break;
			}
			if (potentialIsPrime) {
				primes.append(potential)
				return primes[primes.len()-1]
			}
		}
	}
}


function createPrimeNumberSequenceEveryOriginal(){
	var primes = []
	var potential = 1
	var upperThresholdToCheck = false

	var everyHandler = function(prime){
		request.called++
		if (prime > upperThresholdToCheck) return true
		if (potential mod prime != 0) return true
		return false
	}

	return function(){
		while (true) {
			upperThresholdToCheck = sqr(++potential)
			var potentialIsPrime = primes.every(everyHandler)
			if (potentialIsPrime) {
				primes.append(potential)
				return potential
			}
		}
	}
}


function createPrimeNumberSequenceSomeUpdated(){
	var primes = []
	var potential = 1
	var upperThresholdToCheck = false
	var potentialIsPrime = false

	var someHandler = function(prime){
		request.called++
		if (potential mod prime == 0){
			potentialIsPrime = false
			return true
		}
		if (prime > upperThresholdToCheck) return true
		return false
	}

	return function(){
		while (true) {
			upperThresholdToCheck = sqr(++potential)
			potentialIsPrime = true
			primes.some(someHandler)
			if (potentialIsPrime) {
				primes.append(potential)
				return potential
			}
		}
	}
}

function createPrimeNumberSequenceSomeImproved(){
	var primes = [2]
	var potential = 1
	var upperThresholdToCheck = false
	var potentialIsPrime = false

	var someHandler = function(prime){
		request.called++
		if (potential mod prime == 0){
			potentialIsPrime = false
			return true
		}
		if (prime > upperThresholdToCheck) return true
		return false
	}

	return function(){
		while (true) {
			potential += 2
			upperThresholdToCheck = sqr(potential)
			potentialIsPrime = true
			primes.some(someHandler)
			if (potentialIsPrime) {
				primes.append(potential)
				return primes[primes.len()-1]
			}
		}
	}
}

iterations = URL.iterations ?: 0

function timeIt(job, title=""){
	echo("<h3>#title#</h3>")
	var start = getTickCount()
	job()
	var end = getTickCount()
	echo("Execution time: #end-start#ms<hr>")
}


timeIt(function(){
	primeSequence = createPrimeNumberSequenceLoopOriginal()
	primesLoopOriginal = []
	request.called = 0
	for (i=1; i++ <= iterations;){
		primesLoopOriginal.append(primeSequence())
	}
	echo("Loop iterated: #request.called# times<br>")
}, "Original Using for() loop")


timeIt(function(){
	primeSequence = createPrimeNumberSequenceLoopImproved()
	primesLoopImproved = []
	request.called = 0
	for (i=1; i++ <= iterations;){
		primesLoopImproved.append(primeSequence())
	}
	echo("Handler called: #request.called# times<br>")
}, "Improved using for() loop")


timeIt(function(){
	primeSequence = createPrimeNumberSequenceEveryOriginal()
	primesEveryOriginal = []
	request.called = 0
	for (i=1; i++ <= iterations;){
		primesEveryOriginal.append(primeSequence())
	}
	echo("Handler called: #request.called# times<br>")
}, "Original using every()")


timeIt(function(){
	primeSequence = createPrimeNumberSequenceSomeUpdated()
	primesSomeUpdated = []
	request.called = 0
	for (i=1; i++ <= iterations;){
		primesSomeUpdated.append(primeSequence())
	}
	echo("Handler called: #request.called# times<br>")
}, "Updated using some()")


timeIt(function(){
	primeSequence = createPrimeNumberSequenceSomeImproved()
	primesSomeImproved = []
	request.called = 0
	for (i=1; i++ <= iterations;){
		primesSomeImproved.append(primeSequence())
	}
	echo("Handler called: #request.called# times<br>")
}, "Improved using some()")


echo("<h3>Validating results</h3>")
echo("originals match: #primesLoopOriginal.equals(primesEveryOriginal)#<br>")
echo("Everys match: #primesEveryOriginal.equals(primesSomeUpdated)#<br>")
echo("Loops match: #primesLoopOriginal.equals(primesLoopImproved)#<br>")
echo("Improved match: #primesLoopImproved.equals(primesSomeImproved)#<br>")
echo("<hr>")

if (!(URL.debug ?: false)) exit
writeDump([
	primesLoopOriginal.toList(chr(160))
	,primesEveryOriginal.toList(chr(160))
	,primesSomeUpdated.toList(chr(160))
	,primesLoopImproved.toList(chr(160))
	,primesSomeImproved.toList(chr(160))
])
</cfscript>