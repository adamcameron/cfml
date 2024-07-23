<cfset s = "The quick brown fox jumps over the lazy dog">
<cfset r.match = REFindNoCase("(?:quick)( brown )(?:fox)", s, 1, true)>
<cfset r.whole = mid(s, r.match.pos[1], r.match.len[1])>
<cfset r.string = mid(s, r.match.pos[2], r.match.len[2])>
<cfdump var="#r#">
