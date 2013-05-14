<cfscript>
	c = new Child();
	tester(c);
	
	public void function tester(IParent p){
		p.parentFunction();
	}
</cfscript>