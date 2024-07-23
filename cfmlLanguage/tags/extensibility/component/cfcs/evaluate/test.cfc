 <!---- Test.cfc ---->
 <cfcomponent>
 	<cffunction access="public" name="sum" returntype="numeric" output="false">
 		<cfargument name="lhs" type="numeric" required="yes">
 		<cfargument name="rhs" type="numeric" required="yes">
 		<cfscript>
 			return lhs * rhs;
 		</cfscript>
 	</cffunction>
 </cfcomponent>
