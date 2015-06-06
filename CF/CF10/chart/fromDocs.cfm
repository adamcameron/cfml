<cfchart format ="html" type="bubble" showlegend="false"
labels=#[{"text"="Hello Label","hook":"node:plot=0,index=2,offset-x=-10,offset-y=-90"}]#>
<cfchartseries type="bubble" label="Total_Days">
<cfchartdata item=1 value=10 zvalue=40>
<cfchartdata item=2 value=20 zvalue=30>
<cfchartdata item=3 value=30 zvalue=20>
<cfchartdata item=4 value=20 zvalue=35>
<cfchartdata item=5 value=40 zvalue=10>
</cfchartseries>
</cfchart>