component {

	/**
	@hint Asserts that two lists contain the same elements, irrespective of their ordering
	@list1 Expected value of list
	@list2 List to test
	@message Optional message text
	*/
	public void function assertEquivalentLists(required String list1, required String list2, String message=""){
		assertEquals(
			listSort(list1, "textnocase", "asc"),
			listSort(list2, "textnocase", "asc"),
			message
		);
		
	}
	
}