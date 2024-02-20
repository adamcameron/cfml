component {

    setsettings()
    loadDatasources()

    private void function setSettings() {
        this.name = "app1"
    }

    private void function loadDataSources() {
        this.datasources[this.name] = {
            driver = "mysql",
            class = "com.mysql.jdbc.Driver",
            url = "jdbc:mysql://database.backend:3306/"
                & "#server.system.environment.MARIADB_DATABASE#"
                & "?useUnicode=true&characterEncoding=UTF-8",
            username = server.system.environment.MARIADB_USER,
            password = server.system.environment.MARIADB_PASSWORD
        }

        this.datasource = this.name
    }
}
