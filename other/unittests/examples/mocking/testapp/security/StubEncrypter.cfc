// StubEncrypter.cfc
component implements="Encrypter" {

	prefix = "ENCRYPTED_";

	public string function encrypt(required string string){
		return "#prefix##string#";
	}
	public string function decrypt(required string string){
		return reReplace(string, "^#prefix#", "", "ONE");
	}

}