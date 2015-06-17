<cfparam name="URL.word" default="">

<cfswitch expression="#URL.word#">
	<cfcase value="ocelot,pangolin">
		Either an ocelot or a pangolin is fine<br />
	</cfcase>
	<cfcase value="marmoset">
		A marmoset is almost as good as a pangolin or an ocelot<br />
	</cfcase>
	<cfdefaultcase>
		Not interested<br />
	</cfdefaultcase>
</cfswitch>

<cfscript>
	switch (URL.word){

		case "ocelot":
		case "pangolin": {
			writeOutput("Either an ocelot or a pangolin is fine<br />");
			break;
		}

		case "marmoset": {
			writeOutput("A marmoset is almost as good as a pangolin or an ocelot<br />");
			break;
		}

		default: {
			writeOutput("Not interested<br />");
		}
	}
</cfscript>