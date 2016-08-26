<cfscript>
testOfNumeric = new TestOfNumeric();
testOfNumeric.test();

aSimpleValue = "this is definitely a simple value";
writeOutput("Is '#aSimpleValue#' as simple value? #isSimpleValue(aSimpleValue)#");
testOfNumeric.setMyNumericProperty(aSimpleValue);
</cfscript>