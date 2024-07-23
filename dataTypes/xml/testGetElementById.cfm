<cfxml variable="x">
	<aaa id="a">
		<bbb id="b">
			<ccc notid="c">Hello World</ccc>
		</bbb>
	</aaa>
</cfxml>
<cfset x.aaa.bbb.ccc.setIdAttribute("notid", true)>

<cfset s = x.getElementById("c").getTextContent()>
<cfoutput>#s#</cfoutput>
