component extends="mxunit.framework.TestCase" {

	// FRAMEWORK METHODS

	/**
	*	@hint Run before each round of ALL tests in this CFC
	*/ 
	public void function beforeTests(){	
		// we've only testing a UDF, so I've put it in a CFC and simply including it
		include "./createEventObject.cfm";

		// note: if an error occurs in this function, testing will ERROR out

	}

	/**
	*	@hint Run before each individual test function
	*/ 
	public void function setup(){	// included for the sake of discussion
		// note: if an error occurs in this function, the test being run will report as ERRORing, but testing will continue
	}

	/**
	*	@hint Run after each individual test function
	*/ 
	public void function tearDown(){	// included for the sake of discussion
		// note: if an error occurs in this function, the test being run will report as ERRORing, but testing will continue
	}

	/**
	*	@hint Run after each round of ALL tests in this CFC
	*/ 
	public void function afterTests(){	// included for the sake of discussion
		// note: if an error occurs in this function, testing will ERROR out
	}


	// TESTS

	public void function baseline(){
		createEventObject();
	}


	// HELPER FUNCTIONS

	private void function testHelper(){
	}

}