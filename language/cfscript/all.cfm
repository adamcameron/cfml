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

// setting
varName = "foo";
"#varName#"" = "bar;
writeOutput(foo); // bar

// defaulting
param numeric variableName=defaultValue; // where "numeric" could be any type

// more complex
param name="variableName" type="regex" pattern="."; // any cfparam attribute is supported


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
//eg:
coinTossResult = randRange(0,1) ? "heads" : "tails";

// NB: only one of trueExpression or falseExpression is evaluated:
a = 1;
b = 1;
c = false ? ++a : ++b; // a=1, b=2, c=2

// null coalescing
result = left ?: right; // left-hand expression is used unless it is null, in which case the right one is used

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
		// if there is no break, then processing continues to execute statements until a break is encountered...
		// ... but subsequent case evaluations are not made. A switch is basically a GOTO mechanism, which does a...
		// single GOTO the first matching case. It is NOT a series of if/elseif/else statements
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
catch (SomeExceptionType variableContainingExceptionObject){
	// statements executed if code in try block errors with a SomeExceptionType exception

	rethrow; // rethrows the caught exception
}
catch (SomeOtherExceptionType variableCOntainingExceptionObject){
	// statements executed if code in try block errors with a SomeOtherExceptionType exception
}
catch (any variableCOntainingExceptionObject){
	// statements executed if code in try block errors with any not-yet-caught exception type
}
finally {
	// statements executed in any case, INCLUDING unhandled exceptions. This code ALWAYS runs
}


// ITERATION

