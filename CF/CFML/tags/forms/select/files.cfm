<cfparam name="form.thumbnailPic" default="">

<cfdirectory action="list" directory="#expandPath('./')#" name="qPics" filter="*.jpg">

<!---
<cfscript>
	qPics = queryNew("name");
	queryAddRow(qPics);	querySetCell(qPics, "name", "file1.jpg");
	queryAddRow(qPics);	querySetCell(qPics, "name", "file2.jpg");
	queryAddRow(qPics);	querySetCell(qPics, "name", "file3.jpg");
</cfscript>
--->
<!--- <cfquery name="qPics" dbtype="query">
	select	cast(name as varchar) as name_col
	from	qPics
</cfquery> --->
<cfdump var="#qPics#">

<cfform method="post" action="./files.cfm" format="flash" width="500" height="300" skin="haloorange">
	<cfselect name="colour">
		<cfloop index="sColour" list="Red,Orange,Yellow,Green,Blue,Indigo,Violet">
			<cfoutput><option>#sColour#</option></cfoutput>
		</cfloop>
	</cfselect>
	<cfselect name="thumbnailpic">
		<cfloop query="qPics">
			<cfoutput><option value="#name#">#name#</option></cfoutput>
		</cfloop>
	</cfselect>
	<!--- <cfselect name="thumbnailpic" query="qPics" value="name" display="name" /> --->
	<cfformitem type="text" bind="{colour.selectedData}" />
	<cfinput type="submit" name="submit" value="Send Details" />
</cfform>
<cfif structKeyExists(form, "fieldNames")>
<cfdump var="#form#">
</cfif>
