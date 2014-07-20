// Application.cfc
component {

	this.name		= hash(getCurrentTemplatePath()) & "01";
	this.mappings	= {
		"/mxunit"	= expandPath("/shared/frameworks/mxunit")
	}; 

}