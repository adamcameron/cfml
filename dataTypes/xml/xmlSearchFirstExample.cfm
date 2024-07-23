<!--- xmlSearchFirstExample.cfm --->
<cfxml variable="x">
<root>
	<parent>
		parent1
		<child>child1</child>
		<child>
			child2
			<grandchild>grandchild1</grandchild>
		</child>
		<child>
			child3
			<grandchild>grandchild2</grandchild>
		</child>
	</parent>
	<parent>
		parent2
		<child>
			child4
			<grandchild>grandchild3</grandchild>
		</child>
		<child>
			child5
		</child>
		<child>
			child6
			<grandchild>grandchild4</grandchild>
		</child>
	</parent>
</root>
</cfxml>
<cfscript>
	secondParent = xmlSearch(x, "//parent[2]")[1];
	writeDump(secondParent);

	childrenOfSecondParent = xmlSearch(secondParent, "//child");
	writeDump(childrenOfSecondParent);
</cfscript>
