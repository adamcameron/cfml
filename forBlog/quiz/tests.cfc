component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		variables.testFunctions = createObject("functions");
	}


	public void function testCurrentFilePath(){
		if (structKeyExists(variables, "testFunction")){	// this variable is defined in extending CFCs. These tests are "abstract" in this CFC
			test(getCurrentTemplatePath(), variables.testFunction);
		}
	}
	
	public void function testCurrentDirectoryPath(){
		if (structKeyExists(variables, "testFunction")){
			test(getDirectoryFromPath(getCurrentTemplatePath()), variables.testFunction);
		}
	}
	
	public void function testCurrentDirectoryPathNoTrailingSlash(){
		if (structKeyExists(variables, "testFunction")){
			var dir = getDirectoryFromPath(getCurrentTemplatePath());
			dir = reReplace(dir, "\\$", "", "ONE");
			test(dir, variables.testFunction);
		}
	}
	
	public void function testWebroot(){
		if (structKeyExists(variables, "testFunction")){
			test(expandPath("/"), variables.testFunction);
		}
	}
	
	public void function testWebrootNoTrailingSlash(){
		if (structKeyExists(variables, "testFunction")){
			var dir = expandPath("/");
			dir = reReplace(dir, "\\$", "", "ONE");
			test(dir, variables.testFunction);
		}
	}
	
	public void function testCfRoot(){
		if (structKeyExists(variables, "testFunction")){
			var dir = server.coldfusion.rootdir;	// errors on WINSTON
			test(dir, variables.testFunction, false);
		}
	}
	
	public void function testRoot(){
		if (structKeyExists(variables, "testFunction")){
			var dir = getRoot();					// errors on WINSTON
			test(dir, variables.testFunction, false);
		}
	}
	
	public void function testValidRelativeDirectoryPath(){
		if (structKeyExists(variables, "testFunction")){
			var dir = getDirectoryFromPath(getCurrentTemplatePath()) & ".."; // ie: parent of this dir (which is OK)
			test(dir, variables.testFunction);
		}
	}
	
	public void function testInvalidRelativeDirectoryPath(){
		if (structKeyExists(variables, "testFunction")){
			var dir = expandPath("/") & ".."; // ie: parent of the webroot (so NOT legal) defeats DALE, MATT, WINSTON
			test(dir, variables.testFunction, false);
		}
	}
	
	public void function testFakeDirectoryPath(){
		if (structKeyExists(variables, "testFunction")){
			var dir = "#getRoot()#fake/fake/fake/fake/fake/fake";	// defeats MATT
			test(dir, variables.testFunction, false);
		}
	}

	public void function testHack(){
		if (structKeyExists(variables, "testFunction")){
			var dir = "C:\windows\" & expandPath("/");	// defeats DALE & MATT errors on ADAM
			test(dir, variables.testFunction, false);
		}
	}

	public void function testCasing(){
		if (structKeyExists(variables, "testFunction")){
			var dir = ucase(expandPath("/"));
			test(dir, variables.testFunction, server.os.name contains "windows");	// ie: should pass on Win, fail on *nix
		}
	}
	
	
	
	private void function test(required string path, required function testFunction, boolean expected=true){
		var functionName = getMetadata(testFunction).name;
		if (expected){
			assertTrue(testFunction(path), "#functionName#() failed on #path#");
		}else{
			assertFalse(testFunction(path), "#functionName#() failed on #path#");
		}
	}
	
	private string function getRoot(){
		return reReplace(server.coldfusion.rootdir, "^([^\\/]*[\\/]).*", "\1", "ONE");
	}

}