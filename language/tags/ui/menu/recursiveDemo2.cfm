<cfset sMenuFile	= "inc_menus.cfm">
<cfset sMenuFilePath= expandPath("./") & sMenuFile>
<cfif not fileExists(sMenuFilePath)>
	<cfscript>
		// these are the first few menu options from ColdFusion Builder
		qMenuData = queryNew("ID,parentId,label","Integer,Integer,VarChar");
		queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 1); querySetCell(qMenuData, "parentId", 0); querySetCell(qMenuData, "label", "File");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 2); querySetCell(qMenuData, "parentId", 1); querySetCell(qMenuData, "label", "New");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 3); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "ColdFusion Project");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 4); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "Project...");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 5); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "ColdFusion Page");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 6); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "ColdFusion Component");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 7); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "ColdFusion Interface");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 8); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "File");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 9); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "Folder");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 10); querySetCell(qMenuData, "parentId", 2); querySetCell(qMenuData, "label", "Other...");

			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 11); querySetCell(qMenuData, "parentId", 1); querySetCell(qMenuData, "label", "Open File");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 12); querySetCell(qMenuData, "parentId", 1); querySetCell(qMenuData, "label", "Close");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 13); querySetCell(qMenuData, "parentId", 1); querySetCell(qMenuData, "label", "Close All");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 14); querySetCell(qMenuData, "parentId", 1); querySetCell(qMenuData, "label", "Save");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 15); querySetCell(qMenuData, "parentId", 1); querySetCell(qMenuData, "label", "Save As...");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 16); querySetCell(qMenuData, "parentId", 1); querySetCell(qMenuData, "label", "Save All");

		queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 17); querySetCell(qMenuData, "parentId", 0); querySetCell(qMenuData, "label", "Edit");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 18); querySetCell(qMenuData, "parentId", 17); querySetCell(qMenuData, "label", "Undo");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 19); querySetCell(qMenuData, "parentId", 17); querySetCell(qMenuData, "label", "Redo");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 20); querySetCell(qMenuData, "parentId", 17); querySetCell(qMenuData, "label", "Cut");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 21); querySetCell(qMenuData, "parentId", 17); querySetCell(qMenuData, "label", "Copy");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 22); querySetCell(qMenuData, "parentId", 17); querySetCell(qMenuData, "label", "Paste");

		queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 23); querySetCell(qMenuData, "parentId", 0); querySetCell(qMenuData, "label", "Navigate");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 24); querySetCell(qMenuData, "parentId", 23); querySetCell(qMenuData, "label", "Go Into");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 25); querySetCell(qMenuData, "parentId", 23); querySetCell(qMenuData, "label", "Go To");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 26); querySetCell(qMenuData, "parentId", 25); querySetCell(qMenuData, "label", "Back");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 27); querySetCell(qMenuData, "parentId", 25); querySetCell(qMenuData, "label", "Forward");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 28); querySetCell(qMenuData, "parentId", 25); querySetCell(qMenuData, "label", "Up One Level");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 29); querySetCell(qMenuData, "parentId", 25); querySetCell(qMenuData, "label", "Resource");

		queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 30); querySetCell(qMenuData, "parentId", 0); querySetCell(qMenuData, "label", "Search");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 31); querySetCell(qMenuData, "parentId", 30); querySetCell(qMenuData, "label", "Search...");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 32); querySetCell(qMenuData, "parentId", 30); querySetCell(qMenuData, "label", "File");
			queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 33); querySetCell(qMenuData, "parentId", 30); querySetCell(qMenuData, "label", "text");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 34); querySetCell(qMenuData, "parentId", 33); querySetCell(qMenuData, "label", "Workspace");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 35); querySetCell(qMenuData, "parentId", 33); querySetCell(qMenuData, "label", "Project");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 36); querySetCell(qMenuData, "parentId", 33); querySetCell(qMenuData, "label", "File");
				queryAddRow(qMenuData); querySetCell(qMenuData, "ID", 37); querySetCell(qMenuData, "parentId", 33); querySetCell(qMenuData, "label", "Working Set");
	</cfscript>
	<cfsavecontent variable="sMenus">
		<cfset sCfO = "<" & "cf">
		<cfset sCfC = "</" & "cf">
		<cfoutput>
			#sCfO#menu	type="horizontal">
				<cfquery name="qMenus" dbType="query">
					select		id, parentId, label
					from		qMenuData
					where		parentId	= 0
					order by	id
				</cfquery>
				<cfloop query="qMenus">
					#sCfO#menuitem display="#label#" href="#CGI.script_name#?id=#id#" name="sub_#parentId#_#id#">
						#getSubmenus(menuData=qMenuData, parentId=id)#
					#sCfC#menuitem>
				</cfloop>
			#sCfC#menu>
		</cfoutput>
	</cfsavecontent>
	<cffile action="write" file="#sMenuFilePath#" output="#sMenus#">
</cfif>
<cfinclude template="./#sMenuFile#">

<cffunction name="getSubmenus" returntype="string">
	<cfargument name="menuData" type="query" required="true">
	<cfargument name="parentId" type="numeric" required="true">

	<cfset var qSubs = false>
	<cfset var sCfO = "<" & "cf">
	<cfset var sCfC = "</" & "cf">
	<cfset var sMenus = "">

	<cfquery name="qSubs" dbtype="query">
		select		id, parentId, label
		from		menuData
		where		parentId	= <cfqueryparam value="#arguments.parentId#" cfsqltype="cf_sql_integer">
		order by	id
	</cfquery>
	<cfsavecontent variable="sMenus">
		<cfoutput>
			<cfloop query="qSubs">
				#sCfO#menuitem display="#label#" href="#CGI.script_name#?id=#id#" name="sub_#parentId#_#id#">
					#getSubmenus(menuData=menuData, parentId=id)#
				#sCfC#menuitem>
			</cfloop>
		</cfoutput>
	</cfsavecontent>
	<cfreturn sMenus>
</cffunction>
