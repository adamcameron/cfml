<cfcomponent extends="Base" output="false" hint="This CFC is implemented entirely in tags">

	<cfprocessingdirective pageEncoding="utf-8">

	<cffunction name="someMethod" returntype="void" access="public" output="false" meta:someAnnotation="Its value" hint="This is a function which tags three arguments and does nothing with them">
		<cfargument name="reqdArg"				type="string" required="true"	hint="We need to pass this one">
		<cfargument name="defaultedOptionalArg"	type="string" required="false"	default="a default value" hint="This one has a default value if it's not passed">
		<cfargument name="optionalArg"			type="string" required="false"	hint="This one is entirely optional">
	</cffunction>
	
</cfcomponent>