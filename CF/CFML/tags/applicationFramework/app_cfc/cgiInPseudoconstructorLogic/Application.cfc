<cfcomponent>
	<cfscript>
		
	this.name				= "testPseudoConstructor6";
	this.applicationTimeout	= createTimeSpan(0,0,1,0);
	this.sessionManagement	= true;
	this.sessionTimeout		= createTimeSpan(0,0,0,30);

	if (CGI.server_name == "localhost"){
		this.datasource = "dsn1";
	}else if (CGI.server_name == "testing.local"){
		this.datasource = "dsn2";
	}else{
		// yer out of luck, mate
	}


	function onApplicationStart(){
		logIt("onApplicationStart [#CGI.server_name#]");
	}

	function onSessionStart(){
		logIt("onSessionStart [#CGI.server_name#]");
	}

	function onRequestStart(){
		logIt("onRequestStart [#CGI.server_name#]");
	}

	function onRequest(){
		include arguments[1];
	}

	function onSessionEnd(){
		logIt("onSessionEnd [#CGI.server_name#]");
	}

	function onApplicationEnd(){
		logIt("onApplicationEnd [#CGI.server_name#]");
	}
	</cfscript>

	<cffunction name="logIt">
		<cfargument name="message">
		<cfparam name="this.dataSource" default="NOT_SET">
		<cflog file="#this.name#" text="Start of logIt(). #message# [#this.dataSource#]">
		<cftry>
			<cfquery>
			INSERT INTO t_test (
				tst_data
			) VALUES (
				'#message#'
			)
			</cfquery>
			<cfcatch>
				<cflog file="#this.name#" text="CATCH in logIt(). #message# [#this.dataSource#] [#e.message#] [#e.detail#]">
				<rethrow>
			</cfcatch>
		</cftry>
		<cflog file="#this.name#" text="End of logIt(). #message# [#this.dataSource#]">
	</cffunction>

</cfcomponent>
