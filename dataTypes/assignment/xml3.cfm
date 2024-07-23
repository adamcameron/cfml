<cfxml variable="x1">
	<numbers>
		<one>Tahi</one>
		<TWO>TWO</TWO>
		<three>Toru</three>
		<four>Wha</four>
	</numbers>
</cfxml>
<cfset a = xmlSearch(lcase(x1), "/numbers/two/")>

<cfset a[1].xmlText = "Rua">

<cfdump var="#variables#">
