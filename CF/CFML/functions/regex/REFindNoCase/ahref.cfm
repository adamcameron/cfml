<cfset sRegex = "<a\s[^>]*?href\s*?=\s*?([""'])([^\1]*?)\1[^>]*?>">
<cfset s = 'Here is my <a id="myLink" href = ''./index.html'' class="link">link</a>.  Please click it.'>

<cfset stMatch = reFindNoCase(sRegex, s, 1, true)>
<cfset sUrl = mid(s, stMatch.pos[3], stMatch.len[3])>
<cfdump var="#stmatch#" label="#sUrl#">