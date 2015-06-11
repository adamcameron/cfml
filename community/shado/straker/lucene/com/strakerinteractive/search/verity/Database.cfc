<cfcomponent output="false" hint="Database-oriented Verity operations">


	<cffunction name="index" access="package" output="false" returntype="any" hint="Performs database-oriented indexing operations.">
		<cfargument name="collection"	type="string"	required="true">
		<cfargument name="action"		type="string"	required="true">
		<cfargument name="title"		type="string"	required="false">
		<cfargument name="key"			type="string"	required="false"	default="">
		<cfargument name="body"			type="string"	required="false">
		<cfargument name="custom1"		type="string"	required="false"	default="">
		<cfargument name="custom2"		type="string"	required="false"	default="">
		<cfargument name="custom3"		type="string"	required="false"	default="">
		<cfargument name="custom4"		type="string"	required="false"	default="">
		<cfargument name="category"		type="string"	required="false">
		<cfargument name="categoryTree"	type="string"	required="false">
		<cfargument name="query"		type="query"	required="false">
		<cfargument name="language"		type="string"	required="false"	default="English">

		<cfset var stStatus = structNew()>
		
		<cfif structKeyExists(arguments, "title")>
			<cfif structKeyExists(arguments, "body")>
				<cfif structKeyExists(arguments, "category")>
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#" body="#arguments.body#" category="#arguments.category#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#" body="#arguments.body#" category="#arguments.category#">
					</cfif><!--- end of whether categoryTree exists --->
				<cfelse><!--- category doesn't exist --->
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#" body="#arguments.body#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#" body="#arguments.body#">
					</cfif><!--- end of whether categoryTree exists --->
				</cfif><!--- end of whether category exists --->
			<cfelse><!--- body doesn't exist --->
				<cfif structKeyExists(arguments, "category")>
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#" category="#arguments.category#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#" category="#arguments.category#">
					</cfif><!--- end of whether categoryTree exists --->
				<cfelse><!--- category doesn't exist --->
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" title="#arguments.title#">
					</cfif><!--- end of whether categoryTree exists --->
				</cfif><!--- end of whether category exists --->
			</cfif><!--- end of whether body exists --->
		<cfelse><!--- title doesn't exist --->
			<cfif structKeyExists(arguments, "body")>
				<cfif structKeyExists(arguments, "category")>
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" body="#arguments.body#" category="#arguments.category#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" body="#arguments.body#" category="#arguments.category#">
					</cfif><!--- end of whether categoryTree exists --->
				<cfelse><!--- category doesn't exist --->
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" body="#arguments.body#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" body="#arguments.body#">
					</cfif><!--- end of whether categoryTree exists --->
				</cfif><!--- end of whether category exists --->
			<cfelse><!--- body doesn't exist --->
				<cfif structKeyExists(arguments, "category")>
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" category="#arguments.category#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" category="#arguments.category#">
					</cfif><!--- end of whether categoryTree exists --->
				<cfelse><!--- category doesn't exist --->
					<cfif structKeyExists(arguments, "categoryTree")>
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#" categoryTree="#arguments.categoryTree#">
					<cfelse><!--- categoryTree doesn't exist --->
						<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" query="#arguments.query#">
					</cfif><!--- end of whether categoryTree exists --->
				</cfif><!--- end of whether category exists --->
			</cfif><!--- end of whether body exists --->
		</cfif><!--- end of whether title exists --->

		<cfreturn stStatus>
	</cffunction>


</cfcomponent>