<!--- data.cfm --->
<cfscript>
	q = queryNew("");
	queryAddColumn(q, "id", [1,2,3,4]);
	queryAddColumn(q, "English", ["one","two","three","four"]);
	queryAddColumn(q, "Maori", ["tahi","rua","toru","wha"]);
	
	a = [
		[1,"one","tahi"],
		[2,"two","rua"],
		[3,"three","toru"],
		[4,"four","wha"]
	];
</cfscript>
<cfxml variable="x">
	<numbers>
		<number id="1" english="one" maori="tahi" />
		<number id="2" english="two" maori="rua" />
		<number id="3" english="three" maori="toru" />
		<number id="4" english="four" maori="wha" />
	</numbers>
</cfxml>

<cfinclude template="test.cfm">