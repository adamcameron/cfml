<cfparam name="URL.emailTo" default="acameron@straker-interactive.com" type="email">
<cfset sTest = "TEST #timeFormat(now(), 'HHMM')#">
<cfmail from="acameron@straker-interactive.com" to="#URL.emailTo#" subject="#sTest#" type="text/plain">
#sTest#
</cfmail>

<cfoutput>#sTest# Sent to &lt;#URL.emailTo#&gt;<br /></cfoutput>