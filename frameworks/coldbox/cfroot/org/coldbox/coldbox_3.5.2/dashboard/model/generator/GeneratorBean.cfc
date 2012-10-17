<cfcomponent hint="A generator bean." output="false">

	<cffunction name="init" access="public" returntype="GeneratorBean" hint="Constructor" output="false" >
		<cfscript>
		instance = structnew();
		instance.appname = "";
		instance.applocation = "";
		instance.appTemplate = "Advanced";
		instance.rewriteengine = "mod_rewrite";
		
		//return
		return this;
		</cfscript>
	</cffunction>

	<cffunction name="getMemento" access="public" output="false" returntype="struct" hint="Get Memento">
		<cfreturn instance/>
	</cffunction>

	<cffunction name="setMemento" access="public" output="false" returntype="void" hint="Set Memento">
		<cfargument name="Memento" type="struct" required="true"/>
		<cfset instance = arguments.Memento/>
	</cffunction>

	<cffunction name="getappname" access="public" output="false" returntype="string" hint="Get appname">
		<cfreturn instance.appname/>
	</cffunction>

	<cffunction name="setappname" access="public" output="false" returntype="void" hint="Set appname">
		<cfargument name="appname" type="string" required="true"/>
		<cfset instance.appname = arguments.appname/>
	</cffunction>

	<cffunction name="getapplocation" access="public" output="false" returntype="string" hint="Get applocation">
		<cfreturn instance.applocation/>
	</cffunction>

	<cffunction name="setapplocation" access="public" output="false" returntype="void" hint="Set applocation">
		<cfargument name="applocation" type="string" required="true"/>
		<cfset instance.applocation = arguments.applocation/>
	</cffunction>

	<cffunction name="getappTemplate" access="public" returntype="any" output="false">
    	<cfreturn instance.appTemplate>
    </cffunction>
    <cffunction name="setappTemplate" access="public" returntype="void" output="false">
    	<cfargument name="appTemplate" type="any" required="true">
    	<cfset instance.appTemplate = arguments.appTemplate>
    </cffunction>
    
	<cffunction name="getrewriteengine" access="public" output="false" returntype="string" hint="Get rewriteengine">
		<cfreturn instance.rewriteengine/>
	</cffunction>
	
	<cffunction name="setrewriteengine" access="public" output="false" returntype="void" hint="Set rewriteengine">
		<cfargument name="rewriteengine" type="string" required="true"/>
		<cfset instance.rewriteengine = arguments.rewriteengine/>
	</cffunction>

</cfcomponent>