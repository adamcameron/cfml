<cfscript>
function ConvertFacebookTagsToLinks(string){
	string = REReplace(string, '@\[([0-9]+):[0-9]+:(.+)\]', '<a target="_blank" href="https://www.facebook.com/\1">\2</a>', 'all');
	return string;
}	
</cfscript>