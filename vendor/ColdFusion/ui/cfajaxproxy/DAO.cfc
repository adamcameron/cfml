// DAO.cfc

component {

	variables.numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
		[1,"one","tahi"],
		[2,"two","two"],
		[3,"three","three"],
		[4,"four","four"]
	]);

	public query function getAll() {
		return variables.numbers;
	}
	
	public query function get(required numeric id) {
		return new Query(dbtype="query", sql="SELECT * FROM numbers WHERE id=#id#", numbers=variables.numbers).execute().getResult();
	}
}
