<cffunction name="rethrow" output="false" returnType="void">
   <cftry>
      <cfcatch>
      <cfrethrow>
      </cfcatch>
   </cftry>
   <cfthrow type="Context validation error" message="Context validation error for CFRETHROW.">
</cffunction>

<cfscript>
	try {
		i = 1 / 0;

	} catch (any e){
		rethrow();
	}
</cfscript>