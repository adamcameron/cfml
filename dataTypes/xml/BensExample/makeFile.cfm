<cfparam name="URL.nodes" default="1" type="integer">

<!--- Create a very large XML file. --->
<cfsavecontent variable="strXML">
	<cfoutput>
		<order>
			<!--- Order properties. --->
			<properties date="September 8, 2008" time="13:42" vendor="Kinky Solutions" />

			<!--- Properties in order. --->
			<products>
				<!--- Loop over a large number of "products" to	create a long XML file.	--->
				<cfloop index="intI" from="1" to="#URL.nodes#" step="1">
					<product>
						<sku>SKU#intI#</sku>
						<name>Product #intI#</name>
						<price>#RandRange( 1, 99 )#.99</price>
						<quantity>#RandRange( 1, 5 )#</quantity>
					</product>
				</cfloop>
			</products>
		</order>
	</cfoutput>
</cfsavecontent>

<!--- Write the XML data to the file. --->
<cffile action="write" file="#ExpandPath( './products.xml' )#" output="#strXML#">