<cfscript>
param URL.iterations=0;

array = [];
for (i=1; i <= URL.iterations; i++){
	array.append(i);
}

include "stringOperationTagBasedTests.cfm";

string = "";
start = getTickCount();
for (i=0; i <= URL.iterations; i++){
	string = string & chr(64+i);
}
end=getTickCount();
writeOutput("for (general) took #end-start#ms<hr>");

string = "";
start = getTickCount();
for (i in array){
	string = string & chr(64+i);
}
end=getTickCount();
writeOutput("for (general) took #end-start#ms<hr>");

handler = function(i){
	string = string & chr(64+i);
};

string = "";
start = getTickCount();
array.each(handler);
end=getTickCount();
writeOutput("each() with pre-defined handler took #end-start#ms<hr>");

string = "";
start = getTickCount();
array.each(function(i){
	string = string & chr(64+i);
});
end=getTickCount();
writeOutput("each() with inline handler took #end-start#ms<hr>");

start = getTickCount();
array.reduce(function(string, i){
	return string & chr(64+i);
}, "");
end=getTickCount();
writeOutput("reduce() took #end-start#ms<hr>");

</cfscript>
