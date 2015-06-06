<cfcomponent>
	<cfscript>
	public boolean function canSerialize(){
		return true;
	}

	public string function serializeData(){
		return ucase(serializeJson(arguments[1]));
	}

	public boolean function canDeserialize(){
		return true;
	}

	public any function deserializeData(){
		return fromWddx(arguments[1]);
	}
	</cfscript>
	
	<cffunction name="toWddx">
		<cfset var wddx = "">
		<cfwddx action="cfml2wddx" input="#arguments[1]#" output="wddx">
		<cfreturn wddx>
	</cffunction>
	
	<cffunction name="fromWddx">
		<cfset var data = "">
		<cfwddx action="wddx2cfml" input="#arguments[1]#" output="data">
		<cfreturn data>
	</cffunction>
	
</cfcomponent>