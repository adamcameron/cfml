<cfcomponent>
	<cfproperty name="p2" type="boolean" hint="A Property" default="woo">
	<cfproperty name="p1" type="boolean" hint="A Property" default="wah">
<!--- 	<cfdump var="#this#" label="cProp"> --->
	<cffunction name="f">
		<cfdump var="#this#" label="f() this">
		<cfset md = getMetaData()>
		<cfdump var="#md#" label="f() getMetaData()">
		<cfdump var="#md.properties#" label="f() md.properties">
<!--- 		<cfdump var="#structFindKey(md.properties, 'name', 'all')#" label="f() structFindKey()"> --->
		<cfreturn true>
	</cffunction>

</cfcomponent>