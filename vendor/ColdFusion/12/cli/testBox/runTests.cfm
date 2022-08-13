<cfscript>
results = new testbox.system.TestBox().run(bundles=["Tests"], reporter="text");
CLI.write(results);
</cfscript>