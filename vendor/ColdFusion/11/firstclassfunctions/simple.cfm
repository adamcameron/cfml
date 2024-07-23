<cfscript>
function decorateText(text, decorator){
	return decorator(text);
}

message = "G'day world!";
shoutyMessage = decorateText(message, ucase);

writeDump([message, shoutyMessage]);
</cfscript>