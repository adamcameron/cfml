<cfcomponent output="false" hint="Handles content">


	<cffunction name="getContent" returntype="string" access="remote" output="false" hint="Returns some content">
		<cfargument name="paras" type="numeric" required="true" hint="Paragraphs to fetch">
		<cfreturn createObject("component", "shared.cf.cfml.D.div.LoremIpsum").init().getText(
			number	= arguments.paras,
			unit	= "paragraphs"
		)>
	</cffunction>


</cfcomponent>