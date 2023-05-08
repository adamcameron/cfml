<cfscript>
	public string function f(){
		var a = 10;
		var i = 0;
		
		for (i=1; i<=a; i++){
			var b = a * i;
		}
		
		var c = 0;
		
//		for (var j=1; j <= a; j++){
			c++;
//		}
	}

	f();
</cfscript>