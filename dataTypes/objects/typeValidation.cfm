<cfscript>
// typeValidation

samples = [
	{type="struct", example={}},
	{type="cfmlObject", example=new Sample()},
	{type="javaObject", example=createObject("java", "me.adamcameron.miscellany.Sample")},
	{type="javaException", example=createObject("java", "java.lang.Exception").init("Message")}
];
try {
	1/0;
}catch(any e){
	samples.append({type="cfmlException", example=e});
}

tests = ["isStruct", "isObject"];

samples.each(function(sample){
	writeOutput("<hr><h2>#sample.type#</h2>");
	tests.each(function(test){
		var result = (evaluate("#test#(sample.example)")) ? true : false;
		writeOutput("#test#(): #result#<br>");
	});
});

writeOutput(structKeyExists(samples[5].example, "type"));
writeOutput(samples[5].example.keyExists("type"));
</cfscript>