<cfflush interval="50">
<h1>
One of many demos on the performance effects of IIf(). <br />
Average the trace information and run a few times as well.
</h1>

<cfloop from="1" to="20"  index="iTrialNum">
	<cfoutput><h2><u>Trial #iTrialNum#:</u></h2></cfoutput>

	<h3>Long series, no IIF, stand by...</h3>

	<cf_timeit>
		<cfscript>
		iSum    = 0;
		iLimit  = 200 * iTrialNum;

		writeOutput("iLimit: [#iLimit#]<br />");
		for (iDigit=1;  iDigit LTE iLimit;  iDigit=iDigit+1){
		    if (NOT iDigit MOD 200)
		        WriteOutput (". ");
		    else
		        WriteOutput ("");


		    if (iDigit MOD 200)
		        iSum    = iSum + iDigit;
		    else
		        iSum    = iSum + 0;
		}
		</cfscript>
	</cf_timeit>
	<cfoutput><h3>Final sum = #iSum#</h3></cfoutput>

	<h3>Long series, with IIF, stand by...</h3>
	<cf_timeit>
		<cfscript>
		iSum    = 0;
		iLimit  = 200 * iTrialNum;
		writeOutput("iLimit: [#iLimit#]<br />");
		for (iDigit=1;  iDigit LTE iLimit;  iDigit=iDigit+1){
		    WriteOutput (IIf (NOT iDigit MOD 200, DE (". "),   DE ("")));
		    iSum    = iSum + IIf (iDigit MOD 200, iDigit, 0);
		}
		</cfscript>
	</cf_timeit>
	<cfoutput><h3>Final sum = #iSum#</h3></cfoutput>
	<hr />
</cfloop>