
component {

	this.name = "&lt;application-name&gt;"; // name of the application context

// regional
	// default locale used for formating dates, numbers ...
	this.locale = "en_US"; 
	// default timezone used
	this.timezone = "America/Chicago"; 

// scope handling
	// lifespan of a untouched application scope
	this.applicationTimeout = createTimeSpan( 1, 0, 0, 0 ); 
	
	// session handling enabled or not
	this.sessionManagement = true; 
	// cfml or jee based sessions
	this.sessionType = "j2ee"; 
	// untouched session lifespan
	this.sessionTimeout = createTimeSpan( 0, 0, 30, 0 ); 
	this.sessionStorage = "memory";
	
	// client scope enabled or not
	this.clientManagement = false; 
	this.clientTimeout = createTimeSpan( 90, 0, 0, 0 );
	this.clientStorage = "cookie";
						
	// using domain cookies or not
	this.setDomainCookies = false; 
	this.setClientCookies = true;

	// prefer the local scope at unscoped write
	this.localMode = "classic"; 
	
	// buffer the output of a tag/function body to output in case of a exception
	this.bufferOutput = true; 
	this.compression = false;
	this.suppressRemoteComponentContent = false;
	
	// If set to false Railo ignores type defintions with function arguments and return values
	this.typeChecking = true;
	
	
// request
	// max lifespan of a running request
	this.requestTimeout=createTimeSpan(0,0,10,0); 

// charset
	this.charset.web="UTF-8";
	this.charset.resource="UTF-8";
	
	this.scopeCascading = "standard";
	

//////////////////////////////////////////////
//               DATASOURCES                //
//////////////////////////////////////////////
	
	this.datasources["scratch_embedded"] = {
	  class: 'org.h2.Driver'
	, connectionString: 'jdbc:h2:C:\data\H2\scratch;MODE=MySQL'
	, username: 'scratch'
	, password: "encrypted:aed9f464ae23fb9993eac56947f5787d1c2be412d8471262"
	};
	

//////////////////////////////////////////////
//               MAPPINGS                   //
//////////////////////////////////////////////

}
