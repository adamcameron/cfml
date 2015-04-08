<cfscript>
// closure.cfm

someVar = "In calling code"

function getVariableByNameUsingStatement(name){
	return variables[name]
}

getVariableByNameUsingLiteral = function(name){
	return variables[name]
}


getVariableByNameUsingLambda = (name)->variables[name]


o = new C()

o.getVariableByName = getVariableByNameUsingStatement
echo("Using statement: #o.getVariableByName('someVar')#<br>")

o.getVariableByName = getVariableByNameUsingLiteral
echo("Using statement: #o.getVariableByName('someVar')#<br>")

o.getVariableByName = getVariableByNameUsingLambda
echo("Using statement: #o.getVariableByName('someVar')#<br>")
</cfscript>