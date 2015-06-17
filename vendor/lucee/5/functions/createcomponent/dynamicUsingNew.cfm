<cfscript>
// dynamicUsingNew.cfm

include "config.cfm"

o = new "#config.componentName#"(argumentCollection=config.initArgs)
</cfscript>