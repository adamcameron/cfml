component extends="mxunit.framework.TestCase" {


	public void function beforeTests(){
		// these two lines will need to be changed when the CFC is moved
		//import "git.apps.linkedList.*";
		variables.cfcPath = "git.apps.linkedList";

		addAssertDecorator("Assertions");
	}


	public void function setup(){
		variables.testList = new LinkedList("first");
	}


	public void function testInit(){
		writeDump(getMetadata(variables.testList));abort;
		assertIsTypeOf(variables.testList, "LinkedList");
		assertTrue(
			structKeyExists(variables.testList, "data"),
			"data key missing from variables.testList"
		);
		assertEquals(
			"first",
			variables.testList.data,
			"Incorrect value set for data key in variables.testList"
		);
		assertTrue(
			structKeyExists(variables.testList, "id"),
			"id key missing from variables.testList"
		);
		assertTrue(
			structKeyExists(variables.testList, "nextElement"),
			"nextElement key missing from variables.testList"
		);
	}


	public void function testGetCurrent(){
		var current = variables.testList.getCurrent();
		assertIsStruct(current);
		assertEquivalentLists(
			"data,id,nextelement",
			structKeyList(current),
			"Keys in returned struct are incorrect"
		);
	}


	public void function testAppend(){
		var firstElementId = variables.testList.id;

		variables.testList.append("last");

		assertEquals(
			"last",
			variables.testList.data,
			"The appended element should have been the current one"
		);
		assert(
			variables.testList.isEndOfList(),
			"Appended element should be at the end of the list"
		);

		// check the next value has been set correctly
		assertEquals(
			0,
			structCount(variables.testList.nextElement),
			"Appended element has incorrect next value"
		);
	}


	public void function testPrepend(){
		var firstElementId = variables.testList.id;

		variables.testList.prepend("new first");
		assertEquals(
			"new first",
			variables.testList.data,
			"The appended element should have been the current one"
		);

		assert(
			variables.testList.isStartOfList(),
			"Prepended element should be at the start of the list"
		);

		// check the next value has been set correctly
		assertEquals(
			firstElementId,
			variables.testList.nextElement.id,
			"Prepended element has incorrect next value"
		);
	}


	public void function testInsertBefore(){
		var firstElementId = variables.testList.id;

		variables.testList.append("second");
		var secondElementId = variables.testList.id;

		variables.testList.insertBefore("before second");

		assertEquals(
			"before second",
			variables.testList.data,
			"The inserted element should have been the current one"
		);

		// check the next value has been set correctly
		assertEquals(
			secondElementId,
			variables.testList.nextElement.id,
			"Inserted element has incorrect next value"
		);
	}


	public void function testInsertBefore_first(){
		var firstElementId = variables.testList.id;

		variables.testList.insertBefore("before first");

		assertEquals(
			"before first",
			variables.testList.data,
			"The inserted element should have been the current one"
		);

		// check the next value has been set correctly
		assertEquals(
			firstElementId,
			variables.testList.nextElement.id,
			"Inserted element has incorrect next value"
		);
	}


	public void function testInsertAfter(){
		variables.testList.append("second");
		var secondElementId = variables.testList.id;
		variables.testList.append("third");
		var thirdElementId = variables.testList.id;
		variables.testList.first();
		variables.testList.next();	// now pointing at the second one

		// just verify we've set that lot up correctly
		assert(
			variables.testList.data == "second"
			&& variables.testList.nextElement.data == "third",
			"Test initialisation failed"
		);

		variables.testList.insertAfter("after second");

		assertEquals(
			"after second",
			variables.testList.data,
			"The inserted element should have been the current one"
		);

		// check the next value has been set correctly
		assertEquals(
			thirdElementId,
			variables.testList.nextElement.id,
			"Inserted element has incorrect next value"
		);
	}


	public void function testInsertAfter_last(){
		variables.testList = addElements(variables.testList);
		variables.testList.last();

		variables.testList.insertAfter("after last");

		assertEquals(
			"after last",
			variables.testList.data,
			"The inserted element should have been the current one"
		);
		var lastELementId = variables.testList.id;

		// check the next value has been set correctly
		variables.testList.previous();
		assertEquals(
			variables.testList.nextElement.id,
			lastELementId,
			"Preceding element has incorrect next value"
		);
	}


	public void function testPrevious(){
		variables.testList = addElements(variables.testList);
		variables.testList.last();	// just have to assume this works
		for (var data in ["fourth", "third", "second"]){
			assertEquals(
				data,
				variables.testList.data,
				"previous() failed to reach #data# element"
			);
			if (data != "first"){
				variables.testList.previous();
			}
		}
	}


	/**
	@mxunit:expectedException ElementOutOfBoundsException
	*/
	public void function testPrevious_beforeBeginning(){
		variables.testList.previous();
	}


	public void function testNext(){
		variables.testList = addElements(variables.testList);
		variables.testList.first();
		for (var data in ["first", "second", "third", "fourth"]){
			assertEquals(
				data,
				variables.testList.data,
				"next() failed to reach #data# element"
			);
			if (data != "fourth"){
				variables.testList.next();
			}
		}
	}


	public void function testNext_atEnd(){
		variables.testList.next();
		assertFalse(
			structKeyExists(variables.testList, "id"),
			"id should not have been present"
		);
		assertFalse(
			structKeyExists(variables.testList, "data"),
			"data should not have been present"
		);
		assertFalse(
			structKeyExists(variables.testList, "nextElement"),
			"nextElement should not have been present"
		);
	}

	/**
	@mxunit:expectedException ElementOutOfBoundsException
	*/
	public void function testNext_pastEnd(){
		variables.testList.next();
		variables.testList.next();
	}


	public void function testFirst(){
		var firstElementId	= variables.testList.id;
		variables.testList	= addElements(variables.testList);

		variables.testList.first();

		assertEquals(
			firstElementId,
			variables.testList.id,
			"first() failed"
		);
	}


	public void function testLast(){
		variables.testList	= addElements(variables.testList);
		var lastElementId	= variables.testList.nextElement.nextElement.nextElement.id;

		variables.testList.last();

		assertEquals(
			lastElementId,
			variables.testList.id,
			"last() failed"
		);
	}


	public void function testIsStartOfList(){
		variables.testList = addElements(variables.testList);

		assert(
			variables.testList.isStartOfList(),
			"isStartOfList() failed"
		);
		variables.testList.first();
		for (var i=2; i <= 4; i++){	// we're going from the second to the last element. We don't actually use i, but keep it in step with where we are
			variables.testList.next();
			assertFalse(
				variables.testList.isStartOfList(),
				"Element #i# incorrectly Flagged as start of list"
			);
		}
	}


	public void function testIsEndOfList(){
		variables.testList = addElements(variables.testList);

		for (var i=1; i <= 3; i++){
			assertFalse(
				variables.testList.isEndOfList(),
				"Element #i# incorrectly Flagged as end of list"
			);
			variables.testList.next();
		}
		assert(
			variables.testList.isEndOfList(),
			"isEndOfList() failed"
		);
	}


	public void function testDelete(){
		variables.testList = addElements(variables.testList);
		variables.testList.next();	// "second"
		variables.testList.delete();

		assertEquals(
			"third",
			variables.testList.data,
			"List is at incorrect position after deletion"
		);

		assertEquals(
			3,
			variables.testList.getSize(),
			"List has incorrect element count after deletion"
		);

		variables.testList.first();
		for (var key in ["first", "third", "fourth"]){
			assertEquals(
				key,
				variables.testList.data,
				"List has incorrect elements after deletion"
			);
			if (key != "fourth"){
				variables.testList.next();
			}
		}
	}


	public void function testDelete_lastElement(){
		variables.testList = addElements(variables.testList);
		variables.testList.last();	// "fourth"
		variables.testList.delete();

		assertEquals(
			"third",
			variables.testList.data,
			"List is at incorrect position after deletion"
		);

		assertEquals(
			3,
			variables.testList.getSize(),
			"List has incorrect element count after deletion"
		);

		variables.testList.first();
		for (var key in ["first", "second", "third"]){
			assertEquals(
				key,
				variables.testList.data,
				"List has incorrect elements after deletion"
			);
			if (key != "third"){
				variables.testList.next();
			}
		}
	}


	public void function testGetSize(){
		assertEquals(
			1,
			variables.testList.getSize(),
			"getSize() returned incorrect value"
		);
		variables.testList = addElements(variables.testList);
		assertEquals(
			4,
			variables.testList.getSize(),
			"getSize() returned incorrect value"
		);
	}


	public void function testListToArray(){
		variables.testList = addElements(variables.testList);

		var expected	= ["first", "second", "third", "fourth"];
		var actual		= variables.testList.listToArray();

		assertEquals(expected, actual);

	}


	public void function testHasMoreElements_true(){
		variables.testList = addElements(variables.testList);
		assert(variables.testList.hasMoreElements());	// we're at the beginning, so we do
	}


	public void function testHasMoreElements_false(){
		variables.testList = addElements(variables.testList);
		variables.testList.last();
		assertFalse(variables.testList.hasMoreElements());
	}


	public void function testHasMoreElements_penultimate(){
		variables.testList = addElements(variables.testList);
		variables.testList.last();
		variables.testList.previous();
		assert(variables.testList.hasMoreElements());
	}


	public void function testAfterEnd(){
		variables.testList = addElements(variables.testList);
		variables.testList.last();
		variables.testList.next();
		assert(
			variables.testList.afterEnd(),
			"afterEnd() returned incorrect value"
		);
	}


	/**
	@hint Tests with required data argument only
	*/
	public void function testCreateElement_baseline(){
		var testData = "test data";
		makePublic(variables.testList, "createElement");

		var element = variables.testList.createElement(testData);

		assertEquivalentLists(
			"data,id,nextelement",
			structKeyList(element),
			"Keys in returned struct are incorrect"
		);

		assertEquals(
			testData,
			element.data,
			"data incorrectly set"
		);

		assertEquals(
			0,
			structCount(element.nextElement),
			"nextElement incorrectly set"
		);
	}


	/**
	@hint Tests with nextElement
	*/
	public void function testCreateElement_withNext(){
		var testData	= "test data";
		var nextStruct	= {
			id	= createUuid()
		};
		makePublic(variables.testList, "createElement");

		var element = variables.testList.createElement(testData,nextStruct);

		assertEquivalentLists(
			"data,id,nextelement",
			structKeyList(element),
			"Keys in returned struct are incorrect"
		);

		assertEquals(
			testData,
			element.data,
			"data incorrectly set"
		);

		assertEquals(
			nextStruct.id,
			element.nextElement.id,
			"nextElement incorrectly set"
		);
	}


	public void function testExpose(){
		var currentElement = {
			data		= createUuid(),
			nextElement	= createUuid(),
			id			= createUuid()
		};
		variables.testList.setCurrentElement = setCurrentElement;
		variables.testList.setCurrentElement(currentElement);

		makePublic(variables.testList, "expose");
		variables.testList.expose();

		for (var key in currentElement){
			assertEquals(
				currentElement[key],
				variables.testList[key],
				"Expose failed for #key#"
			);
		}
	}


	// PRIVATE METHODS


	/**
	@hint checks that the previous element points to this one correctly
	*/
	private void function testPreviousElement(element){
		element.previous();
		// test that the previous element points to this one
		assertEquals(
			element.id,
			element.prevElement.nextElement.id,
			"Previous element has incorrect next value"
		);

		// test that the next element points back to this one
		assertEquals(
			element.id,
			element.nextElement.prevElement.id,
			"Previous element has incorrect next value"
		);
	}


	/**
	@hint A few tests need more elements than just the one, so add some more
	*/
	private LinkedList function addElements(LinkedList list){
		list.append("second");
		list.append("third");
		list.append("fourth");
		list.first();
		return list;
	}


	/**
	@hint Sets variables.currentElement.  Injected into the test object so as to test the expose() method
	*/
	private void function setCurrentElement(currentElement){
		variables.currentElement = currentElement;
	}

}