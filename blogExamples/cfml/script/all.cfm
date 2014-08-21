<cfscript>
// all.cfm


// COMMENTS


// single line comment
a=1; // at end of line

/*
	multiple
	line
	comment
*/

/*
cannot
/* be */
nested
*/


// STATEMENTS

// statements end in semi-colons
a = 1; // generally optional on Railo


// VARIABLES

varName = "foo";
"#varName#"" = "bar;
writeOutput(foo); // bar


// OPERATORS

// decision
a == 1; // equality
a < 1; // less than
a <= 1; // less-than-or-equal
a >= 1; // greater-than-or-equal
a > 1; // greater than
a != 1; // inequality
a <> 1; // inequality (Railo only)

// arithemetic
// increment
a = 1;
b = a++; // b=1, a=2	// postfix operators returns value, then peforms action (in this case: increments a)
c = ++a; // c=3, a=3	// prefix operator peforms action then returns result

// decrement
a--; // a=2
--a; // a=1

// inline assignment
a += 2; // equivalent to a=a+5
a -= 3; // equivalent to a=a-3
a *= 4; // equivalent to a=a*2
a /= 5; // equivalent to a=a/2
a %= 6; // equivalent to a=a%2
s &= "a"; // equivalent to s = s & "a"

// boolean
!a; // NOT a
a && b; // a AND b
a || b;	// a OR b

// decision
result = condition ? trueExpression : falseExpression;

coinTossResult = randRange(0,1) ? "heads" : "tails";

// NB: only one of trueExpression or falseExpression is evaluated


a = 1;
b = 1;
c = false ? ++a: ++b; // a=1, b=2, c=2

// null coalescing
result = left ?: right; // left-hand expression is used unless it is null, in which case the right one is

a = d ?: "default"; // a = default

d = 1;
a = d ?: "default"; // a = 1


// CONDITIONS

if (booleanExpression)
	// single statement executed if booleanExpression is true
else if(anotherBooleanExpression)
	// single statement executed if anotherBooleanExpression is true
else
	// single statement executed if condition(s) are false


if (booleanExpression){
	// multiple statements executed if booleanExpression is true
} else if(anotherBooleanExpression) {
	// multiple statements executed if anotherBooleanExpression is true
} else {
	// multiple statements executed if condition(s) are false
}


switch (expression){
	case "some constant value": // value can be dynamic on Railo
	 	// statements executed if expression = "some constant value"
	break; // exit switch statement
	case "a different constant value":
		// statements executed if expression = "a different constant value"
		// if there is no break, then processing continues to evaluate next case
	case "third constant value":
		// statements executed if expression = "a different constant value" or "third constant value"
	break;
	case "4th value":
		 "5th value":
			// statements executed if expression is one of "4th value" or "5th value"
	break;
	default:
		// statements executed if no case was fulfilled (or if the last fulfilled case did not have a break)
	break;
}


try {
	// statements

	throw "message"; // throws an Application exception, with the given message
	// or
	throw(type="ExceptionType", message="message", detail="detail", errorCode="errorCode", extendedInfo="extendedInfo"); // despite appearances, this is NOT a function
	// or
	throw(object=JavaExceptionObject);

}
catch (SomeExceptionType variableCOntainingExceptionObject){
	// statements executed if code in try block errors with a SomeExceptionType exception

	rethrow; // rethrows the caught exception
}
catch (SomeOtherExceptionType variableCOntainingExceptionObject){
	// statements executed if code in try block errors with a SomeOtherExceptionType exception
}
catch (any variableCOntainingExceptionObject){
	// statements executed if code in try block errors with a SomeOtherExceptionType exception
}
finally {
	// statements executed in any case, INCLUDING unhandled exceptions. This code ALWAYS runs
}


// ITERATION

// general purpose for loop
for (statementToExecuteAtBeginning; booleanExpressionToEvaluateBeforeEachIteration; statementToExecuteAfterEAchIteration) statementToExecuteEachIteration;
// or
for (statementToExecuteAtBeginning; booleanExpressionToEvaluateBeforeEachIteration; statementToExecuteAfterEAchIteration){
	// statements to execute each iteration;
}
// looping continues while booleanExpressionToEvaluateBeforeEachIteration is true

//eg:
for (i=1; i <= 5; i++){
	writeOutput(i); // 12345
}

// Note that whilst normal usage is to count over an index as per the example, it's important to understand the general form of the loop.
// the loop above could be written:
i=0;
for(; true; writeOutput(i)){
	if (++i > 5) break;
}


// conditional loop
// while the condition is true, the loop will continue
while (condition) statement;

// or

while (condition) {
	// statements
}

do 
	statement;	
while(condition);

// or

do { 
	// statements
} while(condition);

// the difference between a WHILE and a DO loop is that the DO loop will always execute at least once, as the condition is evaluated at the bottom of the loop

// NB: all subsequent loops have the single-statement or block version


// array loop

for (element in [1,2,3,4,5]){
	writeOutput(element); // 12345
}

arrayEach(["a","b","c"], function(element,index,array){
	writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
});

a = ["a","b","c"];
a.each(function(element,index,array){
	writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
});



