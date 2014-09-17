<cfprocessingdirective pageEncoding="utf-8">
<cfscript>
// testNumber.cfm

number = new Number();
number.setEnglish("toru");
number.setMaori("three");

number.setJapanese("三");


writeDump(var={
	english	= number.getEnglish(),
	maori	= number.getMaori()
}, label="From getters");
</cfscript>