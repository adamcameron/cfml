<cfscript>
// matcher.cfm
param name="URL.input" default="";
pattern = createObject("java", "java.util.regex.Pattern").compile("^\d*$");
matcher = pattern.matcher(URL.input);
matches = matcher.matches();
try {
	start = matcher.start();
} catch (any e){
	start = "#e.message# #e.detail#";
}
writeDump(var=[{input=URL.input},{matches=matches},{start=start}]);	
</cfscript>