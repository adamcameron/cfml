<cfsavecontent variable="myddx">
	<?xml version="1.0" encoding="UTF-8"?>
	<DDX xmlns="http://ns.adobe.com/DDX/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ns.adobe.com/DDX/1.0/ coldfusion_ddx.xsd">
		<PDF result="Out1">
			<PDF source="Title"/>
			<TableOfContents/>
			<PDF source="Doc1"/>
			<PDF source="Doc2"/>
		</PDF>
	</DDX>
</cfsavecontent>
<cfset myddx = trim(myddx)>

<cfif isDDX(myddx)>
yes, its ddx
<cfelse>
no its not
</cfif>