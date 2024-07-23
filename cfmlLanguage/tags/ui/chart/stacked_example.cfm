<cfchart format="flash" chartheight="800" chartwidth="600" scalefrom="0" scaleto="18000" showxgridlines="no" showygridlines="yes" seriesplacement="stacked" foregroundcolor="##FFFFFF" databackgroundcolor="##999999" showborder="no" fontbold="no" fontitalic="no" labelformat="number" xaxistitle="Year" yaxistitle="Petajoules" show3d="no" rotated="no" sortxaxis="no" showlegend="yes" showmarkers="no" backgroundcolor="##666666">
	<cfchartseries type="bar" serieslabel="Crude Oil" seriescolor="red" paintstyle="plain">
		<cfloop index="iYYYY" from="1970" to="2000">
			<cfchartdata item="#iYYYY#" value="#2500 + (iYYYY-1970)*25 + randRange(1,300)#">
		</cfloop>
	</cfchartseries>
	<cfchartseries type="bar" serieslabel="LPG" seriescolor="black">
		<cfloop index="iYYYY" from="1970" to="2000">
			<cfchartdata item="#iYYYY#" value="#0 + randRange(1,100)#">
		</cfloop>
	</cfchartseries>
	<cfchartseries type="bar" serieslabel="Marketable Natural Gas" seriescolor="blue">
		<cfloop index="iYYYY" from="1970" to="2000">
			<cfchartdata item="#iYYYY#" value="#2000 + (iYYYY-1970)*200 + randRange(1,150)#">
		</cfloop>
	</cfchartseries>
	<cfchartseries type="bar" serieslabel="Coal" seriescolor="purple">
		<cfloop index="iYYYY" from="1970" to="2000">
			<cfchartdata item="#iYYYY#" value="#200 + (iYYYY/100) + randRange(1,100)#">
		</cfloop>
	</cfchartseries>
	<cfchartseries type="bar" serieslabel="Coal" seriescolor="green">
		<cfloop index="iYYYY" from="1970" to="2000">
			<cfchartdata item="#iYYYY#" value="#300 + randRange(1,100)#">
		</cfloop>
	</cfchartseries>
	<cfchartseries type="bar" serieslabel="Nuclear" seriescolor="##33CCFF">
		<cfloop index="iYYYY" from="1973" to="2000">
			<cfchartdata item="#iYYYY#" value="#300 + randRange(1,50)#">
		</cfloop>
	</cfchartseries>
	<cfchartseries type="bar" serieslabel="Firewood etc" seriescolor="yellow">
		<cfloop index="iYYYY" from="1970" to="2000">
			<cfchartdata item="#iYYYY#" value="#300 + randRange(1,50)#">
		</cfloop>
	</cfchartseries>

</cfchart>