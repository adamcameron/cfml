// TestValidator.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		variables.mb = new mockbox.system.testing.MockBox();
	}

public void function testIsValidOptionalValue_usingMockedCallback(){
	var oTestValidator = new Validator();

	var mockedValidatorLib = variables.mb.createStub();
	mockedValidatorLib.$("isOK", true);

	variables.mb.prepareMock(oTestValidator);
	oTestValidator.$("isOK", true);

	var validationTestArgs = {
		data = {paramToValidate="test_paramToValidate"},
		keyToValidate = "paramToValidate",
		validationCallback = mockedValidatorLib.isOK
	};
	var result = oTestValidator.isValidOptionalValue(argumentCollection=validationTestArgs);

	var callLog = oTestValidator.$callLog();
	assertTrue(oTestValidator.$once("isOK"));
	assertEquals(validationTestArgs.keyToValidate, callLog.isOk[1].keyToValidate);
	assertEquals(validationTestArgs.data.paramToValidate, callLog.isOk[1].data.paramToValidate);
}
}


/*

	public void function testIsValidOptionalValue_usingMockedCallback(){
		var oTestValidator = new Validator();

		var mockedValidatorLib = variables.mb.createStub();
		mockedValidatorLib.$("isOK", true);

		var validationTestArgs = {
			data = {paramToValidate="test_paramToValidate"},
			keyToValidate = "paramToValidate",
			validationCallback = mockedValidatorLib.isOK
		};
		var result = oTestValidator.isValidOptionalValue(argumentCollection=validationTestArgs);

		assertTrue(mockedValidatorLib.$once("isOK"));
		var callLog = mockedValidatorLib.$callLog();
		assertEquals(validationTestArgs.keyToValidate, callLog.isOk[1].keyToValidate);
		assertEquals(validationTestArgs.data.paramToValidate, callLog.isOk[1].data.paramToValidate);
	}




	public void function testIsValidOptionalValue_usingRealCallback(){
		var oTestValidator = new Validator();

		var validatorLib = new ValidatorLib();

		var validationTestArgs = {
			data = {paramToValidate="test_paramToValidate"},
			keyToValidate = "paramToValidate",
			validationCallback = validatorLib.isOK
		};

		var result = oTestValidator.isValidOptionalValue(argumentCollection=validationTestArgs);

	}

*/