// NumberDao.cfc
component {

    function insert(english, maori) {
        queryExecute(
            "INSERT INTO numbers (english, maori) VALUES (:english, :maori)",
            {english=english, maori=maori}
        )
    }
}