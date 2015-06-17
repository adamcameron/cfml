<cfcomponent extends="shared.cfcs.typeOf.second">

	<cfparam name="variables.config.class" default="third">

	<cfdump var="#getMetaData()#" label="third">
	<cfdump var="#this#" label="third">
	<cfdump var="#variables.config#" label="third">


</cfcomponent>