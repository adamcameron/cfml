<cfscript>
o = new C();
st = {};

st.append(o);

safeRun(function(){
	st.callsAnotherPublicFunction();
});
safeRun(function(){
	st.anotherPublicFunction();	
});
safeRun(function(){
	st.callsSomePrivateFunction();	
});
safeRun(function(){
	st.somePrivateFunction();	
});
safeRun(function(){
	st.showVariables();	
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