// general purpose for loop
for (initialisaton; condition; repetition) statement;
// or
for (initialisaton; condition; repetition){
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


// other collection iteration functions

// verify all elements meet the given criteria

// every() - RAILO only
// returns true if every element in the collection returns true when passed to the callback
// note: only processes enough of the collection to get a false
a = ["a", "b", "c"];
b = a.every(function(element, index, collection){
	return asc(element) <= asc("d"); // true because all of a,b,c come before d
});
a = [2,4,6,9];
b = a.every(function(element, index, collection){
	return element == index*2; // false because 9 != 4*2
});

// some() - RAILO only
// returns true as soon as a callback that's been passed an element returns true
a = ["a", "b", "c"];
b = a.some(function(element, index, collection){
	return asc(element) > asc("b"); // true because c is after b
});

a = [2,4,6,9];
b = a.some(function(element, index, collection){
	return element == index*3; // false because none of the values are 3x their index
});


// map()
// returns a new collection which is the result of applying the callback to each element of the collection having .map() called on it
original = {a=1,b=2,c=3};
mapped = original.map(function(element, key, collection){
	return "#key#:#element#";
}); // {A="1:A", B="2:B", C="3:C"}


// reduce()
// returns a single new value passed on cumulatively applying the callback to the previous result (or the initial value)
original = {a=1,b=2,c=3};
reduction = original.reduce(function(reduction, element, key, collection){
	return listAppend(reduction, "#key#:#element#");
}, ""); // "1:A,2:B,3:C"


// filter()
// returns elements of the collection that return true from the callback when passed to it
original = ["c","b","a"];
filtered = original.filter(function(element, index, collection){ // COLDFUSION only passes-in the element see https://bugbase.adobe.com/index.cfm?event=bug&id=3810965
	return index % 2;
}); // ["a","c"]

// sort()
// sorts the collection (inplace) according to the callback which should return -1,0,1 depending on whether e1 is <, = or > e2
a = ["c","b","a"];
a.sort(function(e1, e2){ // COLDFUSION only passes-in the element see
	return compareNoCase(e1,e2);
}); // ["a","b","c"]


// other flow control

// abort
abort;
// or
abort "error message";


// exit
exit;
//or
exit "method";



// location
location(url="urlToFile", addtoken=false);


// lock
lock type="exclusive" name="myLock" timeout=5 { // other CFLOCK attributes supported too
	// stuff to lock
}


// CODE REUSE


// include
include "pathToFile";
// or
include "pathToFile" runonce=true;


//module
// RAILO
module template="inc.cfm" attr1="val1" attr2="val2";

// COLDFUSION
cfmodule(template="inc.cfm", attr1="val1", attr2="val2");


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


//properties
// basic
property string myProperty;

// other options
property type="string" name="myProperty" default="default value"; // and all the same attributes as <cfproprty>


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


// object creation
myObj = createObject(type, "path.to.class"); // along with other type/situation-specific arguments
// or
myObj = new path.to.some.cfc.file(); // NB: will call the CFC's init() (by default), or method identified by the initmethod attribute of the component (bug in Railo: https://issues.jboss.org/browse/RAILO-2294) 


// FILE SYSTEM OPERATIONS

// directory operations
// simple directory creation
directoryCreate("path/to/directory");

// using other optional attributes
cfdirectory(action="create", directory="path/to/directory", mode="777");

// Railo only
directory action="create" directory="path/to/directory" mode="777";


// delete
directoryDelete("path/to/directory");


// list
listing = directoryList("path/to/directory", true, "query", "*.cfm", "size desc"); // CF11 added an additional "type" attribute. Not currently supported on Railo


// rename
directoryRename("path/to/directory", "path/to/new/directory");


// file operations

// read
// text
result = fileRead("path/to/file");
// or
fileHandle = fileOpen("path/to/file", "read");
result = fileRead(fileHandle, bytesToRead);
fileClose(fileHandle);

// binary
result = fileReadBinary("path/to/file");
//or
fileHandle = fileOpen("path/to/file", "readbinary");
result = fileRead(fileHandle, bytesToRead);

// append
fileHandle = fileOpen("path/to/file", "append");
fileWrite(fileHandle, textToAppend);
fileClose(fileHandle);

// copy
fileCopy("path/to/file", "path/to/copyOfFile");

// delete
fileDelete("path/to/file");

// move / rename
fileMove("path/to/file", "new/path/to/file");

// upload
fileUpload("path/to/upload/file/to");
fileUploadAll("path/to/upload/files/to");

// write
fileWrite("path/to/file", data);
// or
fileWrite(fileHandle, data);



// DEBUG
// dump
writeDump(myVar); // can use either ordered or named arguments.  


//log
writeLog("text to log"); // can use either ordered or named arguments.  


// trace
// RAILO only
trace category="test" text="trace text" { // plus all same params as <cftrace>
	// stuff to trace
}

// COLDFUSION only
trace(category="test", text="trace text"){ // plus all same params as <cftrace>
	// stuff to trace
}
// note that CF11 incorrectly records timing information (see https://bugbase.adobe.com/index.cfm?event=bug&id=3811003)


// timer
cftimer(label="timer label" type="outline") { // plus all same params as <cftimer>
	// stuff to time
}

// RAILO only
timer label="timer label" type="outline" { // plus all same params as <cftimer>
	// stuff to time
}


// Database
// query
// general form
recordset = queryExecute(sqlString, params, options);

// with params array
numbers = queryExecute("
	SELECT	columns
	FROM	table
	WHERE	id BETWEEN ? AND ?
",
[1,4],
{
	datasource	="myDsn",
	result		= "result"	// this is analogous to the result attribute of <cfquery>
});

// with params struct
numbers = queryExecute("
	SELECT	columns
	FROM	table
	WHERE	id BETWEEN :low AND :high
",{low=2,high=3}
);

// insert
// COLDFUSION-only
cfinsert(datasource="myDataSource", table="myTable", formFields="list,of,form,fields"); // arguments the same as <cfinsert>

// RAILO-only (and only once https://issues.jboss.org/browse/RAILO-3180 is released)
insert datasource="myDataSource" table="myTable" formFields="list,of,form,fields"; // arguments the same as <cfinsert>. datasource is optional

// update
// COLDFUSION-only
cfupdate(datasource="myDataSource", table="myTable", formFields="list,of,form,fields"); // arguments the same as <cfupdate>

// RAILO-only (and only once https://issues.jboss.org/browse/RAILO-3180 is released)
update datasource="myDataSource" table="myTable" formFields="list,of,form,fields"; // arguments the same as <cfupdate>. datasource is optional

// stored procs

cfstoredproc(procedure="procName") {
	cfprocparam(type="in", cfsqltype="cf_sql_varchat", value="someValue");
	cfprocresult(name="result");
}

// RAILO only
storedproc procedure="procName" {
	procparam type="in" cfsqltype="cf_sql_varchat" value="someValue";
	procresult name="result";
}



// general

// output
writeOutput(expression); // expression must resolve to a string

// processingdirective
pageencoding "UTF-8"; // only in CFCs

// NB: suppresswhitespace is not relevant to CFScript as it only deals with a tag-only situation



// savecontent

savecontent variable="saved"{
	// stuff to save
}

// thread
thread action="run" name="threadName" {

}
thread action="join" name="threadName";



// TODO




</cfscript>