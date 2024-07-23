<cfscript>
// javaArrayPortabilityLuceeOnly.cfm	

javaArrayFactory=javaNew("JavaArrayPortability","C:\apps\lucee\5\express\webapps\ROOT\WEB-INF\lucee\classes\JavaArrayPortability.class");
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
</cfscript>