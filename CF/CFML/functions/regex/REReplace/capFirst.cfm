<cfset s = "this is a test sentence,it has punctuation and it's also got a couple of apostrophe's (sic).the function should cap-first all words,i hope.plural numbers like 2s and 3s seem to work,too, for some reason. it, however,preserves wholly CAPITALISED word(s) <- note that last s is wrong using the regex.">
<cfset sMatch = "(^\b|[^\w'])(\w)">
<cfset sReplace = "\1\u\2">

<cfoutput>
	<table>
	<tr><td>Original</td><td>#s#<br /><br /></td></tr>
	<tr><td>Regex</td><td>#reReplace(s, sMatch, sReplace, "ALL")#<br /><br /></td></tr>
	<tr><td>CSS</td><td><span style="text-transform:capitalize">#s#</span></td></tr>
</table>
</cfoutput>
