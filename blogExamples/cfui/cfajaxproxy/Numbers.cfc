// Numbers.cfc
component {

	variables.dao = new DAO();

	remote query function getAll() returnformat="json" {
		return variables.dao.getAll();
	}

	remote query function get(required numeric id) returnformat="json" {
		return variables.dao.get(id=id);
	}

}