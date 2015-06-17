<cfscript>
// demo.cfm

test("Baseline");

test("Original updated", function(){
	original.colours.black = "*****mangu*****";
});

test("Original added to @ top level", function(){
	original.numbers.three = "*****toru*****";
});

test("Original added to @ inner level", function(){
	original.colours.green = "*****kakariki*****";
});


function test(label,process){
	writeOutput("<h3>#label#<h3>");
	makeStructure();	
	isDefined("process") ? process() : false;
	writeDump(var={original=original,ref=ref,copy=copy,dupe=dupe});
	writeOutput("<hr>");
}

function makeStructure(){
	original = {
		colours = {
			black = "pangu"
		}
	};

	ref = original;
	copy = structCopy(original);
	dupe = duplicate(original);
}
</cfscript>