component {

	public struct function sayMyName() returnFormat="json" {
		return {name="Adam"};
	}
	
	
	public any function onMissingMethod(string methodName, struct methodArguments){
		return "No method #arguments.methodName# with arguments #structKeyList(arguments.methodArguments)# found";
	}

}