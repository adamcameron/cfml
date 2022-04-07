<cfscript>
	// test.cfm

	bare = new Bare(); // at this point, this is an empty object
	
	void function f(){
		// this is the function that Testable.cfc requires
	}

	bare.f = f;	// now bare fulfills the contract requirements of Testable.cfc

	// this function requires an argument which is a Testable
	void function test(required Testable o){
	}

	test(bare);	// bare should fit the bill now, but this line will error
</cfscript>