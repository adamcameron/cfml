<cfxml variable="x">
	<aaa>
		<bbb>
			<ccc>ddd</ccc>
			<eee fff="ggg">hhh</eee>
		</bbb>
		<bbb id="iii">
			<jjj>kkk</jjj>
			<kkk lll="mmm">nnn</kkk>
		</bbb>
	</aaa>
</cfxml>
<cfscript>
	writeDump(var=x, label="initial");

	parentNode = xmlSearch(x, "//bbb[@id='iii']");

	writeDump(parentNode);

/*
	for (i=1; i <= arrayLen(parentNode[1].xmlChildren); i++){
		arrayDeleteAt(parentNode[1].xmlChildren, 1);
	}
*/

	structDelete(parentNode[1], "xmlChildren");

	writeDump(var=x, label="After Deletion");

</cfscript>