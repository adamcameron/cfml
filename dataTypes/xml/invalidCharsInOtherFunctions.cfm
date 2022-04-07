<cfflush interval="128">

<cfscript>
	// http://www.w3.org/TR/2006/REC-xml11-20060816/#NT-RestrictedChar
	lChars="1-8,B-C,E-1F,7F-84,86-9F,FDD0-FDDF,1FFFE-1FFFF,2FFFE-2FFFF,3FFFE-3FFFF,4FFFE-4FFFF,5FFFE-5FFFF,6FFFE-6FFFF,7FFFE-7FFFF,8FFFE-8FFFF,9FFFE-9FFFF,AFFFE-AFFFF,BFFFE-BFFFF,CFFFE-CFFFF,DFFFE-DFFFF,EFFFE-EFFFF,FFFFE-FFFFF,10FFFE-10FFFF";

	lFunctions = "useCfXml,useCfWddx";

	stResult = structNew();
	stResult.total = 0;

	for (iFunction=1; iFunction <= listLen(lFunctions); iFunction++){
		sFunction = listGetAt(lFunctions, iFunction);
		stResult[sFunction] = structNew();
		stResult[sFunction].pass = 0;
		stResult[sFunction].fail = 0;
		stResult[sFunction].passed = "";
		stResult[sFunction].failed = "";

		writeOutput("Processing: [#sFunction#]<br />");
		for (iChars=1; iChars <= listLen(lChars); iChars++){
			sRange = listGetAt(lChars, iChars);
			iLow = inputBaseN(listFirst(sRange, "-"), 16);
			iHigh = inputBaseN(listLast(sRange, "-"), 16);

			for (i=iLow; i <= iHigh; i++){
				c = chr(i);
				stResult.total++;
				fnTemp = variables[sFunction];
				sDoc = fnTemp(char=c);
				try {
					xDoc = xmlParse(sDoc);
					stResult[sFunction].pass++;
					stResult[sFunction].passed = listAppend(stResult[sFunction].passed, i);
				} catch(any e){
					stResult[sFunction].failed = listAppend(stResult[sFunction].failed, i);
					stResult[sFunction].fail++;
				}
			}// end of range loop
		}// end of list loop
	}	// end of function loop
</cfscript>
<cfdump var="#stResult#">

<cffunction name="useCfWddx" returntype="string">
	<cfargument name="char" type="string" required="true">
	<cfscript>
		st = structNew();

		st[arguments.char] = true;
		st.key = arguments.char;

		st.q = queryNew("col");
		queryAddRow(st.q);
		querySetCell(st.q, "col", arguments.char);

		st.a = listToArray("#arguments.char#,element2");
	</cfscript>
	<cfwddx action="cfml2wddx" input="#st#" output="w">
	<cfreturn w>
</cffunction>


<cffunction name="useCfXml" returntype="string">
	<cfargument name="char" type="string" required="true">
	<cftry>
		<cfxml variable="x">
			<node><cfoutput>#arguments.char#</cfoutput></node>
		</cfxml>
		<cfcatch>
			<!--- <cfsavecontent variable="x">
				<node><cfoutput>#arguments.char#</cfoutput></node>
			</cfsavecontent> --->
			<cfset x = "cannot test">
		</cfcatch>
	</cftry>
	<cfreturn x>
</cffunction>