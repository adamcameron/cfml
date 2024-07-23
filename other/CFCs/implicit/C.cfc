component extends="SuperC" {

	property name="firstName";  
	property name="lastName";  

	public void function setFirstName(string firstName){
		writeLog(file="implicit", text="setFirstName() called with value #arguments.firstName#");
		variables.instance.firstName = arguments.firstName;
	}

	public void function setLastName(string lastName){
		writeLog(file="implicit", text="setLastName() called with value #arguments.lastName#");
		variables.instance.lastName = arguments.lastName;
	}

	public struct function getInstance(){
		return variables.instance;
	}
	
	public void function onMissingMethod(string missingMethodName, struct missingMethodArguments){
		writeLog(file="implicit", text="onMissingMethod() called with arguments #serializeJson(arguments)#");
	}

}