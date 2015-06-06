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


a1 = ["Banana", "Orange", "Apple", "Mango"];

a2 = ArraySplice(a1, 3, 3, "Lemon,Kiwi");
</cfscript>

<!--- DEBUG --->
<cfdump var="#variables#">
<cfabort>
