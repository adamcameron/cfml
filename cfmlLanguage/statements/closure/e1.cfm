<cfscript>
	o = new E1();
	c = o.sayHello("Adam");
	c();
	
	countDownFromFour = o.countDownFrom(4);
	writeOutput(countDownFromFour());
	writeOutput(countDownFromFour());
</cfscript>