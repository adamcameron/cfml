<cfset a = [
		{metric="ABC", value=1},
		{metric="DEF", value=6},
		{metric="GHI", value=12},
		{metric="JKL", value=17},
		{metric="MNO", value=20}
	]
>

<cfchart scalefrom="0" scaleto="31">
	<cfchartseries type="bar">
		<cfloop index="i" from="1" to="5">
			<cfchartdata item="#a[i].metric#" value="#a[i].value#">
		</cfloop>
	</cfchartseries>
</cfchart>