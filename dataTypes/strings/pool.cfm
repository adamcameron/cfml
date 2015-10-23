<cfscript>
memoryAddress = createObject("java", "me.adamcameron.miscellany.MemoryAddress");

vars = {	
	viaLiteral = "test string",
	viaExpression = listAppend("test", "string", " "),
	viaConstructor = createObject("java", "java.lang.String").init("test string"),
	withoutAnyLiteralButSameValue1 = timeFormat(now(), "HH:mm:ss"),
	withoutAnyLiteralButSameValue2 = timeFormat(now(), "HH:mm:ss")
};
vars.viaTwoSteps = "test";
vars.viaTwoSteps &= " string";

addresses = {
	viaLiteral = memoryAddress.getAddress(vars.viaLiteral),
	viaExpression = memoryAddress.getAddress(vars.viaExpression),
	viaTwoSteps = memoryAddress.getAddress(vars.viaTwoSteps),
	viaConstructor = memoryAddress.getAddress(vars.viaConstructor),
	withoutAnyLiteralButSameValue1 = memoryAddress.getAddress(vars.withoutAnyLiteralButSameValue1),
	withoutAnyLiteralButSameValue2 = memoryAddress.getAddress(vars.withoutAnyLiteralButSameValue2),
	withoutAnyLiteralButSameValue1AsArg = checkWhenArg(vars.withoutAnyLiteralButSameValue1)
};

function checkWhenArg(s){
	return memoryAddress.getAddress(s);	
}

writeDump({vars=vars, addresses=addresses});
</cfscript>