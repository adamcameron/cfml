component {

    function getRecords(required orderBy) {
        records = queryNew("id,mi,en", "int,varchar,varchar", [
            [1, "tahi", "one"],
            [2, "rua", "two"],
            [3, "toru", "three"],
            [4, "wha", "four"]
        ])

        return queryExecute("SELECT * FROM records ORDER BY #orderBy#", {}, {dbtype="query"})
    }
}
