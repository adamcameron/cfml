<cfcomponent name="listingManager" access="remote" hint="Remote Facade for listing">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="search" output="false" hint="Search for listing matching the criteria" access="remote" returntype="query">
	<cfargument name="mls_id" required="false" type="string" default="" hint="Primary key"/>
	<cfargument name="status" required="false" type="string" default="" hint="Status"/>
	<cfargument name="price" required="false" type="numeric" default="0" hint="Price"/>
	<cfargument name="bedrooms" required="false" type="numeric" default="0" hint="Bedrooms"/>
	<cfargument name="bathrooms" required="false" type="numeric" default="0" hint="Bathrooms"/>
	<cfargument name="footage" required="false" type="numeric" default="0" hint="Footage"/>
	<cfargument name="hasPool" required="false" type="boolean"  hint="Pool"/>
	<cfargument name="hasLaundry" required="false" type="boolean"  hint="Laundry"/>
	<cfargument name="hasFireplace" required="false" type="boolean"  hint="Fireplace"/>
	<cfargument name="hasWalkInClosets" required="false" type="boolean"  hint="Walk-in-closets"/>
		<!--- call a component sitting in memory (application scope) --->
		<cfreturn application.listingGateway.search(argumentCollection=arguments) />
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="create" access="remote" returntype="struct" output="false" description="Creates a listing">
	<cfargument name="mls_id" required="true" type="string" hint="Primary key"/>
	<cfargument name="address" required="true" type="string" hint="Address"/>
	<cfargument name="city" required="true" type="string" hint="City"/>
	<cfargument name="state" required="true" type="string" hint="State"/>
	<cfargument name="zipcode" required="false" type="string" default="" hint="Zip code"/>
	<cfargument name="status" required="false" type="string" default="" hint="Status"/>
	<cfargument name="price" required="true" type="numeric" hint="Price"/>
	<cfargument name="bedrooms" required="false" type="numeric" default="0" hint="Bedrooms"/>
	<cfargument name="bathrooms" required="false" type="numeric" default="0" hint="Bathrooms"/>
	<cfargument name="stories" required="false" type="string" default="" hint="Stories"/>
	<cfargument name="footage" required="false" type="numeric" default="0" hint="Footage"/>
	<cfargument name="yearBuilt" required="false" type="numeric" default="0" hint="Year Built"/>
	<cfargument name="type" required="false" type="string" default="" hint="Type"/>
	<cfargument name="listedOn" required="false" hint="Date listed"/>
	<cfargument name="hasPool" required="false" type="boolean" default="true" hint="Pool"/>
	<cfargument name="hasLaundry" required="false" type="boolean" default="true" hint="Laundry"/>
	<cfargument name="hasFireplace" required="false" type="boolean" default="true" hint="Fireplace"/>
	<cfargument name="hasWalkInClosets" required="false" type="boolean" default="true" hint="Walk-in-closets"/>
	<cfargument name="remarks" required="false" type="string" default="" hint="Remarks"/>
		<!--- call a component sitting in memory (application scope) --->
		<cfset var result = application.listingManager.create(argumentCollection=arguments) />
		<cfif result.status>
			<!--- return the new complete item --->
			<cfset result["item"] = application.listingManager.fetch(result.mls_id) />
		</cfif>
		<!--- force boolean --->
		<cfset result["status"] = javacast("boolean",result["status"]) />
		<cfreturn result />
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="update" access="remote" returntype="struct" output="false" description="Updates a listing">
	<cfargument name="mls_id" required="true" type="string" hint="Primary key"/>
	<cfargument name="address" required="true" type="string" hint="Address"/>
	<cfargument name="city" required="true" type="string" hint="City"/>
	<cfargument name="state" required="true" type="string" hint="State"/>
	<cfargument name="zipcode" required="false" type="string" default="" hint="Zip code"/>
	<cfargument name="status" required="false" type="string" default="" hint="Status"/>
	<cfargument name="price" required="true" type="numeric" hint="Price"/>
	<cfargument name="bedrooms" required="false" type="numeric" default="0" hint="Bedrooms"/>
	<cfargument name="bathrooms" required="false" type="numeric" default="0" hint="Bathrooms"/>
	<cfargument name="stories" required="false" type="string" default="" hint="Stories"/>
	<cfargument name="footage" required="false" type="numeric" default="0" hint="Footage"/>
	<cfargument name="yearBuilt" required="false" type="numeric" default="0" hint="Year Built"/>
	<cfargument name="type" required="false" type="string" default="" hint="Type"/>
	<cfargument name="listedOn" required="false" hint="Date listed"/>
	<cfargument name="hasPool" required="false" type="boolean" default="true" hint="Pool"/>
	<cfargument name="hasLaundry" required="false" type="boolean" default="true" hint="Laundry"/>
	<cfargument name="hasFireplace" required="false" type="boolean" default="true" hint="Fireplace"/>
	<cfargument name="hasWalkInClosets" required="false" type="boolean" default="true" hint="Walk-in-closets"/>
	<cfargument name="remarks" required="false" type="string" default="" hint="Remarks"/>
		<!--- call a component sitting in memory (application scope) --->
		<cfset var result = application.listingManager.update(argumentCollection=arguments) />
		<cfif result.status>
			<!--- return the complete updated item --->
			<cfset result["item"] = application.listingManager.fetch(result.mls_id) />
		</cfif>	
		<cfset result["status"] = javacast("boolean",result["status"]) />
		<cfreturn result />
</cffunction>	

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="remove" access="remote" returntype="struct" output="false" description="Removes a listing">
	<cfargument name="mls_id" required="true" type="string" hint="Primary key"/>

		<cfset var result = application.listingManager.delete(arguments.mls_id) />
		<!--- item will only contain the id --->
		<cfset result["item"] = structnew()/>
		<cfset result["item"]["mls_id"] = arguments.mls_id/>
		
		<cfset result["status"] = javacast("boolean",result["status"]) />
		<cfreturn result />
		
</cffunction>

</cfcomponent>
