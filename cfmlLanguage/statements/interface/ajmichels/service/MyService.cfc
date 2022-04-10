<cfcomponent>
  
  <cffunction name="setImplementation" returnType="void">
    <cfargument name="myImplementation" type="interface.MyInterface" />
    <cfset variables.implementation = arguments.myImplementation />
  </cffunction>
  
</cfcomponent>