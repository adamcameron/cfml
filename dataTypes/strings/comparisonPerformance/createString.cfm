<cfscript>
	param name="URL.magnitude" default=0;
	param name="URL.using" type="regex" pattern="^string(?:buffer)?$"  default="string";
	param name="URL.reset" type="boolean" default=false;
</cfscript>
<cfapplication name="createString_#URL.using#_#URL.magnitude#" sessionmanagement="true">
<cfscript>
	param name="session.cumulative" default={count=0, total=0, mean=0};
	if (URL.reset){
		session.cumulative = {count=0, total=0, mean=0};
	}

	chars = listToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", "");
	charsLen = arrayLen(chars);
	
	stringLength = 10^URL.magnitude;

	if (URL.using == "string"){
		include "usingString.cfm";
	}else{
		include "usingStringBuffer.cfm";
	}
	executionTime = endTime-startTime;
	
	session.cumulative.count++;
	session.cumulative.total += executionTime;
	session.cumulative.mean = session.cumulative.total \ session.cumulative.count;
	
	writeDump({
		expectedSize	= stringLength,
		actualSizeCf	= len(s),
		actualSizeJava	= s.length(),
		firstHundred	= left(s, 100),
		last			= right(s, 1),
		len				= len(s),
		executionTime	= executionTime,
		urlParams		= URL,
		cumulative		= session.cumulative
	});
</cfscript>