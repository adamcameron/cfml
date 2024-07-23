<cfscript>
testOfArray = new TestOfArray();
testOfArray.test();

testOfArray.setMyArrayProperty(["this is a simple value"]);
writeDump(testOfArray.getMyArrayProperty())
</cfscript>