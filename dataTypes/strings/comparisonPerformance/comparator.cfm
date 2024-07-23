<cfscript>
	param name="URL.method"						default="compare";  
	param name="URL.lenDiff"	type="boolean"	default=false;
	param name="URL.equal"		type="boolean"	default=false;  
	param name="URL.reset"		type="boolean"	default=false;
</cfscript>
<cfapplication name="comparator_#URL.method#_#URL.lenDiff#_#url.equal#" sessionmanagement="true">
<cfscript>
	param name="session.cumulative" default={count=0, total=0, mean=0};
	if (URL.reset){
		session.cumulative = {count=0, total=0, mean=0};
	}

	baseString = fileRead(expandPath("./data.txt"));
	baseStringLen = len(baseString);
	
	s1 = baseString;
	s2 = baseString;
	
	if (!URL.equal){
		// make the strings different, but make them different quite a long way into the string: after at least 500000 characters
		diffCharPosn = randRange(baseStringLen\2, baseStringLen);
		s1 = insert("X", s1, diffCharPosn);
		s2 = insert("Y", s2, diffCharPosn);

		/*
		another test could be to see how the comparators deal with different-lengthed strings.
		This could be a good early exit candidate: strings of different length are definitely not equal, irrespective of content
		*/
		if (URL.lenDiff){
			s2 = insert("Z", s2, diffCharPosn);
		}
	}else{
		diffCharPosn = 0;	// not used but saves another conditional further down
	}
	
	startTime = getTickCount();
	switch (URL.method){
		case "compare" : {
			result = compare(s1, s2);
			break;
		}
		case "compare_eq_0" : {
			result = compare(s1, s2) eq 0;
			break;
		}
		case "compareNoCase" : {
			result = compareNoCase(s1, s2);
			break;
		}
		case "eq" : {
			result = s1 eq s2;
			break;
		}
		default: {
			throw(
				"Invalid METHOD",
				"InvalidMethodException",
				"A method parameter must be passed on the URL, and be one of COMPARE, COMPARE_EQ_0, COMPARENOCASE, EQ"
			);
		}
	}
	endTime = getTickCount();

	executionTime = endTime-startTime;
	
	session.cumulative.count++;
	session.cumulative.total += executionTime;
	session.cumulative.mean = session.cumulative.total \ session.cumulative.count;
	
	writeDump({
		result			= result,
		executionTime	= executionTime,
		diffCharPosn	= diffCharPosn,
		s1Proximity		= mid(s1, diffCharPosn-50, 101),
		s2Proximity		= mid(s2, diffCharPosn-50, 101),
		params			= url,
		len				= {
			s1	= len(s1),
			s2	= len(s2)
		},
		cumulative		= session.cumulative
	});
</cfscript>