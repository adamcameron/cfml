<cfset sLog="
 On 12/25/06 [user:253]John Smith[/a] Logged On.
 On 12/25/06 [user:254]Bob Brown[/a] Logged On.
 On 12/25/06 [user:255]Jane Green[/a] Logged On.
 On 12/25/06 [user:256]Sally Jones[/a] Logged On.
">

<cfset sRegexMatch = "\[user:([^\]]*)](.*?)\[/a]">
<cfset sRegexReplace = '<a href="user_info.cfm?userId=\1">\2</a>'>

<cfset sHtml = REReplace(sLog, sRegexMatch, sRegexReplace, "ALL")>

<cfdump var="#variables#">