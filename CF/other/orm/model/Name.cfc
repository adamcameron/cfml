<cfcomponent persistent="true" table="tbl_name">

	<cfproperty name="id" fieldtype="id" generator="native">
	<cfproperty	name="name" fieldtype="column">
	<cfproperty	name="dateCreated" fieldtype="column" datatype="timestamp">

	<cffunction name="onInsert">
		<cfset dateCreated = now()>
	</cffunction>

	<cffunction name="onUpdate">
		<cfargument name="previousdata" type="struct">
		<cfargument name="currentdata" type="struct">

		<cfset var sDump="">
<cfset variables.name = "OVERRIDE_NOW">
		<cfsavecontent variable="sDump">
			<cfdump var="#variables#" label="variables">
			<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope()">
		</cfsavecontent>
		<cffile action="write" file="C:\temp\onupdate.html" output="#sDump#">
	</cffunction>


</cfcomponent>

