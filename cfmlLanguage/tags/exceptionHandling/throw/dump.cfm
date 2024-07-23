<cffunction name="test" returntype="void" output="false">
	<cfargument name="obt_uuid"		type="string"	required="true">
	<cfargument name="detail" 		type="boolean" 	required="false"	default="false">
	<cfargument name="getSelf" 		type="boolean" 	required="false"	default="false">
	<cfargument name="typeFilter" 	type="string" 	required="false"	default="ALL">
	<cfargument name="sortSpec" 	type="string" 	required="false"	default="NONE">

	<cftry>
		<cfthrow	type		= "intranet.api.tree.view.Tree"
					errorcode	= "getAncestors.failedProcedure"
					message		= "An error occurred retrieving ancestor information"
					detail		= "This is generally caused by the pkg_shado.proc_getAncestors procedure not finding the record specified by obt_uuid"
					extendedinfo= "Trapped exception:"
		>
		<cfcatch>
			<cflog file="treeError" type="error" text='"#cfcatch.type#","#cfcatch.errorcode#","#cfcatch.message#","#cfcatch.detail#","#cfcatch.extendedinfo#","#arguments.obt_uuid#","#arguments.detail#","#arguments.getSelf#","#arguments.typeFilter#","#arguments.sortSpec#"'>
			<cfrethrow>
		</cfcatch>
	</cftry>
</cffunction>

<cfset test(obt_uuid="12345678-9ABC-DEF0-1234-56789ABCDEF")>

<!---

<cftransaction>
<cfquery name="qThis" datasource="#request.siteContext.dsn#" maxrows="1">
	select	obt_left, obt_right
	from	TBL_OBJ_TREE
	where	obt_uuid= <cfqueryparam value="#arguments.obt_uuid#" cfsqltype="CF_SQL_VARCHAR">
	where	rownum	= 1
</cfquery>

<cfquery name="qAncestors" datasource="#request.siteContext.dsn#" result="stAncestors">
	SELECT		*
	from
	<cfif arguments.detail>
			VW_OBJTREE
	<cfelse>
			TBL_OBJTREE
	</cfif>
	where		obt_left	<cfif arguments.getSelf> <= </cfelse> < </cfif> #qThis.obt_left[1]#
	and		obt_right	<cfif arguments.getSelf> >= </cfelse> > </cfif> #qThis.obt_right[1]#
	<cfif arguments.typeFilter neq "ALL">
	and		obt_type	in (<cfqueryparam value="#arguments.typeFilter#" cfsqltype="CF_SQL_VARCHAR" list="true">)
	</cfif>
	order by
	<cfswitch expression="#arguments.sortSpec#">
		<cfcase value="NONE">
			obt_left
		</cfcase>
		<cfcase value="SECTION">
			decode(obt_type, 'SECTION',1, 'PAGE',2, 'FILE',3, 'LINK',4), obt_left
		</cfcase>
		<cfcase value="PAGE">
			decode(obt_type, 'PAGE',1, 'SECTION',2, 'FILE',3, 'LINK',4), obt_left
		</cfcase>
		<cfcase value="FILE">
			decode(obt_type, 'FILE',1, 'SECTION',2, 'PAGE',3, 'LINK',4), obt_left
		</cfcase>
		<cfcase value="LINK">
			decode(obt_type, 'LINK',1,'SECTION',2, 'PAGE',3,'FILE',4), obt_left
		</cfcase>
	</cfswitch>
</cfquery>
</cftransaction>

 --->