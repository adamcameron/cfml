<!--- Impl.cfc --->
<cfcomponent implements="I">
	<cffunction name="g" output="false" returntype="string">
		<cfargument name="s" type="string" required="true">
		<cfreturn ucase(s)>
	</cffunction>
</cfcomponent>

<!---
component implements="I" {

	public string function g(required string s){
		return uCase(s);
	}
}--->