<cfscript>
	sVarName = "foo";
	param string "variables.#sVarName#" = "";
	system.param("variables.#sVarName#", "string", "");
	system.dump(variables);
</cfscript>