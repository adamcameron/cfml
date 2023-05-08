<!---
onApplicationStart (if not run before for this application)
onSessionStart (if not run before for this session)
onRequestStart
onRequest
onRequestEnd

 --->

<cfcomponent output="false">
	<cfset this.name = "myapp">
	<cfset this.applicationTimeout = createTimeSpan(0,2,0,0)>
	<cfset this.clientManagement = true>
	<cfset this.clientStorage = "registry">
	<cfset this.loginStorage = "session">
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimeSpan(0,2,0,0)>
	<cfset this.setClientCookies = true>
	<cfset this.setDomainCookies = true>
	<cfset this.scriptProtect = false>


	<cffunction name="onApplicationStart" returnType="boolean" output="false">

		<cfscript>
			Application.availableResources=0;
			Application.counter=1;
			Application.TMDSN = "personell";
			Application.servermessage = "";
			Application.siteVersion = 2;
			Application.error_email = "tim.garver@company.com";
			Application.sessions = 0;
			Application.sessionStruct = StructNew();
			Application.NAVANCONN = true;
			Application.AMFCounter = 0;
			Application.started = now();
			Application.SQL = createObject('component','CFC.SQL.sql').init(application.tmdsn,'','');
			Application.NTS = createObject('component','CFC.Security');
		</cfscript>

		<cftry>
			<!--- Test whether the DB is accessible by selecting some data. --->
			<cfquery name="testDB" dataSource="navan" maxrows="1">
				SELECT * FROM table
			</cfquery>
			<!--- If we get a database error, report an error to the user, log the
					error information, and do not start the application. --->
			<cfcatch type="any">
				<cfset Application.NAVANCONN = false>
				<cfset Application.servermessage = "Connection to Oracle is unavailable.">
				<cflog file="#This.Name#" type="error"
					text="navan DB not available. message: #cfcatch.message# Detail: #cfcatch.detail# Native Error: #cfcatch.NativeErrorCode#" >

			</cfcatch>
		</cftry>

		<cflog file="#This.Name#" type="Information" text="Application Started">
		<!--- You do not have to lock code in the onApplicationStart method that sets
				Application scope variables. --->

		<cfreturn true>
	</cffunction>

	<cffunction name="onApplicationEnd" returnType="void" output="false">
		<cfargument name="applicationScope" required="true">
	</cffunction>


	<!--- onSessionStart --->
	<cffunction name="onSessionStart" returntype="void">
		<!--- New session --->

		<cfscript>
			Session.myHost = "myhost";
			Session.loggedin = false;
			Session.MenuCache = "";
			Session.sharepoint = false;
			Session.user_name = "";
			Session.user_id = 0;
			Session.oracleID = 0;
			Session.started = now();
			Session.hasaccount = false;
		</cfscript>

		<cfif not IsDefined("Cookie.CFID") AND ISDefined("session.CFID") AND IsDefined("session.CFToken")>
			<CFLOCK SCOPE="SESSION" TYPE="READONLY" TIMEOUT="5">
				<CFCOOKIE NAME="CFID" VALUE="#SESSION.CFID#">
				<CFCOOKIE NAME="CFTOKEN" VALUE="#SESSION.CFTOKEN#">
			</CFLOCK>
		</cfif>

	</cffunction>



	<cffunction name="onError">
		<cfargument name="Exception" required=true/>
		<cfargument type="String" name="EventName" required=true/>

	</cffunction>


