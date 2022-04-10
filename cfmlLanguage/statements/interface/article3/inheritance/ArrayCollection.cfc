// ArrayCollection.cfc
component implements="Listable" {

	public ArrayCollection function init(required array array){
		variables.array = arguments.array;
		return this;
	}

	public boolean function next(){
		param name="variables.index" default=0;
		return ++variables.index <= arrayLen(variables.array);
	}

	public any function get(){
		return variables.array[variables.index];
	}

	public string function toString(){
		return get();
	}
}