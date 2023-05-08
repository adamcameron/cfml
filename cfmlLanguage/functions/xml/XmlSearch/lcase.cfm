<cfxml variable="x">
<aa>
	<bb>all lowercase</bb>
	<bB>mixed CASE</bB>
	<Bb>MIXED case</Bb>
	<BB>ALL UPPERCASE</BB>
</aa>
</cfxml>

<cfset a1 = xmlSearch(x, "/aa/bb")>
<cfset a2 = xmlSearch(x, "/aa/*[translate(local-name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='bb']")>

<cfdump var="#variables#">