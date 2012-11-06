<!-----------------------------------------------------------------------Author 	 :	Curt GratzDate     :	Sept 23 2010Description :	This is a ColdBox event handler.Please note that the extends needs to point to the eventhandler.cfcin the ColdBox system directory.extends = coldbox.system.EventHandler-----------------------------------------------------------------------><cfcomponent name="generator"><!------------------------------------------- CONSTRUCTOR (If Needed) ------------------------------------------->	<!--- Dependencies --->	<cfproperty name="ServiceLocator" inject="model:GeneratorService" scope="instance"><!------------------------------------------- PUBLIC ------------------------------------------->	<cffunction name="dspHome" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<cfset var rc = Event.getCollection()>		<!--- EXIT HANDLERS: --->		<cfset rc.xehProcessDSN = "generator.doProcessDSN">		<!--- Get DSN's --->		<cfset rc.DSNs = getDSNs() />		<!--- Set view to render --->		<cfset Event.setView("Home")>	</cffunction>	<cffunction name="doProcessDSN" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<cfset var thisDSN = "" />		<cfset var rc = Event.getCollection()>		<!--- EXIT HANDLERS: --->		<cfset rc.xehGenerate = "generator.doGenerate">		<!--- Get Setup --->		<cfset rc.DSNs = getDSNs() />		<cfset rc.dbType = getDBType(event)>		<cfset rc.tables = getTables()>		<!--- Param Values --->		<cfset paramComponents(event)>		<!--- Set View --->		<cfset Event.setView("Components")>	</cffunction>	<cffunction name="doGenerate" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<cfset var rc = Event.getCollection()>		<cfset var ServiceLocator = instance.ServiceLocator>		<!--- EXIT HANDLERS: --->		<cfset rc.xehGenerate = "generator.doGenerate">		<!--- Get Setup --->		<cfset rc.DSNs = getDSNs() />		<cfset rc.dbType = getDBType(event)>		<cfset rc.tables = getTables()>		<!--- Get Table XML --->		<cfset ServiceLocator.getModel(rc.dbType).setTable(Event.getValue("table")) />		<cfset ServiceLocator.getModel(rc.dbType).setComponentPath(Event.getValue("componentPath")) />		<cfset rc.xmlTable = ServiceLocator.getModel(rc.dbType).getTableXML() />		<!--- Get Generated CFC's --->		<cfset ServiceLocator.getModel("xsl").configure(Event.getValue("dsn"),getSetting("xslBasePath")) />		<!--- get an array containing the generated code --->		<cfset rc.arrComponents = ServiceLocator.getModel("xsl").getComponents(rc.xmlTable) />		<!--- Set the View --->		<cfset Event.setView("Generation")>	</cffunction><!------------------------------------------- PRIVATE REUSABLE EVENTS ------------------------------------------->	<cffunction name="getDSNs" access="private" returntype="struct" output="false">		<cfreturn instance.ServiceLocator.getModel("adminAPIService").getdatasources() />	</cffunction>	<cffunction name="getDBType" access="private" returntype="string" output="false">		<cfargument name="Event" type="any">		<cfset var rc = Event.getCollection()>		<cfset var thisDSN = rc.DSNs[rc.dsn] />		<cfif thisDSN.driver eq "MSSQLServer"  or thisDSN.class contains "MSSQLServer">			<cfreturn "mssql" />		<cfelseif thisDSN.driver contains "mySQL" or thisDSN.class contains "mySQL">			<cfreturn "mysql" />		<cfelseif thisDSN.driver contains "Oracle" or thisDSN.class contains "Oracle">			<cfreturn "Oracle" />		</cfif>	</cffunction>	<cffunction name="getTables" access="private" returntype="query" output="false">		<cfset var rc = controller.getRequestService().getContext().getCollection()>		<cfset instance.ServiceLocator.getModel(rc.dbType).setDSN(rc.dsn)>		<cfreturn instance.ServiceLocator.getModel(rc.dbType).getTables() />	</cffunction>	<cffunction name="paramComponents" access="private" returntype="void" output="false">		<cfargument name="Event" type="any">		<cfset Event.paramValue("table", "")>		<cfset Event.paramValue("componentPath", "")>		<cfset Event.paramValue("generateService", "0")>		<cfset Event.paramValue("generateTO", "0")>		<cfset Event.paramValue("generateColdspringXML", "0")>	</cffunction></cfcomponent>