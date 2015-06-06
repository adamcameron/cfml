<cfxml variable="x">
<behaviours>
	<behaviour name="default">
		<mimetypes>*</mimetypes>
		<component>{sitename}.app_templates.behaviours.general</component>
		<method>default</method>
	</behaviour>
	<behaviour name="imagePopup">
		<mimetypes>gif,jpg,jpeg,tif,tiff</mimetypes>
		<component>{sitename}.app_templates.behaviours.general</component>
		<method>imagePopup</method>
	</behaviour>
	<behaviour name="imageWithAbsoluteSrc">
		<mimetypes>gif,jpg,jpeg,tif,tiff</mimetypes>
		<component>{sitename}.app_templates.behaviours.general</component>
		<method>imageWithAbsoluteSrc</method>
	</behaviour>
	<behaviour name="linkwithdescription">
		<mimetypes>*</mimetypes>
		<component>{sitename}.app_templates.behaviours.general</component>
		<method>linkwithdescription</method>
	</behaviour>
	<behaviour name="documentWithAbsoluteLink">
		<mimetypes>exe,mdb,pdf,doc,ppt,xls,rft,txt,zip</mimetypes>
		<component>{sitename}.app_templates.behaviours.general</component>
		<method>documentWithAbsoluteLink</method>
	</behaviour>
</behaviours>
</cfxml>
<cfset s = "default">
<cfset a = xmlSearch(x, "//behaviours/behaviour[@name='#s#']")>
<cfdump var="#a#">
<cfset p = a[1].component.xmlText>
<cfdump var="#p#">