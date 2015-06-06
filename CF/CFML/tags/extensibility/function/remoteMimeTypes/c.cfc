<cfcomponent output="false">


	<cffunction name="stringAsDefault" returntype="string" access="remote" output="false">
		<cfreturn "Hello World">
	</cffunction>


	<cffunction name="stringAsPlain" returntype="string" access="remote" returnformat="plain" output="false">
		<cfreturn "Hello World">
	</cffunction>


	<cffunction name="stringAsWddx" returntype="string" access="remote" returnformat="wddx" output="false">
		<cfreturn "Hello World">
	</cffunction>


	<cffunction name="stringAsJson" returntype="string" access="remote" returnformat="json" output="false">
		<cfreturn "Hello World">
	</cffunction>


	<cffunction name="getXml" returntype="xml" access="private" output="false">
		<cfset var x = "">
		<cfxml variable="x">
			<hello>
				<world/>
			</hello>
		</cfxml>
		<cfreturn x>
	</cffunction>


	<cffunction name="xmlAsDefault" returntype="xml" access="remote" output="false">
		<cfreturn getXml()>
	</cffunction>


	<cffunction name="xmlAsPlain" returntype="xml" access="remote" returnformat="plain" output="false">
		<cfreturn getXml()>
	</cffunction>


	<cffunction name="xmlAsWddx" returntype="xml" access="remote" returnformat="wddx" output="false">
		<cfreturn getXml()>
	</cffunction>


	<cffunction name="xmlAsJson" returntype="xml" access="remote" returnformat="json" output="false">
		<cfreturn getXml()>
	</cffunction>


	<cffunction name="getStruct" returntype="struct" access="private" output="false">
		<cfset var st = structNew()>
		<cfset st.hello = "world">
		<cfreturn st>
	</cffunction>


	<cffunction name="structAsDefault" returntype="struct" access="remote" output="false">
		<cfreturn getStruct()>
	</cffunction>


	<cffunction name="structAsWddx" returntype="struct" access="remote" returnformat="wddx" output="false">
		<cfreturn getStruct()>
	</cffunction>


	<cffunction name="structAsJson" returntype="struct" access="remote" returnformat="json" output="false">
		<cfreturn getStruct()>
	</cffunction>


</cfcomponent>