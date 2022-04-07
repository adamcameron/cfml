<cfscript>
// dynamicUsingCreateObject.cfm

include "config.cfm"

o = createObject(config.componentName).init(argumentCollection=config.initArgs)
</cfscript>