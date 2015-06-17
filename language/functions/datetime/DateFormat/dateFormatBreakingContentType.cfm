<cfprocessingdirective pageencoding="utf-8">
<cfsetting enablecfoutputonly="yes">
<cfheader name="Content-Type" value="text/xml; charset=utf-8">
<cfset aaa = dateformat(now(), 'yyyymmdd')>
<cfoutput><?xml version="1.0" encoding="UTF-8"?>
<test>hello</test>
</cfoutput>