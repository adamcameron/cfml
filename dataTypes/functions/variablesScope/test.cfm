<cfscript>
o = new C();

f = o.getClosure();

o.callClosure(f);
o.callClosureViaClosure(f);
	
</cfscript>