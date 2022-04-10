<h1>CFML</h1>
<cfswitch expression="F3">
	<cfcase value="DS">
		prices for DS customers
	</cfcase>
	<cfcase value="SC">
		prices for SC customers
	</cfcase>
	<cfcase value="ER">
		prices for ER customers
	</cfcase>
	<cfdefaultcase>
		prices for all other customers
	</cfdefaultcase>
</cfswitch>

<h1>CFScript</h1>
<cfscript>
	switch("F3"){
		case "DS": {
			writeOutput("prices for DS customers");
			break;
		}
		case "SC": {
			writeOutput("prices for SC customers");
			break;
		}
		case "ER": {
			writeOutput("prices for ER customers");
			break;
		}
		default: {
			writeOutput("prices for all other customers");
			break;
		}
	}
</cfscript>