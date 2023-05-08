<cfscript>
ids = URL.ids.listToArray();
idIdx = ids.find(URL.id);
nextIds = idIdx==ids.len() ? [] : ids.slice(idIdx+1, min(URL.count, ids.len()-idIdx));
writeDump(nextIds);
</cfscript>

