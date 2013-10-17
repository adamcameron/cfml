<cfscript>
	function isArrayOfStructs(array){
		var element	= "";
		var key		= "";

		if (!isArray(array)){
			return false;
		}
		for (element in array){
			if (!isStruct(element)){
				return false;
			}
		}
		return true;
	}
</cfscript>

<cffunction name="isArrayOfStructsOld" output="false" access="public" returntype="boolean" hint="returns a boolean to let you know if a variable is an array of structures">
	<cfargument name="arry" type="any" required="yes" hint="the alleged array of structs.">
	<cfargument name="simple" type="boolean" required="no" default="false" hint="flag to check if each each structure in each array element is simple.">
	<cfargument name="empty" type="boolean" required="no" default="false" hint="flag to allow an empty array to pass. ">
	<cfset var local = {"result"=false,"i"="","j"=""}>
	<cfif isArray(arry)>
		<cfif arrayIsEmpty(arry)>
			<cfif empty EQ true>
				<cfset local.result=true>
			</cfif>
		<cfelse>
			<cfset local.result = true>
			<cfloop array="#arry#" index="local.i">
				<cfif NOT isStruct(local.i)>
					<cfset local.result = false>
					<cfbreak>
				<cfelseif simple EQ true>
					<cfloop collection="#local.i#" item="local.j">
						<cfif NOT isSimpleValue(local.i[local.j])>
							<cfset local.result = false>
							<cfbreak>
						</cfif>
					</cfloop>
				</cfif>
			</cfloop>
		</cfif>
	</cfif>
	<cfreturn local.result>
</cffunction>

