<cfxml variable="x1">
	<numbers>
		<one>Tahi</one>
		<two>TWO</two>
		<three>Toru</three>
		<four>Wha</four>
	</numbers>
</cfxml>
<cfset a = xmlSearch(x1, "/numbers/two/")>

<cfset a[1].xmlText = "Rua">

<cfdump var="#variables#">

<cfoutput>#a[1].getClass().getName()#</cfoutput>