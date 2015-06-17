<cfscript>
writeOutput("<h2>Data types</h2>");
writeOutput("<h3>Function declared by statement</h3>");
function declaredViaStatement(){}
writeDump(var={object=declaredViaStatement, type=declaredViaStatement.getClass().getName()});

writeOutput("<h3>Function declared by expression</h3>");
declaredViaExpression=function(){};
writeDump(var={object=declaredViaExpression, type=declaredViaExpression.getClass().getName()});

writeOutput("<h3>Built-in function</h3>");
writeOutput("<h4>Via direct reference</h4>");
safe(function(){
	writeDump(var={object=mid, type=midref.getClass().getName()});
});

writeOutput("<h4>Via indirect reference</h4>");
safe(function(){
	var midRef = mid;
	writeDump(var={object=midref, type=midref.getClass().getName()});
});

writeOutput("<h4>Via indirect reference outside of closure</h4>");
midRef = mid;
safe(function(){
	writeDump(var={object=midref, type=midref.getClass().getName()});
});


writeOutput("<h2>return types</h2>");

function function regurgitateFunction(required function f){
	return f;
}

writeOutput("<h3>Function declared by statement</h3>");
safe(function(){
	resultWithDeclaredViaStatement = regurgitateFunction(declaredViaStatement);
	writeDump(var={object=resultWithDeclaredViaStatement, type=resultWithDeclaredViaStatement.getClass().getName()});
});

writeOutput("<h3>Function declared by expression</h3>");
safe(function(){
	resultWithDeclaredViaExpression = regurgitateFunction(declaredViaExpression);
	writeDump(var={object=resultWithDeclaredViaExpression, type=resultWithDeclaredViaExpression.getClass().getName()});
});


writeOutput("<h3>Built-in function</h3>");
midref = mid;
safe(function(){
	resultWithBuiltInFunction = regurgitateFunction(midref);
	writeDump(var={object=resultWithBuiltInFunction, type=resultWithBuiltInFunction.getClass().getName()});
});


function safe(f){
	try {
		f();
	}catch(any e){
		writeOutput("#e.type#: #e.message#; #e.detail#<br>");
	}
}
</cfscript>