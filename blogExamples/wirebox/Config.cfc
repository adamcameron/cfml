// Config.cfc
component accessors=true {
	string property dsn;

	public Config function init(required string dsn){
		setDsn(dsn);
		return this;
	}
	
}