component persistent=true rest=true restPath="todo" {

	property name="id" fieldtype="id" ormtype="integer" unique=true;
	property name="description";
	property name="status";

	/**
	* @httpmethod 	GET
	* @restPath		""
	*/ 
	remote array function getAll() {
		return entityLoad("Todo")
	}

	/**
	* @httpmethod 	GET
	* @restPath		"page"
	* @page.restargsource	query
	* @size.restargsource	query
	*/ 
	remote struct function getWithPagination(numeric page=1, numeric size=10) {
		var entities = entityLoad("Todo")
		var entitiesCount = entities.len()
		var startRecord = ((page-1) * size) + 1
		var endRecord	= startRecord + (size - 1)

		var filteredEntities = entities.filter(function(entity, index, array){
			return (index >= startRecord) && (index <= endRecord)
		})
		return {
			"total"		= entitiesCount,
			"per_page"	= size,
			"page"		= page,
			"todos"		= filteredEntities,
			startRecord=startRecord,
			endRecord=endRecord
		}
	}

	/**
	* @httpmethod		GET
	* @restPath			{id}
	* @id.restargsource	path
	*/ 
	remote Todo function getById(required numeric id){
		return entityLoad("Todo", arguments.id, true)
	}

	/**
	* @httpmethod	GET
	* @restPath		asquery
	*/ 
	remote query function getAllAsQuery() {
		return queryExecute("SELECT * FROM todo")
	}

	/**
	* @httpmethod		GET
	* @restPath			asquery/{id}
	* @id.restargsource	path
	*/ 
	remote query function getByIdAsQuery(required numeric id) {
		return queryExecute("SELECT * FROM todo WHERE id = ?",[arguments.id])
	}

	/**
	* @httpmethod		GET
	* @restPath			astodo/{id}
	* @id.restargsource	path
	*/ 
	remote struct function getByIdAsTodo(required numeric id) {
		var obj = entityLoad("Todo", arguments.id, true)
		return {"todo"=obj}
	}

	/**
	* @httpmethod		GET
	* @restPath			abbrev/{id}
	* @id.restargsource	path
	*/ 
	remote struct function getByIdUsingAbbreviated(required numeric id) {
		var obj = entityLoad("Todo", arguments.id, true)
		return {i=obj.id,d=obj.description,s=obj.status}
	}

	/**
	* @httpmethod			PUT
	* @restpath				{id}
	* @id.restargsource		path
	* @body.restargsource	body
	*/
	remote void function putById(required numeric id, required string body) {
		var body = deserializeJson(body)
		var entity = new Todo()
		entity.setId(arguments.id)
		entity.setDescription(body.description)
		entity.setStatus(body.status)

		entitySave(entity)
	}

	/**
	* @httpmethod			PUT
	* @restpath				abbrev/{i}
	* @i.restargsource		path
	* @body.restargsource	body
	*/
	remote void function putByIdUsingAbbreviated(required numeric i, required string body) {
		var body = deserializeJson(body)
		var entity = new Todo()
		entity.setId(arguments.i)
		entity.setDescription(body.d)
		entity.setStatus(body.s)

		entitySave(entity)
	}

	/**
	* @httpmethod			PUT
	* @restpath				""
	* @body.restargsource	body
	*/
	remote void function bulkPut(required string body) {
		var body = deserializeJson(body)
		body.each(function(object,index,array){
			var entity = new Todo()
			entity.setId(object.i)
			entity.setDescription(object.d)
			entity.setStatus(object.s)

			entitySave(entity)
		});
	}


}