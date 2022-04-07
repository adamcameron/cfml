// TestUserService.cfc
component extends="mxunit.framework.TestCase" {

	CRLF = chr(13) & chr(10);

	public void function beforeTests(){
		variables.mockbox = new mockbox.system.testing.Mockbox();

	}

	public void function setup(){
		variables.mockedUserDao = variables.mockbox.createMock("testapp.users.UserDAO"); 
		variables.mockedAuditLog = variables.mockbox.createEmptyMock("testapp.loggers.AuditLog"); 
		variables.userService = new testapp.users.UserService(
			userDAO = variables.mockedUserDao,
			auditLog = variables.mockedAuditLog
		);
		variables.mockbox.prepareMock(variables.userService);
	}

	public void function testInit(){
		assertIsTypeOf(variables.userService, "testapp.users.UserService");
	}

	public void function testGetUserById_validId(){
		var mockedGetUserByIdResult = variables.mockbox.querySim("MOCKED_COLUMN#CRLF#MOCKED_VALUE");
		variables.mockedUserDao.$("getUserById", mockedGetUserByIdResult);

		var mockedUserObject = variables.mockbox.createEmptyMock("testapp.users.User");
		variables.userService.$("setFromRecord", mockedUserObject);

		var testId = 17; // I generally pick prime numbers, and do not reuse any within a give CFC.
		var result = variables.userService.getUserById(testId);

		assertTrue(variables.mockedUserDao.$once("getUserById"), "DAO's getUserById() should have been called");
writeDump(variables.userService.$callLog());
abort;
		assertEquals(
			[testId],
			variables.mockedUserDao.$callLog().getUserById[1],
			"Incorrect data passed to setFromRecord()"
		);

		assertTrue(variables.userService.$once("setFromRecord"), "setFromRecord() should have been called");
		assertEquals(
			[mockedGetUserByIdResult],
			variables.userService.$callLog().setFromRecord[1],
			"Incorrect data passed to setFromRecord()"
		);

		assertEquals(
			mockedUserObject,
			result,
			"User returned from getUserById() was not the same as user returned from setFromRecord()"
		);
	}

	public void function testGetUserById_invalidId(){
		variables.mockedUserDao.$("getUserById", queryNew(""));// zero records

		expectException("InvalidUserException");
		variables.userService.getUserById(19);
	}

}