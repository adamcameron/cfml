<cfscript>
// dynamicUsingImprovedCreateObject.cfm

createObject = function(componentOrType, componentOrInitArgs={}){
	switch (componentOrType) {
		case "component":
			return createObject(componentOrInitArgs)
		case "java":
			return createObject("java", componentOrInitArgs)
		// etc for other options
		default:
			return createObject(componentOrType).init(argumentCollection=componentOrInitArgs)
		break;
	}
}


include "config.cfm"

echo("Component using traditional syntax")
o = variables.createObject("component", config.componentName).init(argumentCollection=config.initArgs)

echo("<hr>Java using new syntax")
o = variables.createObject("java", "java.lang.String").init("hi")
dump([o])

echo("<hr>Component using new syntax")
o = variables.createObject(config.componentName, config.initArgs)
</cfscript>