<cfxml variable="x1">
	<numbers>
		<one>Tahi</one>
		<two>TWO</two>
		<three>Toru</three>
		<four>Wha</four>
	</numbers>
</cfxml>
<cfset x2 = x1>

<cfset x1.numbers.two.xmlText = "Rua">

<cfdump var="#variables#">