<cfsavecontent variable="style"><?xml version="1.0" encoding="UTF-8"?>
<?xml version="1.0" encoding="UTF-8"?>
<frameChart is3D="false">
          <frame xDepth="12" yDepth="11"/>
          <yAxis scaleMin="0" scaleMax="35" labelCount="8">
               <labelFormat style="choice" pattern="0#0|5#5|10#10|15#15|20#20|25#25|30#30|35# "/>
               <parseFormat pattern="#,##0.###"/>
               <groupStyle>
                    <format pattern="#,##0.###"/>
               </groupStyle>
          </yAxis>
</frameChart>
</cfsavecontent>

<cfset a = [
		{metric="ABC", value=1},
		{metric="DEF", value=6},
		{metric="GHI", value=12},
		{metric="JKL", value=17},
		{metric="MNO", value=20}
	]
>

<cfchart format="jpg" style="#style#">
    <cfchartseries type="bar">
		<cfloop index="i" from="1" to="5">
			<cfchartdata item="#a[i].metric#" value="#a[i].value#">
		</cfloop>
    </cfchartseries>
</cfchart>