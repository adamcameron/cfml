component {

	public string function toString(required Stringable s){
		return s.toString();
	}

	public string function toJson(required Jsonable s){
		return s.toJson();
	}

	public Stringable function createStringable(required any o){
		return o;
	}

	public Jsonable function createJsonable(required any o){
		return o;
	}

}