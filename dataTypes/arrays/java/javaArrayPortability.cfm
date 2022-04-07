<cfscript>
// javaArrayPortability.cfm	

javaArrayFactory = createObject("java","JavaArrayPortability");
javaArray = javaArrayFactory.getNumbers();

cfmlArray = ["tahi", "rua", "toru", "wha"];

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

typeChecked = javaArrayFactory.acceptNumbers(cfmlArray);
writeDump(typeChecked);
</cfscript>