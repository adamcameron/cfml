// TestPrimeSequence.cfc

component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		include "udfs/createPrimeNumberSequence.cfm";
	}

	function run(){
		describe("Tests for createPrimeNumberSequence()", function(){
			it("returns primes", function(){
				var primeSequence = createPrimeNumberSequence();
				var primes = [];
				for (var i=1; i++ <= 10;){
					primes.append(primeSequence());
				}
				expect(
					primes
				).toBe([2,3,5,7,11,13,17,19,23,29]);
			});
		});
	}

}