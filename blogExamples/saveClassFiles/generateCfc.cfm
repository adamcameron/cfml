<cfscript>
	cf = "cf";

	for (x=1; x <= 1000; x++){
		functions = "";
		functionCount = randRange(1,10);
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
	}

	string function createBareUuid() {
		return replace(createUuid(), "-", "", "all");
	}

</cfscript>
