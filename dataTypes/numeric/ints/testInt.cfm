<cfscript>
f = -37.357142857143;

testInt = createObject("java", "TestInt");

i = testInt.toInt(f);

writeDump(variables);
</cfscript>