<cfxml variable="x">
	<aaa>
		<bbb id="1">
			<id>2</id>
			<ccc></ccc>
			<ccc></ccc>
			<ccc id="3">
				<ddd></ddd>
				<ddd id="4"></ddd>
			</ccc>
		</bbb>
	</aaa>
</cfxml>

<cfoutput>
	#x.aaa.bbb.xmlAttributes["id"]#<br />
	#x.aaa.bbb.id.xmlText#<br />
	#x.aaa.bbb.ccc[3].xmlAttributes["id"]#<br />
	<cfset a = xmlSearch(x, "/aaa/bbb/ccc/ddd[@id]")>
	#a[1].xmlAttributes["id"]#<br />
</cfoutput>