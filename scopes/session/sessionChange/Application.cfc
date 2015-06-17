component {
	This.name = 'ApplicationName2';
	this.clientmanagement="no";
	This.sessionManagement = "yes";
	This.applicationtimeout = CreateTimeSpan(0,1,0,0);
	This.sessionTimeout = CreateTimeSpan(0,0,20,0);
	This.scriptProtect="All";
	This.setclientcookies = "yes";
	This.setdomaincookies = "no";
}