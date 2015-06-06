<cfcomponent output="false" hint="Filesystem-oriented Verity operations">


	<cffunction name="index" access="package" output="false" returntype="any" hint="Performs filesystem-oriented indexing operations.">
		<cfargument name="collection"	type="string"	required="true">
		<cfargument name="action"		type="string"	required="true">
		<cfargument name="type"			type="string"	required="false"	default="file">
		<cfargument name="title"		type="string"	required="false">
		<cfargument name="key"			type="string"	required="false"	default="">
		<cfargument name="custom1"		type="string"	required="false"	default="">
		<cfargument name="custom2"		type="string"	required="false"	default="">
		<cfargument name="custom3"		type="string"	required="false"	default="">
		<cfargument name="custom4"		type="string"	required="false"	default="">
		<cfargument name="category"		type="string"	required="false">
		<cfargument name="categoryTree"	type="string"	required="false">
		<cfargument name="urlPath"		type="string"	required="false">
		<cfargument name="extensions"	type="string"	required="false"	default="htm,html,cfm,cfml,dbm,dbml">
		<cfargument name="query"		type="query"	required="false">
		<cfargument name="recurse"		type="boolean"	required="false"	default="false">
		<cfargument name="language"		type="string"	required="false"	default="English">
		<cfargument name="prefix"		type="string"	required="false">

		<cfset var stStatus = structNew()>

		<cfif structKeyExists(arguments, "title")>
			<cfif structKeyExists(arguments, "category")>
				<cfif structKeyExists(arguments, "categoryTree")>
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#" categoryTree="#arguments.categoryTree#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#" categoryTree="#arguments.categoryTree#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				<cfelse><!--- categoryTree doesn't exist --->
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" category="#arguments.category#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				</cfif><!--- end of whether categoryTree exists --->
			<cfelse><!--- category doesn't exist --->
				<cfif structKeyExists(arguments, "categoryTree")>
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" categoryTree="#arguments.categoryTree#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" categoryTree="#arguments.categoryTree#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				<cfelse><!--- categoryTree doesn't exist --->
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" title="#arguments.title#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				</cfif><!--- end of whether categoryTree exists --->
			</cfif><!--- end of whether category exists --->
		<cfelse><!--- title doesn't exist --->
			<cfif structKeyExists(arguments, "category")>
				<cfif structKeyExists(arguments, "categoryTree")>
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#" categoryTree="#arguments.categoryTree#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#" categoryTree="#arguments.categoryTree#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				<cfelse><!--- categoryTree doesn't exist --->
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" category="#arguments.category#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				</cfif><!--- end of whether categoryTree exists --->
			<cfelse><!--- category doesn't exist --->
				<cfif structKeyExists(arguments, "categoryTree")>
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" categoryTree="#arguments.categoryTree#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" categoryTree="#arguments.categoryTree#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" categoryTree="#arguments.categoryTree#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				<cfelse><!--- categoryTree doesn't exist --->
					<cfif structKeyExists(arguments, "urlPath")>
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" urlPath="#arguments.urlPath#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" urlPath="#arguments.urlPath#">
						</cfif><!--- end of whether prefix exists --->
					<cfelse><!--- urlPath doesn't exist --->
						<cfif structKeyExists(arguments, "prefix")>
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#" prefix="#arguments.prefix#">
						<cfelse><!--- prefix doesn't exist --->
							<cfindex status="stStatus" collection="#arguments.collection#" action="#arguments.action#" type="#arguments.type#" key="#arguments.key#" extensions="#arguments.extensions#" recurse="#arguments.recurse#" language="#arguments.language#" custom1="#arguments.custom1#" custom2="#arguments.custom2#" custom3="#arguments.custom3#" custom4="#arguments.custom4#">
						</cfif><!--- end of whether prefix exists --->
					</cfif><!--- end of whether urlPath exists --->
				</cfif><!--- end of whether categoryTree exists --->
			</cfif><!--- end of whether category exists --->
		</cfif><!--- end of whether title exists --->


	<cfreturn stStatus>
</cffunction>


</cfcomponent>