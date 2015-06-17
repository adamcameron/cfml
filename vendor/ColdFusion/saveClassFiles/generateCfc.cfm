<cfflush interval="16">
<cfscript>
	param name="URL.iterations" type="integer" default=0;
	
	cf = "cf";

	for (x=1; x <= URL.iterations; x++){
		functions = "";
		functionCount = randRange(5,15);
		for(i=1; i <= functionCount; i++){
			savecontent variable="code" {
				include "functionTemplate.cfm";
			}
			functions &= code;
		}

		componentReturnType = "Component#createBareUuid()#";
		savecontent variable="code" {
			include "componentTemplate.cfm";
		}

		fileWrite(expandPath("./api/") & componentReturnType & ".cfc", code);

		o = createObject("api.#componentReturnType#");
		writeOutput("#x#/#URL.iterations# #componentReturnType#.cfc written and tested<br>");
	}
	writeOutput("Created #iterations# files<br>");

	string function createBareUuid() {
		return replace(createUuid(), "-", "", "all");
	}
</cfscript>