Top of main<br />
<cfinclude template="./overloadSystemInstanceInclude.cfm">
<cfscript>
	variables.system = "anything you like";	// or form.system, URL.system, etc
	system.dump(var=variables);
</cfscript>
