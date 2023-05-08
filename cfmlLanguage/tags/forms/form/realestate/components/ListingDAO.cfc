<cfcomponent name="ListingDAO" access="public" hint="CRUD for property listing">
      
 <!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="init" output="false" returntype="any" hint="instantiates an object of this class" access="public">
	<cfargument name="dns" required="true" type="any">
	
		<cfset variables.dsn = arguments.dns />
		<cfreturn this />
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="fetch" output="false" hint="Returns a structure containing all the field of a property listing" access="public" returntype="struct">
	<cfargument name="mls_id" required="true" type="string" hint="Primary key"/>

	<cfset var getlistingQuery = ""/>
	<cfset var data = structnew() />
	
		<cfquery name="getlistingQuery"  datasource="#variables.dsn#">
		SELECT *
		FROM listing
		WHERE mls_id = <cfqueryparam value="#arguments.mls_id#" cfsqltype="CF_SQL_VARCHAR" maxlength="10"/>
		</cfquery>
	
	<!--- create a structure with all the columns --->
	<!--- we are doing it manually because looping over the columns would make it all upper-case --->
	<cfset data["mls_id"] = getlistingQuery.mls_id />
	<cfset data["address"] = getlistingQuery.address />
	<cfset data["city"] = getlistingQuery.city />
	<cfset data["state"] = getlistingQuery.state />
	<cfset data["zipcode"] = getlistingQuery.zipcode />
	<cfset data["status"] = getlistingQuery.status />
	<cfset data["price"] = getlistingQuery.price />
	<cfset data["bedrooms"] = getlistingQuery.bedrooms />
	<cfset data["bathrooms"] = getlistingQuery.bathrooms />
	<cfset data["stories"] = getlistingQuery.stories />
	<cfset data["footage"] = getlistingQuery.footage />
	<cfset data["yearBuilt"] = getlistingQuery.yearBuilt />
	<cfset data["type"] = getlistingQuery.type />
	<cfset data["listedOn"] = getlistingQuery.listedOn />
	<cfset data["hasPool"] = getlistingQuery.hasPool />
	<cfset data["hasLaundry"] = getlistingQuery.hasLaundry />
	<cfset data["hasFireplace"] = getlistingQuery.hasFireplace />
	<cfset data["hasWalkInClosets"] = getlistingQuery.hasWalkInClosets />
	<cfset data["remarks"] = getlistingQuery.remarks />

	<cfreturn data />
