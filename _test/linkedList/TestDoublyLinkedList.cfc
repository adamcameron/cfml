component extends="mxunit.framework.TestCase" {


	public void function beforeTests(){
		import "shared.blog.linkedList.*";
		addAssertDecorator("shared._mxunit_test.Assertions");
	}
	

	public void function setup(){
		variables.testList = new CircularlyDoublyLinkedList("first"); 
	}


	public void function testInit(){
		assertIsTypeOf(variables.testList, "shared.blog.linkedList.CircularlyDoublyLinkedList");
		assertIsTypeOf(variables.testList, "shared.blog.linkedList.LinkedList");
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
			structKeyExists(variables.testList, "prevElement"),
			"prevElement key missing from variables.testList"
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
			"data,id,nextelement,prevelement",
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
		
		// check the previous value has been set correctly
		assertEquals(
			firstElementId,
			variables.testList.prevElement.id,
			"Appended element has incorrect prev value"
		);
		
		testNextPrev(variables.testList);
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
		
		// check the previous value has been set correctly
		assertEquals(
			firstElementId,
			variables.testList.prevElement.id,
			"Prepended element has incorrect prev value"
		);
		
		// check the next value has been set correctly
		assertEquals(
			firstElementId,
			variables.testList.nextElement.id,
			"Prepended element has incorrect next value"
		);
		
		testNextPrev(variables.testList);
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
		
		// check the previous value has been set correctly
		assertEquals(
			firstElementId,
			variables.testList.prevElement.id,
			"Inserted element has incorrect prev value"
		);
		
		// check the next value has been set correctly
		assertEquals(
			secondElementId,
			variables.testList.nextElement.id,
			"Inserted element has incorrect next value"
		);
		
		testNextPrev(variables.testList);
	}


	public void function testInsertAfter(){
		variables.testList.append("second");
		var secondElementId = variables.testList.id;
		variables.testList.append("third");
		var thirdElementId = variables.testList.id;
		variables.testList.previous();	// now pointing at the second one

		// just verify we've set that lot up correctly
		assert(
			variables.testList.data == "second"
			&& variables.testList.prevElement.data == "first"
			&& variables.testList.nextElement.data == "third",
			"Test initialisation failed"
		);

		variables.testList.insertAfter("after second");
		
		assertEquals(
			"after second",
			variables.testList.data,
			"The inserted element should have been the current one"
		);
		
		// check the previous value has been set correctly
		assertEquals(
			secondElementId,
			variables.testList.prevElement.id,
			"Inserted element has incorrect prev value"
		);
		
		// check the next value has been set correctly
		assertEquals(
			thirdElementId,
			variables.testList.nextElement.id,
			"Inserted element has incorrect next value"
		);
		
		testNextPrev(variables.testList);
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
			variables.testList.next();
		}
	}


	public void function testPrevious(){
		variables.testList = addElements(variables.testList);
		variables.testList.afterLast();	// just have to assume this works
		
		for (var data in ["fourth", "third", "second", "first"]){
			variables.testList.previous();
			assertEquals(
				data,
				variables.testList.data,
				"previous() failed to reach #data# element"
			);
		}
		
		// this should wrap back around to the first one
		variables.testList.previous();
		assertEquals(
			"fourth",
			variables.testList.data,
			"previous() failed wrap back around to the end of the list"
		);
	}


	public void function testBeforeFirst(){
		var firstElementId = variables.testList.id;
		variables.testList = addElements(variables.testList);
		
		variables.testList.beforeFirst();
		
		assertEquals(
			firstElementId,
			variables.testList.nextElement.id,
			"beforeFirst() failed"
		);
	}


	public void function testAfterLast(){
		variables.testList = addElements(variables.testList);
		var lastElementId = variables.testList.prevElement.id;
		
		variables.testList.afterLast();
		
		assertEquals(
			lastElementId,
			variables.testList.prevElement.id,	// if we're "after last" then the previous element should be the last ones
			"afterLast() failed"
		);
	}


	public void function testLast(){
		variables.testList	= addElements(variables.testList);
		var lastElementId = variables.testList.prevElement.id;

		variables.testList.last();
		
		assertEquals(
			lastElementId,
			variables.testList.id,
			"last() failed"
		);
	}


	public void function testIsEndOfList(){
		variables.testList	= addElements(variables.testList);
		
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

	/**
	@hint Tests with required data argument only
	*/
	public void function testCreateElement_baseline(){
		var testData = "test data";
		makePublic(variables.testList, "createElement");
		
		var element = variables.testList.createElement(testData);

		assertEquivalentLists(
			"data,id,nextelement,prevelement",
			structKeyList(element),
			"Keys in returned struct are incorrect"
		);
		
		assertEquals(
			testData,
			element.data,
			"data incorrectly set"
		);
		
		assertEquals(
			element.id,
			element.nextElement.id,
			"nextElement incorrectly set"
		);
		
		assertEquals(
			element.id,
			element.prevElement.id,
			"prevElement incorrectly set"
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
			"data,id,nextelement,prevelement",
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
		
		assertEquals(
			element.id,
			element.prevElement.id,
			"prevElement incorrectly set"
		);
	}


	/**
	@hint Tests with prevElement
	*/
	public void function testCreateElement_withPrev(){
		var testData	= "test data";
		var prevStruct	= {
			id	= createUuid()
		}; 
		makePublic(variables.testList, "createElement");
		
		var element = variables.testList.createElement(data=testData, prevElement=prevStruct);

		assertEquivalentLists(
			"data,id,nextelement,prevelement",
			structKeyList(element),
			"Keys in returned struct are incorrect"
		);
		
		assertEquals(
			testData,
			element.data,
			"data incorrectly set"
		);
		
		assertEquals(
			element.id,
			element.nextElement.id,
			"nextElement incorrectly set"
		);
		
		assertEquals(
			prevStruct.id,
			element.prevElement.id,
			"prevElement incorrectly set"
		);
	}


	/**
	@hint Tests with prevElement
	*/
	public void function testCreateElement_withBoth(){
		var testData	= "test data";
		var nextStruct	= {
			id	= createUuid()
		}; 
		var prevStruct	= {
			id	= createUuid()
		}; 
		makePublic(variables.testList, "createElement");
		
		var element = variables.testList.createElement(testData, nextStruct, prevStruct);

		assertEquivalentLists(
			"data,id,nextelement,prevelement",
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
		
		assertEquals(
			prevStruct.id,
			element.prevElement.id,
			"prevElement incorrectly set"
		);
	}


	public void function testExpose(){
		var currentElement = {
			data		= createUuid(),
			nextElement	= createUuid(),
			prevElement	= createUuid(),
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
	@hint checks that the previous and next elements point back to this one correctly
	*/
	private void function testNextPrev(element){
		
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
	private CircularlyDoublyLinkedList function addElements(CircularlyDoublyLinkedList list){
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