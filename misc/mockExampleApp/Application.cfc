// Application.cfc
component {

    this.name = "mockExampleApp3"
    this.timeout = createTimespan(0,0,0,5)
    this.datasources[this.name] = {
        type = "mysql",
        host = "database.backend",
        port = 3306,
        database = "cfmlindocker",
        username = "cfmlindocker",
        password = server.system.environment.MARIADB_PASSWORD,
        custom = {
            useUnicode = true,
            characterEncoding = "UTF-8"
        }
    }

    this.localMode = "modern"
    this.datasource = this.name

    function onApplicationStart() {
        application.container = {}
        application.container.numberDao = new NumberDao()
        application.container.numberFactory = new NumberFactory(application.container.numberDao)
        application.container.numberController = new NumberController(application.container.numberFactory)
    }

}