<cfset sMsg = "TEST (#timeFormat(now(), 'HHMM')#)">
<cfmail from="acameron@straker-interactive.com" to="cameron.adam@gmail.com" subject="#sMsg#" type="text/plain">#sMsg#</cfmail>