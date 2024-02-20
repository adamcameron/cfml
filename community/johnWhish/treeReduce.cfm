<cfscript>
	data = [
		{ org: "A0", path: [0,0,0] },
		{ org: "A0->B1", path: [0,1,0] },
		{ org: "A0->B1->C1", path: [0,1,1] },
		{ org: "A0->B1->C2", path: [0,1,2] },
		{ org: "A1", path: [1,0,0] },
		{ org: "A1->D1", path: [1,1,0] },
		{ org: "A1->D1->E1", path: [1,1,1] },
		{ org: "A1->D1->E2", path: [1,1,2] },
		{ org: "A1->D2", path: [1,2,0] },
		{ org: "A1->D2->F1", path: [1,2,1] },
		{ org: "A1->D2->F2", path: [1,2,2] }
	];

	current = {org="x", children=[]}
	actual = data.reduce((tree, element) => {
		element.children = element?.children ?: []

		if (element.org.reFind("^#current.org#")) {
			writeOutput("sub org<br>")
			current.children.append(element)
		}else{
			writeOutput("not sub org<br>")
			tree.append(element)
		}
		current = element
writeOutput("<hr>")
		return tree
	}, [])


	writeDump(actual)
	abort;



	// need the 'children' to be grouped by the next item in the path
	expect = [
		{ org: "A0", path: [0,0,0], children: [
			{ org: "A0->B1", path: [0,1,0], children: [
				{ org: "A0->B1->C1", path: [0,1,1], children: [] },
				{ org: "A0->B1->C2", path: [0,1,2], children: [] }
			] }
		] },
		{ org: "A1", path: [1,0,0], children: [
			{ org: "A1->D1", path: [1,1,0], children: [
				{ org: "A1->D1->E1", path: [1,1,1], children: [] },
				{ org: "A1->D1->E2", path: [1,1,2], children: [] }
			] },
			{ org: "A1->D2", path: [1,2,0], children: [
				{ org: "A1->D2->F1", path: [1,2,1], children: [] },
				{ org: "A1->D2->F2", path: [1,2,2], children: [] }
			] }
		] }
	];
	writeDump(var=expect, label="expected");


	n = 1;
	actual = data.reduce((acc, curr) => {
		var groupname = curr.path[n];
		var matchIndex = acc.find((it) => it.parent === groupname);
		if (matchIndex > 0) {
			acc[matchIndex].children.append(curr);
		} else {
			acc.append({
				parent: groupname,
				children: [curr]
			});
		}
		return acc;
	}, []);


	writeDump(var=actual, label="actual");
	</cfscript>
