<cfscript>
// myVersionRecursive.cfm

tree = [
	{id=1, left=1, right=28},
		{id=2, left=2, right=17},
			{id=3, left=3, right=10},
				{id=4, left=4, right=5},
				{id=5, left=6, right=7},
				{id=6, left=8, right=9},
			{id=7, left=11, right=16},
				{id=8, left=12, right=13},
				{id=9, left=14, right=15},
		{id=10, left=18, right=27},
			{id=11, left=19, right=22},
				{id=12, left=20, right=21},
			{id=13, left=23, right=26},
				{id=14, left=24, right=25}
];


function convertNestedSetToAdjacencyList(tree, node=tree[1],parent={}){
	var nextChildLeft = node.left + 1;
	var result = {
		id = node.id,
		parent = parent
	};
	result.children = tree.filter(function(node){
		if (node.left != nextChildLeft){
			return false;
		}
		nextChildLeft = node.right + 1;
		return true;
	}).map(function(child){
		return convertNestedSetToAdjacencyList(tree,child, result);
	});
	return result;
}

start = getTickCount();
adjacencyList = convertNestedSetToAdjacencyList(tree);
end = getTickCount();
writeOutput("Execution time: #end-start#ms<br>");

writeDump(adjacencyList);

writeOutput(
	adjacencyList // id:1
		.children[1] // id:2
		.children[1] // id:3
		.children[3] // id:6
		.parent.id // id:3
	);
</cfscript>
