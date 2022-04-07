<cfscript>
	param name="URL.magnitude"	default=0;
	param name="URL.method"		default="string";
	param name="URL.reset" type="boolean" default=false;
</cfscript>
<cfapplication name="createString_#URL.method#_#URL.magnitude#" sessionmanagement="true">
<cfscript>
	param name="session.cumulative" default={count=0, total=0, mean=0};
	if (URL.reset){
		session.cumulative = {count=0, total=0, mean=0};
	}

	stringLength = 10^URL.magnitude;

	switch (URL.method){
		case "string": {
			include "string.cfm";
			break;
		}
		case "stringBuffer": {
			include "stringBuffer.cfm";
			break;
		}
		case "cfsavecontent": {
			include "cfsavecontent.cfm";
			break;
		}
		default: {
			throw(
				"Invalid METHOD",
				"InvalidMethodException",
				"A method parameter must be passed on the URL, and be one of STRING, STRINGBUFFER, CFSAVECONTENT"
			);
		}
	}

	executionTime = endTime-startTime;
	
	session.cumulative.count++;
	session.cumulative.total += executionTime;
	session.cumulative.mean = session.cumulative.total \ session.cumulative.count;
	
	writeDump({
		expectedSize	= stringLength,
		actualSize		= len(s),
		firstHundred	= left(s, 100),
		last			= right(s, 1),
		executionTime	= executionTime,
		urlParams		= URL,
		cumulative		= session.cumulative
	});
</cfscript>