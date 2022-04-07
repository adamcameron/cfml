<cfscript>
	function someFunctionWhichUsesaBifAsACallback(required function callback){
		writeDump(callback);
	}

	someFunctionWhichUsesaBifAsACallback(len);
</cfscript>