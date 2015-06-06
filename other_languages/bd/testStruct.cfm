<cffunction name="struct" access="private" returntype="struct" output="no" hint="Simply returns the arguments collection.  Used to create a struct in one go!">
	<cfreturn arguments>
</cffunction>

	<!--- validation model fields and rules for a search item --->
	<cffunction name="getFields" access="public" returntype="struct" output="false" hint="Sets the model rules for validation">
		<cfscript>
			// get default audit fields from the base manager
			var fields = structNew();
			// specify all the other fields
			fields.id         = struct(type="numeric", required="true");
			fields.languageID = struct(type="numeric", required="true");
			fields.userID     = struct(type="numeric", required="true");
			fields.isAuthd    = struct(type="boolean", required="true", default=false);
		</cfscript>
		<cfreturn fields>
	</cffunction>
	
<cfset st = getFields()>
<cfdump var="#variables#">