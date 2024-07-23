<cfscript>
if (thistag.executionMode == "end") exit;

writeDump([
{"this scope" = caller.this.somePublicVar},
{"variables scope" = caller.somePrivateVar},
{"local scope" = caller.local.someLocalVar}
]);
</cfscript>