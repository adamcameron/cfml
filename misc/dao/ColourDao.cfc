component {

    variables.colours = queryNew(
        "id,en,mi",
        "integer,varchar,varchar",
        [
            [1,"red","whero"],
            [2,"orange","karaka"],
            [3,"yellow","kowhai"],
            [4,"green","kakariki"],
            [5,"blue","kikorangi"],
            [6,"indigo","poropango"],
            [10,"violet","papura"]
        ]
    )

    function selectColourById(id){
        return queryExecute("SELECT * FROM colours WHERE id = :id", {id=id}, {dbtype="query"})
    }
}
