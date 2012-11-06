<cfcomponent hint="A conventions bean" output="false">

	<cffunction name="init" access="public" output="false" returntype="ConventionsBean">
		<cfscript>
			instance = structnew();
			instance.configLocation = "";
			instance.handlerLocation = "";
			instance.layoutsLocation = "";
			instance.viewsLocation = "";
			instance.pluginsLocation = "";
			instance.eventAction = "";
			instance.modelsLocation = "";
			instance.modulesLocation = "";
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
	
	<cffunction name="getConfigLocation" access="public" output="false" returntype="string">
		<cfreturn instance.configLocation />
	</cffunction>
	<cffunction name="setConfigLocation" access="public" output="false" returntype="void">
		<cfargument name="configLocation" type="string" required="true" />
		<cfset instance.configLocation = arguments.configLocation />
	</cffunction>

	<cffunction name="getHandlerLocation" access="public" output="false" returntype="string">
		<cfreturn instance.handlerLocation />
	</cffunction>
	<cffunction name="setHandlerLocation" access="public" output="false" returntype="void">
		<cfargument name="handlerLocation" type="any" required="true" />
		<cfset instance.handlerLocation = arguments.handlerLocation />
	</cffunction>

	<cffunction name="getLayoutsLocation" access="public" output="false" returntype="string">
		<cfreturn instance.layoutsLocation />
	</cffunction>
	<cffunction name="setLayoutsLocation" access="public" output="false" returntype="void">
		<cfargument name="layoutsLocation" type="any" required="true" />
		<cfset instance.layoutsLocation = arguments.layoutsLocation />
	</cffunction>

	<cffunction name="getViewsLocation" access="public" output="false" returntype="string">
		<cfreturn instance.viewsLocation />
	</cffunction>
	<cffunction name="setViewsLocation" access="public" output="false" returntype="void">
		<cfargument name="viewsLocation" type="string" required="true" />
		<cfset instance.viewsLocation = arguments.viewsLocation />
	</cffunction>
	
	<cffunction name="getpluginsLocation" access="public" output="false" returntype="string" hint="Get pluginsLocation">
		<cfreturn instance.pluginsLocation/>
	</cffunction>	
	<cffunction name="setpluginsLocation" access="public" output="false" returntype="void" hint="Set pluginsLocation">
		<cfargument name="pluginsLocation" type="string" required="true"/>
		<cfset instance.pluginsLocation = arguments.pluginsLocation/>
	</cffunction>
	
	<cffunction name="geteventAction" access="public" output="false" returntype="string" hint="Get eventAction">
		<cfreturn instance.eventAction/>
	</cffunction>	
	<cffunction name="seteventAction" access="public" output="false" returntype="void" hint="Set eventAction">
		<cfargument name="eventAction" type="string" required="true"/>
		<cfset instance.eventAction = arguments.eventAction/>
	</cffunction>
	
	<cffunction name="getmodelsLocation" access="public" output="false" returntype="string" hint="Get modelsLocation">
		<cfreturn instance.modelsLocation/>
	</cffunction>
	<cffunction name="setmodelsLocation" access="public" output="false" returntype="void" hint="Set modelsLocation">
		<cfargument name="modelsLocation" type="string" required="true"/>
		<cfset instance.modelsLocation = arguments.modelsLocation/>
	</cffunction>
	
	<cffunction name="getmodulesLocation" access="public" returntype="any" output="false">
    	<cfreturn instance.modulesLocation>
    </cffunction>
    <cffunction name="setmodulesLocation" access="public" returntype="void" output="false">
    	<cfargument name="modulesLocation" type="any" required="true">
    	<cfset instance.modulesLocation = arguments.modulesLocation>
    </cffunction>
    
	
	<cffunction name="validate" access="public" returntype="boolean" hint="Validates its contents." output="false" >
		<cfscript>
		var key = "";
		var validate = true;
		
		//Loop and verify
		for ( key in instance ){
			if ( len(trim(instance[key])) eq 0 ){
				validate = false;
				break;
			}
		}
		//return validation.
		return validate;
		</cfscript>
	</cffunction>
	
</cfcomponent>