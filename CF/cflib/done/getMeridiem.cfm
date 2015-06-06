<cffunction name="getMeridiemOld" returntype="string" output="false">
	<cfargument name="timePassedIn" type="date" required="true" />
    
    <cfset var meridian = "" />
    
    <cfset arguments.timePassedIn = Trim( arguments.timePassedIn ) />
    <cfif not IsDate( arguments.timePassedIn )>
    	<cfreturn meridian />
    <cfelse>
    	<cfset meridian = TimeFormat( arguments.timePassedIn, "tt" ) />
    </cfif>
    
    <cfreturn meridian />
    
</cffunction>

<cfscript>
	string function getMeridiem(required date timePassedIn){
		
	}
	
	
</cfscript>


<cffunction name="getMeridiem" returntype="string" output="false">
	<cfargument name="timePassedIn" type="date" required="true" />
    
    <cfset var meridian = "" />
    
    <cfset arguments.timePassedIn = Trim( arguments.timePassedIn ) />
    <cfif not IsDate( arguments.timePassedIn )>
    	<cfreturn meridian />
    <cfelse>
    	<cfset meridian = TimeFormat( arguments.timePassedIn, "tt" ) />
    </cfif>
    
    <cfreturn meridian />
    
</cffunction>