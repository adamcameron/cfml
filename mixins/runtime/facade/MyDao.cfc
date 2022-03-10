component {

    public query function getRecords(required string orderBy, required numeric maxrows) {
        records = queryNew("id,en,mi", "integer,varchar,varchar", [
            [1,"red","whero"],
            [2,"green","kakariki"],
            [3,"blue","kikorangi"]
        ])
        return queryExecute(
            "SELECT * FROM records ORDER BY #orderBy#",
            {},
            {dbtype="query", maxrows=maxrows}
        )
    }
}
