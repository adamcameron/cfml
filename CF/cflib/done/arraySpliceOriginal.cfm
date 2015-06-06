<cfscript>
function ArraySplice(array,from,to){
	try{
		if(ArrayLen(arguments)==3){
			var append = "";
		}else{
			var append = arguments[4];
		}
		
		var newArray = array;
		
		for(var i=from;i<to;i++){
			ArrayDeleteAt(newArray,from);
		}
		for(var i=1;i<=ListLen(append);i++){
			ArrayAppend(newArray,ListGetAt(append,i));
		}
		
		return newArray;
	}
	catch(Any e){
		return e;
	}
	
}


foo = ["A","B","C","D"];

bar1 = ArraySplice(foo,2,4,"A,B,C");
bar2 = ArraySplice(foo,1,4);
</cfscript>

<!--- DEBUG --->
<cfdump var="#bar1#" label="Debug">
<cfdump var="#bar2#" label="Debug">
<cfabort>
