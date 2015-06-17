<cfcomponent>


	<cffunction name="queryIt" returntype="struct">
		<cfset var returnStruct = structNew()>
		
		<cfquery name="returnStruct.value" datasource="tq_com">
			select	*
			from	dms_file
		</cfquery>
		<cfset returnStruct.status =true>
		<cfset returnStruct = filterIt(returnStruct)>
		<cfreturn returnStruct>
	</cffunction>


	<cffunction name="filterIt" returntype="struct">
		<cfargument name="query" required="yes" type="struct">
		
		<cfset var returnStruct = structNew()>
		<cfset var tempQry = arguments.query.value>
		
		<cfquery name="returnStruct.value" dbtype="query">
			select	dfi_uuid, dfi_filename, dfi_creationdate
			from	tempQry
		</cfquery>
		<cfset returnStruct.status =true>
		<cfset returnStruct = wddxIt(returnStruct)>
		<cfreturn returnStruct>
	</cffunction>


	<cffunction name="wddxIt" returntype="struct">
		<cfargument name="struct" required="yes" type="struct">
		
		<cfset var returnStruct = structNew()>
		
		<cfwddx action="cfml2wddx" input="#arguments.struct#" output="returnStruct.value" usetimezoneinfo="yes">
		<cfset returnStruct.status =true>
		<cfset returnStruct = storeIt(returnStruct)>
		<cfreturn returnStruct>
	</cffunction>


	<cffunction name="storeIt" returntype="struct">
		<cfargument name="wddx" required="yes" type="struct">
		<cffile action="write" addnewline="yes" file="C:\Inetpub\www root\adam_junk\tests\wddxprobs\result#timeFormat(now(), 'HHMMSS')#.xml" output="#arguments.wddx.value#">
		<cfwddx action="cfml2wddx" input="#arguments.wddx#" output="returnStruct.value" usetimezoneinfo="yes">
		<cfreturn cffile>
	</cffunction>


</cfcomponent>