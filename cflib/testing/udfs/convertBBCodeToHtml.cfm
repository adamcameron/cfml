<cfscript>
public string function convertBBCodeToHtml(required string text, array substitutions){
	param array substitutions = [
		{match="\[i\](.*?)\[\/i\]", replace="<i>\1</i>"},
		{match="\[b\](.*?)\[\/b\]", replace="<strong>\1</strong>"},
		{match="\[u\](.*?)\[\/u\]", replace="<u>\1</u>"},
		{match="\[s\](.*?)\[\/s\]", replace="<strike>\1</strike>"},
		{match="\[code\](.*?)\[\/code\]", replace="<pre>\1</pre>"},
		{match="\[img\](.*?)\[\/img\]", replace='<img src="\1" alt="" />'},
		{match="\[quote\](.*?)\[\/quote\]", replace='<blockquote><p>"\1"</p></blockquote>'},
		{match='\[quote="(.*?)"\](.*?)\[\/quote\]', replace="<blockquote><p>\2<br /> - \1</p></blockquote>"},
		{match='\[style size="(.*?)"\](.*?)\[\/style\]', replace='<span style="font-size:\1">\2</span>'},
		{match='\[style color="(.*?)"\](.*?)\[\/style\]', replace='<span style="color:\1;">\2</span>'},
		{match="\[list\]\s*\[\*\]", replace="<ul><li>"},
		{match="\[\*\]", replace="</li> <li>"},
		{match="\[\/list\]", replace="</li></ul>"},
		{match="\[table\]", replace='<table style="border:1px solid black;">'},
		{match="\[\/table\]", replace="</table>"},
		{match="\[tr\]", replace="<tr>"},
		{match="\[\/tr\]", replace="</tr>"},
		{match="\[td\]", replace="<td>"},
		{match="\[\/td\]", replace="</td>"},
		{match="\[url\](?:http(s)?:\/\/)?(.*?)\[\/url\]", replace='<a href="http\1://\2" target="_blank">http\1://\2</a>'}
	];
	
	for(var substitution in substitutions){
		text = reReplaceNoCase(text, substitution.match, substitution.replace, "All");
	}
	return text;
}


public string function convertBBCodeToHtmlUsingReduce(required string text, array substitutions){
	param array substitutions = [
		{match="\[i\](.*?)\[\/i\]", replace="<i>\1</i>"},
		{match="\[b\](.*?)\[\/b\]", replace="<strong>\1</strong>"},
		{match="\[u\](.*?)\[\/u\]", replace="<u>\1</u>"},
		{match="\[s\](.*?)\[\/s\]", replace="<strike>\1</strike>"},
		{match="\[code\](.*?)\[\/code\]", replace="<pre>\1</pre>"},
		{match="\[img\](.*?)\[\/img\]", replace='<img src="\1" alt="" />'},
		{match="\[quote\](.*?)\[\/quote\]", replace='<blockquote><p>"\1"</p></blockquote>'},
		{match='\[quote="(.*?)"\](.*?)\[\/quote\]', replace="<blockquote><p>\2<br /> - \1</p></blockquote>"},
		{match='\[style size="(.*?)"\](.*?)\[\/style\]', replace='<span style="font-size:\1">\2</span>'},
		{match='\[style color="(.*?)"\](.*?)\[\/style\]', replace='<span style="color:\1;">\2</span>'},
		{match="\[list\]\s*\[\*\]", replace="<ul><li>"},
		{match="\[\*\]", replace="</li> <li>"},
		{match="\[\/list\]", replace="</li></ul>"},
		{match="\[table\]", replace='<table style="border:1px solid black;">'},
		{match="\[\/table\]", replace="</table>"},
		{match="\[tr\]", replace="<tr>"},
		{match="\[\/tr\]", replace="</tr>"},
		{match="\[td\]", replace="<td>"},
		{match="\[\/td\]", replace="</td>"},
		{match="\[url\](?:http(s)?:\/\/)?(.*?)\[\/url\]", replace='<a href="http\1://\2" target="_blank">http\1://\2</a>'}
	];
	return substitutions.reduce(function(text, substitution){
		return reReplaceNoCase(text, substitution.match, substitution.replace, "All");
	}, text);
}
</cfscript>