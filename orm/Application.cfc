component {

	THIS.name				= "scratch";
	this.sessionManagement	= true;
	this.clientManagement	= true;
	this.clientStorage		= "cookie";
	this.setClientCookies	= true;
	this.setDomainCookies	= false;

	// ORM stuff
	this.ormEnabled			= true;
	this.ormSettings		= {
								dialect				= "MicrosoftSQLServer",
								savemapping			= false,
								dbcreate			= "dropcreate",	// update
								interceptorenabled	= true,
								/*interceptor			= "orm.services.HibernateInterceptor",*/
								cfclocation			= [
									expandPath("/orm/model/")
								]
							};

	public boolean function onRequestStart(string targetPage){
		if (structKeyExists(URL, "initApp") and isBoolean(URL.initApp) and URL.initApp){
			applicationStop();
		}
		return true;
	}


}