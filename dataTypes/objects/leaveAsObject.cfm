<cfscript>
o = new C();

safeRun(function(){
	o.callsAnotherPublicFunction();
});
safeRun(function(){
	o.anotherPublicFunction();	
});
safeRun(function(){
	o.callsSomePrivateFunction();	
});
safeRun(function(){
	o.somePrivateFunction();	
});
safeRun(function(){
	o.showVariables();	
});

function safeRun(task){
	try {
		task();
	}catch(any e){
		writeOutput("#e.message#<br>");
	}finally{
		writeOutput("<hr>");	
	}
}
</cfscript>