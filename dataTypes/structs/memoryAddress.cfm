<cfscript>
memoryAddress = createObject("java", "me.adamcameron.miscellany.MemoryAddress");
	
viaLiteral = {};
viaExpression = structNew();
viaAssignment = viaLiteral;

viaLiteralAddress = memoryAddress.getAddress(viaLiteral);
viaExpressionAddress = memoryAddress.getAddress(viaExpression);
viaAssignmentAddress = memoryAddress.getAddress(viaAssignment);

writeDump(variables);
</cfscript>