<!--- onRequestStart --->
	<cffunction name="onRequestStart" returnType="boolean">
		<cfargument type="String" name="targetPage">
		<cfset var sArray = arrayNew(1)>
		<cfset var retArray = arrayNew(1)>
		<cfset var excList = "">
		<cfset var username = "">

		<cfif #CGI.AUTH_USER# NEQ "">
			<cfset u = FIND("\",CGI.AUTH_USER,1) + 1>
			<cfset username = #MID(CGI.AUTH_USER,U,(LEN(CGI.AUTH_USER) - U) +1)#>
		<cfelseif IsDefined("form.j_username") AND Form.j_username NEQ "">
			<cfset username = TRIM(form.j_username)>
		</cfif>

		<cfset retArray[1] = false>
		<cfset excList = "gateway,loginas.cfm,sessions.cfm,NT_Template.cfm,error.cfm,createAccount.cfm,logout.cfm">
		<cfset URL.SP = 0>
		<cfset errorID = 0>


		<cflock scope="session" timeout="10" type="exclusive" throwontimeout="no">
		<cfif isDefined("session.loggedin") is false>
			<cfset session.loggedin = false>
		</cfif>
		</cflock>

		<!--- Page requested --->
		<cfif Len(ARGUMENTS.targetPage) GT 1>
			<cfset rpage = ListLast(ARGUMENTS.targetPage,"/")>
		<cfelse>
			<cfset rpage = "index.cfm">
		</cfif>



		<!--- ignore a few requests. --->
		<cfif ListFind(excList,rpage,",") GT 0>
			<cfreturn true>
		</cfif>
		<cfif ARGUMENTS.TargetPage CONTAINS ".cfc">
			<cfreturn true>
		</cfif>





		<cflog text="#username# Requesting #targetpage# (#rpage#)"
		type="Information" log="Application" file="Requests"
		thread="yes" date="yes" time="yes" application="yes">

		<cfif Session.loggedin AND rpage NEQ "logout.cfm">
			<cfreturn true>
		</cfif>



		<!--- security on the request --->
		<cfif (IsDefined("SESSION.sessionid") AND NOT Session.loggedin) OR NOT IsDefined("SESSION.sessionid")>
				<cftry>

					<cflog text="#username# attempting to log user in"
					type="Information" log="Application" file="Login" thread="yes" date="yes" time="yes" application="yes">
					<!--- main login command --->
					<cfset sArray = Application.NTS.doLogin(username)>
							<!--- returns an array, first element is a bool --->

					<cfif sArray[1]>

						<cfquery datasource="#tmdsn#" name="login">
							SELECT * FROM table
							WHERE <cfif sArray[4] gt 0>ID = #sArray[4]#<cfelse> user_login = '#TRIM(username)#'</cfif>
						</cfquery>



						<cflock scope="session" timeout="90" type="exclusive" throwontimeout="no">
							<cfif isDefined("session.sessionid")>
								<cfset myid = session.sessionid>
								<!--- <cfset ntid = session.user_id> --->
								<cflog text="Building session for #username#, user passed." type="Information" log="Application"
								file="Sessions" thread="yes" date="yes" time="yes" application="yes">
								<cfscript>
									Session.oracleID = #sArray[4]#;
									if(login.recordcount EQ 1){
										Session.hasaccount = true;
										x = statusChanged(myid,"user",#username#);
										if (isDefined("Session.userDAO") EQ false){
											Session.userDAO = StructNew();
										}
										tmpss = StructNew();
										tmpss.started = Session.started;
										Application.sessionStruct[SESSION.sessionid] = tmpss;
									} else {
										Session.hasaccount = false;
									}

								</cfscript>

							<cfelse>
							</cfif>
						</cflock>

						<cfif login.recordcount EQ 1>
							<!--- passed login  --->
							<!--- setup session and return page --->
							<cfset canLogin = setLogins(login)>

							<cfif canLogin[1] and sArray[2]>
								<cfset retArray[1] = true>
								<cfif canLogin[2] NEQ "">
									<cfset retArray[2] = canLogin[2]>
								<cfelse>
									<cfset retArray[2] = login.user_homepage>
								</cfif>
								<cfset retArray[3] = "ok">
							<cfelseif canLogin[1] and sArray[2] is false>
								<cfset retArray[1] = true>
								<cfif canLogin[2] NEQ "">
									<cfset retArray[2] = canLogin[2]>
								<cfelse>
									<cfset retArray[2] = login.user_homepage>
								</cfif>
								<cfset retArray[3] = "hr update failed">
							<cfelse>
								<cfset retArray[1] = false>
								<cfset retArray[3] = canLogin>
							</cfif>


							<cfreturn true>

						<cfelse>
							<cflog file="Security" type="Information"
								text="Could log #TRIM(username)# in, no local account">
							<cfset ID = 6>
							<cfinclude template="/tags/error.cfm">
							<cfreturn false>
						</cfif>
					<cfelse>
							<cfif sArray[5]>
								<cflog file="#This.Name#" type="Information"
								text="redirecting #TRIM(username)# to createAccount.cfm">

								<cflock scope="session" timeout="90" type="exclusive" throwontimeout="no">
									<cfset Session.hasaccount = false>
									<cfset Session.oracleID = #sArray[4]#>
								</cflock>

								<cfinclude template="createAccount.cfm">
								<cfreturn false>
							<cfelse>
								<cflog file="Security" type="Information"
								text="Could not create #TRIM(username)#, no local account">
								<cfset ID = 6>
								<cfinclude template="/tags/error.cfm">

								<cfreturn false>
							</cfif>
					</cfif>


					<cfcatch type="Any">
					<cfmail to="tim.garver@company.com" from="appserver@company.com" subject="onRequest failed" type="html">
					<cfdump var="#cfcatch#">
					</cfmail>
					<CF_NT_Template doctitle="MyApp - Error Occured" pagename="Error">
						<strong>Unfortunatly there has been an error on the requested page.</strong><BR>
						<cfif IsDefined("cfcatch.Diagnostics")><p><hr /><cfoutput>#cfcatch.Diagnostics#</cfoutput>
						<hr /></p></cfif>
						<p>This error was sent to the administrator and will address the issue as quickly as possible.</p>
						<p>You may hit the back button and try again or just wait until the issue is fixed.</p>
						<cfdump var="#cfcatch#">
					</cf_nt_template>
					<cfreturn false>
					</cfcatch>
				</cftry>


		</cfif>

	</cffunction>




	<!--- onRequestEnd --->
	<cffunction name="onRequestEnd" returnType="void" output="false">
		<cfargument name="thePage" type="string" required="true">
	</cffunction>

	<!--- onSessionEnd  --->
	<cffunction name="onSessionEnd">
		<cfargument name = "SessionScope" required="true"/>
		<cfargument name = "AppScope" required="true"/>
		<cfset var sessionLength = 0>
		<cftry>
		<cflock name="AppLock" timeout="35" type="Exclusive" throwontimeout="no">
			<cfset Arguments.AppScope.sessions = Arguments.AppScope.sessions - 1>
			<cfif isDefined("SessionScope.started")>
				<cfset sessionLength = TimeFormat(Now() - SessionScope.started,"H:mm:ss")>
			</cfif>
		</cflock>
		<cflog file="Sessions" type="Information"
			text="Session #Arguments.SessionScope.sessionid# ended. Length: #sessionLength# Active sessions: #Arguments.AppScope.sessions#">

		<cfcatch type="any">
			<cfmail to="tim.garver@company.com" from="field.service@company.com" subject="onSession End() error Alert" type="HTML">
			<cfdump var="#Arguments#">
			<cfdump var="#cfcatch#">
			</cfmail>
		</cfcatch>
		</cftry>
	</cffunction>




	<cffunction name="setLogins" access="private" returntype="array" output="false">
	<cfargument name="login" type="query" required="yes">
	<cfset var retArray = arrayNew(1)>
	<cfset retArray[1] = false>
	<cfset retArray[2] = "">
	<cfset retArray[3] = "">
	<cfset retArray[4] = "">
	<cftry>
	<cflogout><!--- log them out first --->

	<cflock timeout="20" throwontimeout="no" type="exclusive" scope="session">
	<cfscript>
		Session.myHost = "MyApp.com";
		Session.loggedin = false;
		Session.MenuCache = "";
		Session.sharepoint = false;
		Session.user_name = "";
		Session.user_id = 0;
		Session.oracleID = 0;
		Session.started = now();
		Session.hasaccount = false;
	</cfscript>
	</cflock>


	<cfif #login.recordcount# EQ 1>


			<cfquery name="login_group" datasource="#tmdsn#" maxrows=1 dbtype="ODBC">
			SELECT * FROM user_groups WHERE group_id = #login.group_id#
			</cfquery>
			<cfquery name="checkRights" datasource="#tmdsn#" maxrows=1 dbtype="ODBC">
			SELECT User_Rights.Roles_ID, User_Roles.Roles_Name FROM User_Rights INNER JOIN User_Roles ON User_Rights.Roles_ID = User_Roles.Roles_ID
			WHERE (User_Rights.Users_ID = #login.tech_id#)
			</cfquery>
			<cfif login.user_eic_ext NEQ "">
			<cfquery name="getTT" datasource="Timer">
			SELECT * FROM TT_TechTimer
			WHERE     (txtExt = N'#login.user_eic_ext#') AND (FSUPdated = 0) AND (dtTimeOut IS NULL) AND (txtCaseNumber IS NOT NULL)
			ORDER BY dtTimeIn
			</cfquery>
			</cfif>
				<cfif #checkRights.recordcount# NEQ 0 AND #login_group.recordcount# NEQ 0>
					<!--- User logged in. --->
					<cfset #foundgroup# = true>
					<cfquery name="my_group" datasource="#tmdsn#" maxrows=1 dbtype="ODBC">
					SELECT     *
					FROM        user_groups
					WHERE     group_leader = #login.tech_id#
					</cfquery>
					<cfif #login.user_zip# NEQ "">
					<cfquery name="my_zip" datasource="#tmdsn#" maxrows=1 dbtype="ODBC">
					SELECT     *
					FROM         ZIPInfo
					WHERE     (ZIP_Code = N'#TRIM(login.user_zip)#')
					</cfquery>
					</cfif>



					<cflock timeout="20" throwontimeout="no" type="exclusive" scope="application">

						<cfscript>
							Session.myHost = "MyApp";
							Session.MenuCache = "";
							Session.sharepoint = false;
							Session.started = now();
							Session.hasaccount = true;
						</cfscript>

						<cfset #session.loggedin# = true>
						<cfset #session.user_id# = #login.tech_id#>
						<cfset #session.user_name# = #login.first_name# & " " & #login.last_name# >
						<cfset #session.first_name# = #login.first_name#>
						<cfset #session.last_name# = #login.last_name#>
						<cfset #session.login_id# = #login.user_login#>
						<cfset #session.Van_login_id# = #login.user_Van_login#>
						<cfset #session.VAN_id# = #login.VID#>
						<cfset #session.user_email# = #login.user_email#>
						<cfset #session.user_rights# = #checkRights.Roles_ID#>
						<cfset #session.user_homepage# = #login.user_homepage#>
						<cfset #session.user_DID# = #login_group.dept_id#>
						<!--- <cfset #session.audLINID# = #LinID.NXTID#> --->
						<cfset #session.user_gid# = #login.group_id#>
						<cfset #session.user_locale# = SetLocale(TRIM(login.user_locale))>

						<cfif #my_group.recordcount# EQ 0>
							<cfset #session.group_id# = #login.group_id#>
						<cfelse>
							<cfset #session.group_id# = #my_group.group_id#>
						</cfif>
						<cfif #login.user_zip# NEQ "" AND my_zip.recordcount GTE 1>
							<cfset session.myLat = #my_zip.latitude#>
							<cfset session.myLon = #my_zip.longitude#>
						<cfelse>
							<cfset session.myLat = 0>
							<cfset session.myLon = 0>
						</cfif>
						<cfset #session.te_style# = #login_group.group_TE_style#>
						<cfset #session.user_role# = #checkRights.Roles_Name#>

					<!--- 	<cf_tag_setemp id=#login.tech_id#> --->

							<cflock name="UserDAO" timeout="5" type="exclusive">
							<cfscript>
							mObj = CreateObject("component","CFC.auser.userGateway");

							if(isDefined("session.userDAO") AND StructKeyExists(session.userDAO,login.tech_id)) {

								structDelete(session.userDAO,login.tech_id);
							}
							session.userDAO = mObj.get(login.tech_id);
							</cfscript>
							<cfif isDefined("SESSION.sessionid") and StructKeyExists(Application.sessionStruct,SESSION.sessionid)>
								<cflock timeout="30" throwontimeout="no" type="exclusive" scope="session">
								<cfscript>
								Application.sessionStruct[SESSION.sessionid].name=session.user_name;
								Application.sessionStruct[SESSION.sessionid].path=CGI.CF_Template_Path;
								Application.sessionStruct[SESSION.sessionid].ip=CGI.REMOTE_ADDR;
								</cfscript>
								</cflock>
							</cfif>
							</cflock>



						<cfset retArray[1] = true>

						<cfset retArray[3] = "#login.user_login#">
						<cfset retArray[4] = "#login.user_email#">
					</cflock>




				<cfif login.user_eic_ext NEQ "">
					<cfif getTT.recordcount gt 0>
						<cfset retArray[2] = "user_tt.cfm">
					</cfif>
				<cfelse>
					<cfset retArray[2] = "#login.user_homepage#">
				</cfif>

			<cfelse>
				<cfset retArray[2] = "../tags/error.cfm?id=1">
			</cfif>
	<cfelseif login.recordcount EQ 0>
		<cfset retArray[1] = false>
		<cfset retArray[2] = "../tags/error.cfm?id=6">
	<cfelse>
		<cfset retArray[1] = false>
		<cfset retArray[2] = "../tags/error.cfm?id=7">
	</cfif>

	<cfreturn retArray>
	<cfcatch type="any">

		<cfset retArray[1] = false>
		<cfset retArray[2] = "#cfcatch#">
		<cfreturn retArray>
	</cfcatch>
	</cftry>
	</cffunction>
</cfcomponent>