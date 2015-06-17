<cfscript>
// sortJavaArrayInline.cfm	

runSafe("Create arrays", function(){
	cfmlArray = ["tahi", "rua", "toru", "wha"];
	javaArray = cfmlArray.toList().split(",");

	writeDump({
		java = {
			array=javaArray,
			class=javaArray.getClass().getName()
		},
		cfml = {
			array=cfmlArray,
			class=cfmlArray.getClass().getName()
		}
	});
});

runSafe("Control: arraySort() directly on CFML array", function(){
	arraySort(cfmlArray, "text");
	writeDump(cfmlArray);
});

runSafe("Use arraySort() directly on Java array", function(){
	arraySort(javaArray, "text");
	writeDump(javaArray);
});

runSafe("Use arraySort() on ArrayList", function(){
	javaArrayList = createObject("java", "java.util.Arrays").asList(javaArray);
	arraySort(javaArrayList, "text");
	writeDump(javaArrayList);
});

runSafe("Check types", function(){
	writeDump({
		cfmlArray = cfmlArray.getClass().getName(),
		javaArray = javaArray.getClass().getName(),
		javaArraylist = javaArrayList.getClass().getName()
	});
});

function runSafe(message, task){
    writeOutput("<h3>#message#</h3>");
    try {
        task();
    } catch (any e){
        writeOutput("#e.type# #e.message# #e.detail#");
    } finally {
        writeOutput('<hr>');
    }
}
</cfscript>