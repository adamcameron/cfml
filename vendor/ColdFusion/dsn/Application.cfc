component {
	this.name = hash(getCurrentTemplatePath());
	this.datasources = {
        scratch_mysql = {
            database = "scratch2",
            host = "localhost",
            port = "3306",
            driver = "MySQL5",
            username = "scratch",
            password = "scratch"
        }
    };
	this.datasource = "scratch_mysql";
}