</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="create" output="false" hint="Inserts a new property listing" access="public" returntype="struct">
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

		<cfset var insertListingQuery = "" />
		<cfset var returnObj = structnew() />
		<cfset returnObj["status"] = false />
		<cfset returnObj["message"] = "" />

	<cftry>
		<cfquery name="insertListingQuery"  datasource="#variables.dsn#">
		INSERT INTO listing
		(mls_id, address, city, state, zipcode, status, price, bedrooms, bathrooms, stories, footage,
		 yearBuilt, type, listedOn, hasPool, hasLaundry, hasFireplace, hasWalkInClosets, remarks)
		VALUES (
		<cfqueryparam value="#arguments.mls_id#" cfsqltype="CF_SQL_VARCHAR" maxlength="10"/>,
		<cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR" maxlength="100"/>,
		<cfqueryparam value="#arguments.city#" cfsqltype="CF_SQL_VARCHAR" maxlength="50"/>,
		<cfqueryparam value="#arguments.state#" cfsqltype="CF_SQL_CHAR" maxlength="2"/>,
		<cfqueryparam value="#arguments.zipcode#" cfsqltype="CF_SQL_CHAR" maxlength="5"/>,
		<cfqueryparam value="#arguments.status#" cfsqltype="CF_SQL_VARCHAR" maxlength="10"/>,
		<cfqueryparam value="#arguments.price#" cfsqltype="CF_SQL_MONEY"/>,
		<cfqueryparam value="#arguments.bedrooms#" cfsqltype="CF_SQL_SMALLINT"/>,
		<cfqueryparam value="#arguments.bathrooms#" cfsqltype="CF_SQL_FLOAT"/>,
		<cfqueryparam value="#arguments.stories#" cfsqltype="CF_SQL_VARCHAR" maxlength="50"/>,
		<cfqueryparam value="#arguments.footage#" cfsqltype="CF_SQL_INTEGER"/>,
		<cfqueryparam value="#arguments.yearBuilt#" cfsqltype="CF_SQL_INTEGER"/>,
		<cfqueryparam value="#arguments.type#" cfsqltype="CF_SQL_VARCHAR" maxlength="50"/>,
		<cfqueryparam value="#arguments.listedOn#" cfsqltype="CF_SQL_DATE">,
		<cfqueryparam value="#arguments.hasPool#" cfsqltype="CF_SQL_BIT"/>,
		<cfqueryparam value="#arguments.hasLaundry#" cfsqltype="CF_SQL_BIT"/>,
		<cfqueryparam value="#arguments.hasFireplace#" cfsqltype="CF_SQL_BIT"/>,
		<cfqueryparam value="#arguments.hasWalkInClosets#" cfsqltype="CF_SQL_BIT"/>,
		<cfqueryparam value="#arguments.remarks#" cfsqltype="CF_SQL_VARCHAR" />)
		</cfquery>

		<cfset returnObj["status"] = true/>
		
		<!--- catch any error that the query may have thrown --->
		<cfcatch type="Any">
			<cfset returnObj["status"] = false/>
			<cfset returnObj["message"] = CFCATCH.message & ": " & CFCATCH.detail/>
		</cfcatch>
	</cftry>

	<cfif returnObj["status"]>
		<cfset returnObj["message"] = "Property has been inserted"/>
		<cfset returnObj["mls_id"] = arguments.mls_id>
	</cfif>

	<cfreturn returnObj/>
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="update" output="false" hint="Updates a property listing" access="public" returntype="struct">
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
	
		<cfset var updateListingQuery = "" />
		<cfset var returnObj = structnew() />
		<cfset returnObj["status"] = false />
		<cfset returnObj["message"] = "" />
		<cfset returnObj["mls_id"] = arguments.mls_id />

	<cftry>
		<cfquery name="updateListingQuery"  datasource="#variables.dsn#">
		UPDATE listing
		SET
		address = <cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR" maxlength="100"/>,
		city = <cfqueryparam value="#arguments.city#" cfsqltype="CF_SQL_VARCHAR" maxlength="50"/>,
		state = <cfqueryparam value="#arguments.state#" cfsqltype="CF_SQL_CHAR" maxlength="2"/>,
		zipcode = <cfqueryparam value="#arguments.zipcode#" cfsqltype="CF_SQL_CHAR" maxlength="5"/>,
		status = <cfqueryparam value="#arguments.status#" cfsqltype="CF_SQL_VARCHAR" maxlength="10"/>,
		price = <cfqueryparam value="#arguments.price#" cfsqltype="CF_SQL_MONEY"/>,
		bedrooms = <cfqueryparam value="#arguments.bedrooms#" cfsqltype="CF_SQL_SMALLINT"/>,
		bathrooms = <cfqueryparam value="#arguments.bathrooms#" cfsqltype="CF_SQL_FLOAT"/>,
		stories = <cfqueryparam value="#arguments.stories#" cfsqltype="CF_SQL_VARCHAR" maxlength="50"/>,
		footage = <cfqueryparam value="#arguments.footage#" cfsqltype="CF_SQL_INTEGER"/>,
		yearBuilt = <cfqueryparam value="#arguments.yearBuilt#" cfsqltype="CF_SQL_INTEGER"/>,
		type = <cfqueryparam value="#arguments.type#" cfsqltype="CF_SQL_VARCHAR" maxlength="50"/>,
		listedOn = <cfqueryparam value="#arguments.listedOn#" cfsqltype="CF_SQL_DATE"/>,
		hasPool = <cfqueryparam value="#arguments.hasPool#" cfsqltype="CF_SQL_BIT"/>,
		hasLaundry = <cfqueryparam value="#arguments.hasLaundry#" cfsqltype="CF_SQL_BIT"/>,
		hasFireplace = <cfqueryparam value="#arguments.hasFireplace#" cfsqltype="CF_SQL_BIT"/>,
		hasWalkInClosets = <cfqueryparam value="#arguments.hasWalkInClosets#" cfsqltype="CF_SQL_BIT"/>,
		remarks = <cfqueryparam value="#arguments.remarks#" cfsqltype="CF_SQL_VARCHAR">
		WHERE mls_id = <cfqueryparam value="#arguments.mls_id#" cfsqltype="CF_SQL_VARCHAR" maxlength="10"/>
		</cfquery>

		<cfset returnObj["status"] = true/>
		
		<!--- catch any error that the query may have thrown --->
		<cfcatch type="Any">
			<cfset returnObj["status"] = false/>
			<cfset returnObj["message"] = CFCATCH.message & ": " & CFCATCH.detail />
		</cfcatch>
	</cftry>

	<cfif returnObj["status"]>
		<cfset returnObj["message"] = "Property has been updated"/>
	</cfif>

	<cfreturn returnObj/>
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="delete" output="false" hint="Deletes a property listing" access="public" returntype="struct">
	<cfargument name="mls_id" required="true" type="string" hint="Primary key"/>
    
		<cfset var deleteListingQuery = "" />
		<cfset var returnObj = structnew() />
		<cfset returnObj["status"] = false />
		<cfset returnObj["message"] = "" />
		<cfset returnObj["mls_id"] = arguments.mls_id />

	<cftry>
		<cfquery name="deleteListingQuery"  datasource="#variables.dsn#">
            DELETE FROM listing
			WHERE mls_id = <cfqueryparam value="#arguments.mls_id#" cfsqltype="CF_SQL_VARCHAR" maxlength="10"/>
		</cfquery>
    
		<cfset returnObj["status"] = true/>
		
		<!--- catch any error that the query may have thrown --->
    	<cfcatch type="Any">
    		<cfset returnObj["status"] = false/>
     	   <cfset returnObj["message"] = CFCATCH.message & ": " & CFCATCH.detail />
		</cfcatch>
	</cftry>
    						
	<cfif returnObj["status"]>
    	<cfset returnObj["message"] = "Property has been deleted"/>
    </cfif>
    
	<cfreturn returnObj/>
</cffunction>

</cfcomponent>