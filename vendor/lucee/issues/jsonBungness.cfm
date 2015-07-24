<cfscript>
notJson = '{"two":"rua","three":"toru","one":"tahi", "four":"wha",}'; // missing comma between tahi and four
validJson = isjson(notJson);
struct = deserializeJson(notJson);

writeDump(variables);
</cfscript>