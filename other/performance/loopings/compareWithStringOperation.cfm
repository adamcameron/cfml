<cfscript>
// compareWithStringOperation.cfm

param name="URL.iterations" type="integer" default=0;

writeoutput("Running #URL.iterations# iterations<br><br>");

array = [];
for (i=1; i <= URL.iterations; i++){
	array.append(i);
}

include "stringOperationTagBasedTests.cfm";

string = "";
start = getTickCount();
for (i=0; i <= URL.iterations; i++){
	string = string & repeatString(chr(64+i) ,10);
}
end=getTickCount();
writeOutput("for (general) took #end-start#ms<hr>");

string = "";
start = getTickCount();
for (i in array){
	string = string & repeatString(chr(64+i) ,10);
}
end=getTickCount();
writeOutput("for (array) took #end-start#ms<hr>");

handler = function(i){
	string = string & repeatString(chr(64+i) ,10);
};

string = "";
start = getTickCount();
array.each(handler);
end=getTickCount();
writeOutput("each() with pre-defined handler took #end-start#ms<hr>");

string = "";
start = getTickCount();
array.each(function(i){
	string = string & repeatString(chr(64+i) ,10);
});
end=getTickCount();
writeOutput("each() with inline handler took #end-start#ms<hr>");

start = getTickCount();
array.reduce(function(string, i){
	return string & repeatString(chr(64+i) ,10);
}, "");
end=getTickCount();
writeOutput("reduce() took #end-start#ms<hr>");

</cfscript>
