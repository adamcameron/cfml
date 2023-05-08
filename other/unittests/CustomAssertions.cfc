// CustomAssertions.cfc
component {

	public void function assertStructKeysCorrect(required string keys, required struct struct, string message){
		var assertionArgs = {
			expected = listSort(keys, "textnocase"),
			actual	 = listSort(structKeyList(struct), "textnocase")
		};
		if (structKeyExists(arguments, "message")){
			assertionArgs.message = message;
		}
		assertEquals(argumentCollection=assertionArgs);
	}

}