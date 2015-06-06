<cfcomponent output="false" hint="Generic implementation of Search component.  Does not implement any of its methods: this CFC must be extended.">


	<cffunction name="init" output="false" returntype="com.strakerinteractive.search.Search" access="public" hint="Initialises the object.">
		<cfreturn this>
	</cffunction>


	<cffunction name="collection" access="public" output="false" returntype="any" hint="This method must be overloaded by the extending CFC.">
		<cfargument name="action"		type="string"	required="false"	default="list">
		<cfargument name="collection"	type="string"	required="false">
		<cfargument name="path"			type="string"	required="false">
		<cfargument name="language"		type="string"	required="false"	default="English">
		<cfargument name="name"			type="string"	required="false">
		<cfargument name="categories"	type="boolean"	required="false"	default="false">
		
		<cfreturn>
	</cffunction>


	<cffunction name="index" access="public" output="false" returntype="any" hint="This method must be overloaded by the extending CFC.">
		<cfargument name="collection"	type="string"	required="true">
		<cfargument name="action"		type="string"	required="true">
		<cfargument name="type"			type="string"	required="false">
		<cfargument name="title"		type="string"	required="false">
		<cfargument name="key"			type="string"	required="false"	default="">
		<cfargument name="body"			type="string"	required="false">
		<cfargument name="custom1"		type="string"	required="false">
		<cfargument name="custom2"		type="string"	required="false">
		<cfargument name="custom3"		type="string"	required="false">
		<cfargument name="custom4"		type="string"	required="false">
		<cfargument name="category"		type="string"	required="false">
		<cfargument name="categoryTree"	type="string"	required="false">
		<cfargument name="urlPath"		type="string"	required="false">
		<cfargument name="extensions"	type="string"	required="false"	default="htm,html,cfm,cfml,dbm,dbml">
		<cfargument name="query"		type="query"	required="false">
		<cfargument name="recurse"		type="boolean"	required="false"	default="false">
		<cfargument name="language"		type="string"	required="false"	default="English">
		<cfargument name="status"		type="string"	required="false">
		<cfargument name="prefix"		type="string"	required="false">

		<cfreturn>
	</cffunction>
	
	
	<cffunction name="search" access="public" output="false" returntype="struct" hint="This method must be overloaded by the extending CFC.">
		<cfargument name="name"						type="string"	required="false">
		<cfargument name="collection"				type="string"	required="true">
		<cfargument name="category"					type="string"	required="false">
		<cfargument name="categoryTree"				type="string"	required="false">
		<cfargument name="status"					type="string"	required="false">
		<cfargument name="type"						type="string"	required="false"	default="simple">
		<cfargument name="criteria"					type="string"	required="false">
		<cfargument name="maxrows"					type="string"	required="false"	default="All">
		<cfargument name="startRows"				type="numeric"	required="false"	default="1">
		<cfargument name="suggestions"				type="string"	required="false"	default="never">
		<cfargument name="contextPassages"			type="numeric"	required="false"	default="0">
		<cfargument name="contextBytes"				type="numeric"	required="false"	default="300">
		<cfargument name="contextHighlightBegin"	type="string"	required="false"	default="<b>">
		<cfargument name="contextHighlightEnd"		type="string"	required="false"	default="</b>">
		<cfargument name="previousCriteria"			type="string"	required="false">
		<cfargument name="language"					type="string"	required="false"	default="English">

		<cfreturn>
	</cffunction>


</cfcomponent>