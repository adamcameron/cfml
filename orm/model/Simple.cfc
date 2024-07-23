<cfcomponent persistent="true">

	<cfproperty name="id" fieldtype="id" generator="native">
	<cfproperty	name="name" fieldtype="column">

	<cffunction name="onInsert">
		<cfargument name="data" type="struct">
		<cflog file="simple" type="information" text="#arguments.data.name# saved">
	</cffunction>

	<cffunction name="onUpdate">
		<cfargument name="previousdata" type="struct">
		<cfargument name="currentdata" type="struct">
		<cflog file="simple" type="information" text="#arguments.currentdata.name# updated">
	</cffunction>

</cfcomponent>

