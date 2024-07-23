component {

    setsettings()
    loadDatasources()
    loadMappings()

    private void function setSettings() {
        this.name = "lucee_and_mysql"
        this.localMode = "modern"
    }

    private void function loadDataSources() {
        this.datasources[this.name] = {
            type = "mysql",
            host = "database.backend",
            port = 3306,
            database = this.name,
            username = this.name,
            password = server.system.environment.MYSQL_PASSWORD,
            custom = {
                useUnicode = true,
                characterEncoding = "UTF-8",
                connectionCollation = "utf8_general_ci",
                noAccessToProcedureBodies = true
            }
        }

        this.datasource = this.name
    }

    private void function loadMappings() {
    }
}
