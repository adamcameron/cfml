component {

	property name="phoneNumber";  
	property name="address";  

	public void function setPhoneNumber(string phoneNumber){
		writeLog(file="implicit", text="setPhoneNumber() called with value #arguments.phoneNumber#");
		variables.instance.phoneNumber = arguments.phoneNumber;
	}

	public string function getAddress(){
		writeLog(file="implicit", text="getAddress() called for value #variables.instance.address#");
		return variables.instance.address;
	}

	public void function setAddress(string address){
		writeLog(file="implicit", text="setAddress() called with value #arguments.address#");
		variables.instance.address = arguments.address;
	}
	
	public void function onMissingMethod(string missingMethodName, struct missingMethodArguments){
		writeLog(file="implicit", text="SuperC.onMissingMethod() called with arguments #serializeJson(arguments)#");
	}

}