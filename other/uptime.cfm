<cfset tsStartUp = server.coldfusion.expiration>
Start up: <cfoutput>#dateFormat(tsStartUp, "yyyy-mm-dd")# #timeFormat(tsStartUp, "HH:MM:SS.LLL")#</cfoutput><br />

<cfset tsNow = now()>
Current: <cfoutput>#dateFormat(tsNow, "yyyy-mm-dd")# #timeFormat(tsNow, "HH:MM:SS.LLL")#</cfoutput><br />

<cfscript>
	iSec = dateDiff("s", tsStartUp, tsNow);
	if (iSec gt 60){
		iMin = iSec \ 60;
		iSec = iSec mod 60;

		if (iMin gt 60){
			iHr		= iMin \ 60;
			iMin	= iMin mod 60;

			if (iHr gt 24){
				iDay	= iHr \ 24;
				iHr		= iHr mod 24;

				writeOutput("Uptime: #iDay#d#numberFormat(iHr, '00')#h");
			}else{
				writeOutput("Uptime: #iHr#h#numberFormat(iMin, '00')#m");
			}
		}else{
			writeOutput("Uptime: #iMin#m#numberFormat(iSec, '00')#s");
		}

	}else{
		writeOutput("Uptime: #iSec#s");
	}


</cfscript>