<cfdump var="#getPageContext().toString()#"><br />
start<br />
<cfset stDebug = structNew()>
<cfset stDebug["1. bufferBeforeTag"] = getPageContext().getOut().getString()>
<cf_tag>
	text before capturing buffer<br />
	<cfset stDebug["2. bufferInsideTag"] = getPageContext().getOut().getString()>
	text after capturing buffer<br />
	<cfflush>
</cf_tag>
text outside closing tag<br />
<cfset stDebug["3. bufferAfterTag"] = getPageContext().getOut().getString()>

<cfdump var="#stDebug#">