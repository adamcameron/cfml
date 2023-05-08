component {

    this.name = "syncTest02"
    this.timeout = createTimespan(0,0,1,0)

    loadDatasources()

    function onApplicationStart() {
        writeLog(file=this.name, text="#getFunctionCalledName()# start for #CGI.script_name#")
        queryExecute("CALL sleep_and_return(10)")
        writeLog(file=this.name, text="#getFunctionCalledName()# end for #CGI.script_name#")
    }

    function onSessionStart() {
        writeLog(file=this.name, text="#getFunctionCalledName()# start for #CGI.script_name#")
    }

    function onRequestStart() {
        writeLog(file=this.name, text="#getFunctionCalledName()# start for #CGI.script_name#")
    }

    function onRequest(template) {
        writeLog(file=this.name, text="#getFunctionCalledName()# start for #CGI.script_name#")
        include template;
        writeLog(file=this.name, text="#getFunctionCalledName()# end for #CGI.script_name#")
    }



    private void function loadDataSources() {
        this.datasources["dsn1"] = {
            type = "mysql",
            host = "database.backend",
            port = 3306,
            database = server.system.environment.MARIADB_DATABASE,
            username = server.system.environment.MARIADB_USER,
            password = server.system.environment.MARIADB_PASSWORD,
            custom = {
                useUnicode = true,
                characterEncoding = "UTF-8",
                noAccessToProcedureBodies = true
            }
        }

        this.datasource = "dsn1"
    }
}
