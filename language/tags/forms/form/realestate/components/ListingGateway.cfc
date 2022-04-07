<cfcomponent name="listing" access="public" hint="Gateway for listing">

 <!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="init" output="false" returntype="any" hint="instantiates an object of this class" access="public">
	<cfargument name="dns" required="true" type="any">
	
		<cfset variables.dsn = arguments.dns />
		<cfreturn this />
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="search" output="false" hint="Search for listing matching the criteria" access="public" returntype="query">
	<cfargument name="mls_id" required="false" type="string" default="" hint="Primary key"/>
	<cfargument name="status" required="false" type="string" default="" hint="Status"/>
	<cfargument name="priceFrom" required="false" type="numeric" default="0" hint="Minimum Price"/>
	<cfargument name="priceTo" required="false" type="numeric" default="0" hint="Maximum Price"/>
	<cfargument name="bedrooms" required="false" type="numeric" default="0" hint="Number of bedrooms"/>
	<cfargument name="bathrooms" required="false" type="numeric" default="0" hint="Number of bathrooms"/>
	<cfargument name="footage" required="false" type="numeric" default="0" hint="Minimum footage"/>
	<cfargument name="hasPool" required="false" type="boolean" default="false" hint="Pool wanted"/>
	<cfargument name="hasLaundry" required="false" type="boolean" default="false" hint="Laundry wanted"/>
	<cfargument name="hasFireplace" required="false" type="boolean" default="false" hint="Fireplace wanted"/>
	<cfargument name="hasWalkInClosets" required="false" type="boolean" default="false"  hint="Walk-in-closets wanted"/>

	<cfset var listingQuery = "" />

	<cfquery name="listingQuery" datasource="#variables.dsn#">
		SELECT	listing.*
		FROM	listing
		WHERE	listing.price >= <cfqueryparam value="#arguments.priceFrom#" cfsqltype="CF_SQL_MONEY"/>

	<cfif arguments.priceTo GT 0>
		AND listing.price <= <cfqueryparam value="#arguments.priceTo#" cfsqltype="CF_SQL_MONEY"/>
	</cfif>
	<cfif len(arguments.status)>
		AND listing.status = <cfqueryparam value="#status#" cfsqltype="CF_SQL_VARCHAR"/> 
	</cfif>
	<!--- include these if they are true, otherwise ignore --->
	<cfif arguments.hasFireplace>
		AND listing.hasFireplace =  <cfqueryparam value="true" cfsqltype="CF_SQL_BIT">
	</cfif>
	<cfif arguments.hasLaundry>
		AND listing.hasLaundry =  <cfqueryparam value="true" cfsqltype="CF_SQL_BIT">
	</cfif>
	<cfif arguments.hasPool>
		AND listing.hasPool = <cfqueryparam value="true" cfsqltype="CF_SQL_BIT">
	</cfif>
	<cfif arguments.hasWalkInClosets>
		AND listing.hasWalkInClosets = <cfqueryparam value="true" cfsqltype="CF_SQL_BIT">
	</cfif>
	
	<cfif len(arguments.mls_id)>
		AND listing.mls_id = <cfqueryparam value="#mls_id#" cfsqltype="CF_SQL_VARCHAR"/> 
	</cfif>
	
	<cfif arguments.footage GT 0>
		AND listing.footage >= <cfqueryparam value="#arguments.footage#" cfsqltype="CF_SQL_INTEGER"/>
	</cfif>
	<cfif arguments.bedrooms GT 0>
		AND listing.bedrooms >= <cfqueryparam value="#arguments.bedrooms#" cfsqltype="CF_SQL_SMALLINT"/>
	</cfif>
	<cfif arguments.bathrooms GT 0>
		AND listing.bathrooms >= <cfqueryparam value="#arguments.bathrooms#" cfsqltype="CF_SQL_DECIMAL"/>
	</cfif>
		ORDER BY price, listedOn
	</cfquery>

	<cfreturn listingQuery />

   </cffunction>

</cfcomponent>