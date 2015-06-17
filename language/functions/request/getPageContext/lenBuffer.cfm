Hello World<cfset s = getPageContext().getOut().getString()>
<cfset i2 = len(s)>
<cfset i1 = getPageContext().getOut().buffer.size()>

<br />
<cfoutput>#i1#</cfoutput><br />
<cfoutput>[#i2#][#s#]</cfoutput><br />