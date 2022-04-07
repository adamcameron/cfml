<cfscript>
// inbound.cfm
json = '{"a":"a","A":"A"}';
cfml = deserializeJSON(json);
writeDump([{json=json},{cfml=cfml}]);
</cfscript>