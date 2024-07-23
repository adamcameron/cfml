<!--- view.cfm --->

<cfimport taglib="/shared/CF/other/customTags/looping" prefix="ui">

<cfoutput>
<ui:table data="#q#" headers="true" columnnames="id,english,maori" border="2" cellpadding="2" cellspacing="2">
	<tr><td>#id#</td><td>#english#</td><td>#maori#</td></tr>
</ui:table>
<hr />

<ui:table data="#a#" headers="false" columnnames="id,english,maori" border="2" cellpadding="2" cellspacing="2">
	<tr><td>#id#</td><td>#maori#</td><td>#english#</td></tr>
</ui:table>
<hr />

<ui:table data="#x#" headers="false" columnnames="maori,english,id" border="2" cellpadding="2" cellspacing="2">
	<tr><td>#maori#</td><td>#english#</td><td>#id#</td></tr>
</ui:table>
<hr />
</cfoutput>