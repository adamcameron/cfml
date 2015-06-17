<cfsavecontent variable="sDdx">
<?xml version="1.0" encoding="UTF-8"?>
<DDX xmlns="http://ns.adobe.com/DDX/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ns.adobe.com/DDX/1.0/ coldfusion_ddx.xsd">
	<DocumentText result="Out1">
		<PDF source="doc1"/>
	</DocumentText>
</DDX>
</cfsavecontent>
<cfset sDdx = trim(sDdx)>

<cfset stInput=StructNew()>
<cfset stInput.doc1="paristoberead.pdf">

<cfset stOutput=StructNew()>
<cfset stOutput.Out1="#expandPath('./')#output2.xml">

<cfpdf action="processddx" ddxfile="#sDdx#" inputfiles="#stInput#" outputfiles="#stOutput#" name="ddxVar">

<cfdump var="#ddxVar#">