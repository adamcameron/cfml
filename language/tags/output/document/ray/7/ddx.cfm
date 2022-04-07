<cfdocument format="pdf" filename="title.pdf" overwrite="true" bookmark="true">
	<h1>Paris Hilton</h1>
</cfdocument>

<cfdocument format="pdf" filename="paris.pdf" overwrite="true" bookmark="true">
	<cfdocumentsection name="Paris Section">
		<h2>Paris Hilton</h2>
		<p>Here is the collected wisdom of Paris Hilton.</p>
	</cfdocumentsection>
</cfdocument>

<cfdocument format="pdf" filename="booger.pdf" overwrite="true" bookmark="true">
	<cfdocumentsection name="Booger Section">
		<h2>Booger</h2>
		<p>Booger.</p>
	</cfdocumentsection>
</cfdocument>


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

<cfset inputStruct=StructNew()>
<cfset inputStruct.Title="title.pdf">
<cfset inputStruct.Doc1="paris.pdf">
<cfset inputStruct.Doc2="booger.pdf">

<cfset outputStruct=StructNew()>
<!--- <cfset outputStruct.Out1="output1.pdf"> --->
<cfset outputStruct.Out1="#expandPath('./')#output1.pdf">


<cfpdf action="processddx" ddxfile="#myddx#" inputfiles="#inputStruct#" outputfiles="#outputStruct#" name="ddxVar">

<cfdump var="#ddxVar#">