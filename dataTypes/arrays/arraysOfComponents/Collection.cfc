component {

	variables.a = [];

	public C function getFirst(){
		return variables.a[1];
	}

	public void function append(required C c){
		arrayAppend(variables.a, C);
	}
	
	public C[] function getAll(){
		return variables.a;
	}
	
	public struct function getVariables(){
		return variables;
	}

}