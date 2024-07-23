<cfxml variable="x">
	<aaa id="1">
		<bbb id="2">
			<ccc id="3"></ccc>
			<ccc id="4"></ccc>
			<ccc id="5"></ccc>
		</bbb>
		<bbb id="6"></bbb>
	</aaa>
</cfxml>
<cfdump var="#x#">
<cfset arrayDeleteAt(x.aaa.bbb.xmlChildren, 2)>
<cfdump var="#x#">
