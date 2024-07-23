<cfscript>
for (value in ["1,000","$1,000","$,1,2,$,2352345,$","0,6","1,2,3,4"]){
	writeOutput("<h4>Testing #value#</h4>");
	writeOutput("isValid(): #isValid("integer", "#value#")#<br>");

	writeOutput("Valid in param:");
	safe(function(){
		param integer local.foo=value;
	});

	writeOutput("Valid as numeric argument:");
	safe(function(){
		takesNumeric(value);
	});

	writeOutput("Valid as numeric return:");
	safe(function(){
		returnsNumeric(value);
	});

	writeOutput("Can be <em>used</em> as integer by CFML:");
	safe(function(){
		1 MOD value;
	});
	writeOutput("<br><hr>");
}

function takesNumeric(required numeric n){}
numeric function returnsNumeric(required any n){
	return arguments.n;
}


function safe(f){
	try {
		f();
		writeOutput(" OK");
	}
	catch (any e){
		writeOutput(" FAIL: #e.message#");
	}
	finally{
		writeOutput("<br>");
	}
}
</cfscript>