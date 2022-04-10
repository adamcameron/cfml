component {

    //this.name = "cfml"

	this.datasources["cfml"] = {
        type = "mysql",
        host = "database.backend",
        port = 3306,
        database = "cfml",
        username = "cfml",
        password = server.system.environment.MARIADB_PASSWORD,
        custom = {
            useUnicode = true,
            characterEncoding = "UTF-8"
        }
    }

    this.datasource = "cfml"
    this.localMode = "modern"
}
