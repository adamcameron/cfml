component {

	public void function getFirst(required query q){
		var first = new Query(
			dbtype	= "query",
			SQL		= "SELECT * FROM numbers WHERE id = 1",
			numbers	= numbers
		).execute().getResult();
		return first;
	}
	
}
