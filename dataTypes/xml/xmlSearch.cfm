<!--- xmlSearch.cfm --->
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
//	writeDump(var=x);
//	writeOutput("Class name for a ColdFusion XML object: <code>#x.getClass().getName()#</code><br><hr>");

	secondParent = xmlSearch(x, "//parent[2]")[1];
//	writeDump(secondParent);
//	writeOutput("Class name for a ColdFusion <code>xmlSearch()</code> result: <code>#secondParent.getClass().getName()#</code><br><hr>");

//	childrenViaAbsolutePath = xmlSearch(secondParent, "//child");
//	writeDump(childrenViaAbsolutePath);

//childrenViaRelativePath = xmlSearch(secondParent, "child");
//writeDump(var=childrenViaRelativePath);

grandChildrenUsingRelativeReference = xmlSearch(secondparent, ".//grandchild");
writeDump(var=grandChildrenUsingRelativeReference);
</cfscript>
