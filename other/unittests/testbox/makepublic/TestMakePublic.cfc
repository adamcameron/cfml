// TestMakePublic.cfc
component extends="mxunit.framework.TestCase" {

	public void function testMakePublic(){
		variables.test = new somepackage.ComponentInDifferentPackage();
		makepublic(variables.test, "aPackageMethod");
		assertEquals("test for this value", variables.test.aPackageMethod());
	}

}