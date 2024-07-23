<cfscript>
writeOutput("Initial state<br>");
impl = new Impl();
writeOutput('isInstanceOf(impl, "TestInterface"): ' & isInstanceOf(impl, "TestInterface") & "<br>");
writeOutput("<hr>");


writeOutput("After clearance<br>");
impl = new Impl();
structClear(impl);
writeOutput('isInstanceOf(impl, "TestInterface"): ' & isInstanceOf(impl, "TestInterface") & "<br>");
writeOutput("<hr>");


writeOutput("Restored to working order<br>");
impl = new Impl();

public numeric function length(required string s) {
	return len(s);
}
impl.length = length;

writeOutput('isInstanceOf(impl, "TestInterface"): ' & isInstanceOf(impl, "TestInterface") & "<br>");
writeOutput("<hr>");
</cfscript>