<cfset iMsgId = getTickCount()>
<cfmail to="test@host.unlikelydomain.com" from="adam_junk@hotmail.com" subject="Test [#iMsgId#]">
	<cfoutput>Test [#iMsgId#]</cfoutput>
</cfmail>

<cfoutput>Test [#iMsgId#]</cfoutput>