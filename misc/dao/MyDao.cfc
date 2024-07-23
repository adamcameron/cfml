component {

    variables.things = queryNew(
        "id,name",
        "integer,varchar",
        [
            [1, "one"],
            [2, "two"],
            [3, "three"]
        ]
    )

    function selectThingById(id){
        return queryExecute("SELECT * FROM things WHERE id = :id", {id=id}, {dbtype="query"})
    }
}
