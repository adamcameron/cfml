<cfscript>

number = new Number();
writeDump(var=number.get(), label="Initial state");
number.setEnglish("tahi");
number.setMaori("one");


writeDump(var={
	english	= number.getEnglish(),
	maori	= number.getMaori()
}, label="From getters");
</cfscript>