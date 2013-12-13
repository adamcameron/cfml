// Complex.cfc
component implements="Jsonable" {

	public Complex function init(required struct struct){
		variables.struct = arguments.struct;
		return this;
	}
	
	public string function toString(){
		return toJson();
	}
	
	public string function toJson(){
		return serializeJson(variables.struct);
	}

}