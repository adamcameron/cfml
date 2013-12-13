// TestArraysOfObjects.cfc
component extends="mxunit.framework.TestCase" {


	public void function beforeTests(){
		variables.arrayOfSamples	= [new Sample(), new Sample()];
		variables.arrayofSubSamples	= [new SubSample(), new SubSample()];
		variables.arrayofNotSamples	= [new NotSample(), new NotSample()];
		variables.arrayOfStrings	= ["array", "of", "strings"];
		variables.arrayOfNumerics	= [-1, 2.2, pi()];
		variables.arrayOfStructs	= [{one="tahi"}, {two="rua"}, {three="toru"}, {four="wha"}];

		//include "./functionsInScript.cfm";
		include "./functionsInTags.cfm";
	}


	public void function testAcceptArrayOfSamples(){
		acceptArrayOfSamples(arrayOfSamples);
	}

	public void function testReturnArrayOfSamples(){
		returnArrayOfSamples(arrayOfSamples);
	}

	public void function testAcceptArrayOfSamples_withStrings(){
		expectException("expression");
		acceptArrayOfSamples(arrayOfStrings);
	}

	public void function testReturnArrayOfSamples_withStrings(){
		expectException("expression");
		returnArrayOfSamples(arrayOfStrings);
	}

	public void function testAcceptArrayOfSamples_withSubSamples(){
		acceptArrayOfSamples(arrayOfSubSamples);
	}

	public void function testReturnArrayOfSamples_withSubSamples(){
		returnArrayOfSamples(arrayOfSubSamples);
	}
	
	public void function acceptArrayOfSamples_withNotSamples(){
		expectException("expression");
		acceptArrayOfSamples(arrayOfNotSamples);
	}

	public void function testReturnArrayOfSamples_withNotSamples(){
		expectException("expression");
		returnArrayOfSamples(arrayOfNotSamples);
	}

	public void function testAcceptArrayOfStrings(){
		acceptArrayOfStrings(arrayOfStrings);
	}

	public void function testReturnArrayOfStrings(){
		returnArrayOfStrings(arrayOfStrings);
	}

	public void function testAcceptArrayOfNumerics(){
		acceptArrayOfNumerics(arrayOfNumerics);
	}

	public void function testReturnArrayOfNumerics(){
		returnArrayOfNumerics(arrayOfNumerics);
	}

	public void function testAcceptArrayOfNumerics_withStrings(){
		expectException("expression");
		acceptArrayOfNumerics(arrayOfStrings);
	}

	public void function testReturnArrayOfNumerics_withStrings(){
		expectException("expression");
		returnArrayOfNumerics(arrayOfStrings);
	}

	public void function testAcceptArrayOfStructs(){
		acceptArrayOfStructs(arrayOfStructs);
	}

	public void function testReturnArrayOfStructs(){
		returnArrayOfStructs(arrayOfStructs);
	}

	public void function testInterface(){
		new Implementation(); // should not error
	}

	public void function testParamArrayOfSamples(){
		var test = variables.arrayOfSamples;
		param type="Sample[]" name="test";
	}

	public void function testParamArrayOfSamples_withSubSamples(){
		var test = variables.arrayOfSubSamples;
		param type="Sample[]" name="test";
	}

	public void function testParamArrayOfSamples_withNotSamples(){
		expectException("expression");
		var test = variables.arrayOfNotSamples;
		param type="Sample[]" name="test";
	}

	/**
	* @hint demonstrates the param type variable syntax should work
	*/ 
	public void function testParamNumericShortSyntax(){
		var test = pi();
		param numeric test;
	}

	public void function testParamArrayOfSamplesShortSyntax(){
		var test = variables.arrayOfSamples;
		include "testParamArrayOfSamplesShortSyntax.cfm"; // need to abstract this into an include so the compile error doesn't break the other tests
	}

}