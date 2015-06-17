<cfprocessingdirective pageencoding="utf-8">
<cfxml variable="x">
	<root id="1">
		<node id="2" russian="Россия" english="Russia" />
	</root>
</cfxml>
<cfset aX = xmlSearch(x, "/root/node[@id='2']/@english/text()")><!--- change this to 'english' and it works --->
<cfdump var="#aX#" label="aX">

