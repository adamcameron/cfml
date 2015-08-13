<cfscript>
category = {
	A = {left = 1, right = 9},
	B = {left = 2, right = 4},
	C = {left = 5, right = 8},
	D = {left = 6, right = 7},
	E = {left = 10, right = 11}
};



function createTree(category, left=0, right) {
	var tree = {};
	for (var cat in category){
		var range = category[cat];
		if (range.left == left + 1 && (!structKeyExists(arguments, "right") || range.right < right)) {
			tree[cat] = createTree(category, range.left, range.right);
			left = range.right;
		}
	}
	return tree;
}

tree = createTree(category);
writeDump(tree);

function flattenTree(tree, parentTree=[]) {
	var out = [];
	for (var key in tree){
		var children = tree[key];
		var newTree = parentTree;
		newTree.append(key);
		if (children.count()) {
			var childTrees = flattenTree(children, newTree);
			for (var childTree in childTrees){
				out.append(childTree);
			}
		} else {
			out.append(newTree);
		}
	}
	return out;
}

tree = flattenTree(tree);
writeDump(tree);
</cfscript>