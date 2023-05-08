<cfcomponent implements="interface.MyInterface">
  
  <cffunction name="myFunc" returnType="string">
    <cfargument name="myArg" type="string" />
    <cfreturn "hello" & arguments.myArg />
  </cffunction>
  
</cfcomponent>