// struct loop
struct = {a=1,b=2,c=3};
for (key in struct){
	writeOutput("#key#:#struct[key]#;"); // a:1;b:2;c:3; (order of keys not guaranteed, obviously)
}

structEach(struct, function(key,value,struct){
	writeOutput("#key#:#value#;"); // a:1;b:2;c:3;
});

struct.each(function(key,value,struct){
	writeOutput("#key#:#value#;"); // a:1;b:2;c:3;
});

 // interrupting loops

for (i=1; i<=5; i++){
	if (i == 3){
		break;	// exits the loop
	}
	writeOutput(i); // 12
}

for (i=1; i<=5; i++){
	if (i <= 3){
		continue; // exits the current iteration
	}
	writeOutput(i); // 45
}


// query loop
q = queryNew("id,data", "integer,varchar",[
	[11, "aa"],
	[22, "bb"],
	[33, "cc"]
]);
for (row in q){
	writeOutput("#q.currentRow#:#row.id#:#row.data#;"); // 1:11:aa;2:22:bb;3:33:cc;
}

// grouped
q = queryNew("pk,fk,data", "integer,integer,varchar",[
	[1, 10, "aa"],
	[2, 20, "bb"],
	[3, 20, "cc"],
	[4, 30, "dd"],
	[5, 30, "ee"],
	[6, 30, "ff"]
]);
cfloop(query=q, group="fk"){
	writeOutput("<strong>#fk#</strong><br>");
	cfloop(){
		writeOutput("#pk#:#data#<br>");
	}
	writeOutput("<hr>");
}

// RAILO-only:
loop query=q group="fk" {
	writeOutput("<strong>#fk#</strong><br>");
	loop {
		writeOutput("#pk#:#data#<br>");
	}
	writeOutput("<hr>");
}


// list loop
list = "a;b;c";
listEach(list, function(element,index,list){
	writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
}, ";");
// or
list.each(function(element,index,list){
	writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
}, ";");

// RAILO-only
cfloop(list="a;b;c", index="element", delimiters=";"){
	writeOutput(element); // abc
}
// or
loop list="a;b;c" index="element" delimiters=";" {
	writeOutput(element); // abc
}


// file
filePath = getCurrentTemplatePath();
cfloop(file=filePath, index="chars", characters=16, charset="UTF-8"){
	writeOutput(chars); // outputs the contents of this file
}

// Railo-only
loop file=filePath index="chars" characters=16 charset="UTF-8" {
	writeOutput(chars);
}


// date/time range

// CF has no specific CFScript construct for this as of CF11
from	= now();
to		= dateAdd("d", 7, from);

for(date=from; dateCompare(date, to, "d") <= 0; date = dateAdd("d", 1, date)){
	writeOutput(dateTimeFormat(date, "yyyy-mm-dd HH:nn:sstt") & "<br>");
}

// RAILO-only
cfloop(from=from, to=to, index="date", step=createTimespan(1,0,0,0)){
	writeOutput(dateTimeFormat(date, "yyyy-mm-dd HH:nn:sstt") & "<br>");
}
// or
loop from=from to=to index="date" step=createTimespan(1,0,0,0){
	writeOutput(dateTimeFormat(date, "yyyy-mm-dd HH:nn:sstt") & "<br>");
}


// other flow control

// abort
abort;
// or
abort "error message";


// exit
exit;
//or
exit "method";


// include
include "pathToFile";
// or
include "pathToFile" runonce=true;


// location
location(url="urlToFile", addtoken=false);



// components

component {

}

// component attributes
component extends="Parent" {

}
// or

/**
@extends Parent
*/
component {
	
}

// note that the comment for annotations is /** not simply /*
// also note that the latter syntax does not currently work on Railo (see https://issues.jboss.org/browse/RAILO-3169)


// interfaces

interface {
	public void function f(required numeric x); // note no braces, and ends with semi-colon
}


// functions

function f(){ // assumes public function, returntype any

}

private void function f(){

}

// arguments
function f(x){ // optional argument of type "any"

}

function f(numeric x){ // optional argument of type "numeric"

}

function f(required numeric x){ // required argument of type "numeric"

}


// function/argument annotations
/**
* @access private
* @returntype void
* @hint hint for function f()
*/
function f(){

}

// or

function f() access="private" returntype="void" hint="hint for function f()" {

}


/**
* @x.hint hint for argument x
* @x.type numeric
* @x.required true
*/
function f(x){
	
}

// note these annotations do not current correctly work on Railo: https://issues.jboss.org/browse/RAILO-3170,https://issues.jboss.org/browse/RAILO-3169
// also note that this does not work on ColdFusion 11:

/**
* @x.type numeric
* @x.default 0 // this causes a compile error
*/
function f(x){
}

// function expressions
/**
* @hint hi
*/ 
f = function(x){
};

// functions defined by function expressions use closure, functions defined by a function statement do not

// annotations for function expressions are not supported on ColdFusion; are supported on Railo, but have same shortcomings as noted above
/**
* 
* @hint hint for f()
*/ 
f = function(x){
};


// import
import com.domain.app.package.*;




</cfscript>