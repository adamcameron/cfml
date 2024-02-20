component {

    setsettings()
    loadDatasources()

    private void function setSettings() {
        this.name = "app1"
    }

    private void function loadDataSources() {
        this.datasources[this.name] = {
            type = "mysql",
            host = "database.backend",
            database = server.system.environment.MARIADB_DATABASE,
            username = server.system.environment.MARIADB_USER,
            password = server.system.environment.MARIADB_PASSWORD,
			custom = {
                useUnicode = true,
                characterEncoding = "UTF-8",
                connectionCollation = "utf8_general_ci"
            }
        }

        this.datasource = this.name
    }
}
