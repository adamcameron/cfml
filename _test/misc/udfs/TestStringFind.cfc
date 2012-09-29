component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		addAssertDecorator("scratch._test.Assertions");
		include "/scratch/misc/udfs/stringFind.cfm";
	}

	public void function testEmptyPattern(){
		var result = stringFind("", "TEST");
		debug(result);
		baselineTest(result);
		assertTrue(
			result[1].pos[1] && !result[1].len[1] && !len(result[1].string[1]),
			"Should have had a single zero-length string match"
		);
	}

	public void function testEmptyString(){
		var result = stringFind(".", "");
		debug(result);
		assertIsEmptyArray(result, "result should be an empty array");
	}

	public void function testSimple(){
		var result = stringFind(".", "A");
		debug(result);
		baselineTest(result);
		assertTrue(
			result[1].pos[1] && result[1].len[1] && result[1].string[1] == "A",
			"Should have had a single zero-length string match"
		);
	}

	public void function testMultiple(){
		var result = stringFind(".", "AB", true);
		debug(result);
		baselineTest(result);
		assertEquals(
			2,
			arrayLen(result),
			"result should have two elements"
		);
	}

	public void function testStartingPoint(){
		var result = stringFind("A", "AB", false, 2);	// should not get a match as we're starting @ char 2
		debug(result);
		assertIsEmptyArray(result, "result should be an empty array");
	}

	public void function testCaseSensitive(){
		var result = stringFind("A", "Aa", false, 2, true);	// should not get a match as we're starting @ char 2
		debug(result);
		assertIsEmptyArray(result, "result should be an empty array");
	}

	public void function testSubexpressions(){
		var result = stringFind("b([aeiou])t", "bat bet bit bot but", true);	// should not get a match as we're starting @ char 2
		debug(result);
		baselineTest(result);
		assertEquals(
			5,
			arrayLen(result),
			"result should have five elements"
		);
		for (var i=1; i <= arrayLen(result); i++){
			assertEquals(
				2,
				arrayLen(result[i].pos),
				"Element result[#i#].pos should have two elements"
			);
			assertTrue(
				result[i].string[2] == mid(result[i].string[1], 2, 1),
				"Returned results of result[#i#].string were incorrect" 
			);
		}
	}


	// HELPERS

	private void function baselineTest(required any result){
		assertIsArray(result, "result should be an array");
		assertTrue(
			arrayLen(result) >= 1,
			"result should have at least one entry"
		);
		for (var i=1; i <= arrayLen(result); i++){
			assertEquivalentLists(
				"len,pos,string",
				structkeyList(result[i]),
				"Incorrect keys in element #i#"
			);
		}
	}
}