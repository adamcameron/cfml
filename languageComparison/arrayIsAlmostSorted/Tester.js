"use strict";

class Tester {

	static getTests(){
		return [
			{description:"already sorted, values contiguous", array:[1,2,3,4,5], expected:true},
			{description:"already sorted, values not contiguous", array:[2,4,6,8,10], expected:true},
			{description:"off by one, first pair", array:[2,1,3,4,5], expected:true},
			{description:"off by one, subsequent pair", array:[1,2,4,3,5], expected:true},
			{description:"off by one, last pair", array:[1,2,3,5,4], expected:true},
			{description:"off by one, first and last", array:[5,2,3,4,1], expected:true},
			{description:"off by one, first and middle", array:[3,2,1,4,5], expected:true},
			{description:"off by one, last and middle", array:[1,2,5,4,3], expected:true},
			{description:"off by two, first two pairs", array:[2,1,4,3,5], expected:false},
			{description:"off by two, last two pairs", array:[1,3,2,5,4], expected:false},
			{description:"off by two, first and last pairs", array:[2,1,3,5,4], expected:false},
			{description:"off by two, within three elements", array:[2,3,1,4,5], expected:false},
			{description:"off by many, reversed", array:[5,4,3,2,1], expected:false}
		];
	}
	
	static runTests(functionToTest, testSet){
		let tests = Tester.getTests();
		let testsToRun = testSet == undefined ? tests : testSet.map(function(i){
			return tests[i];
		});
	
		testsToRun.forEach(function(test, i){
			let message;
			try {
				let result = functionToTest(test.array);
				let pass = result == test.expected;
				message = `${i} ${test.description} => ${test.expected} (${pass})`;
			} catch (e){
				message = `${i} ${e}`;
			} finally {
				console.log(message);
			}
		});
	}
}

module.exports = Tester;
