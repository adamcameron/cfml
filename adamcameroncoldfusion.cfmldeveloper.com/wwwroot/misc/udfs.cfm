<cfscript>
// udfs.cfm
function outputRandomLetters(){
	for (var i=1; i <= (128*1014); i++){
		writeoutput(chr(randRange(97,122)));
	}
}

function makeHttpRequest(){
	return new Http(method="get", url="http://www.imdb.com/user/ur0480544/ratings?q=#createUuid()#").send().getprefix().statusCode;
}
</cfscript>