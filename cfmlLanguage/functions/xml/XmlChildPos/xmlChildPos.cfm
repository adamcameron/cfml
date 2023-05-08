<cfxml variable="x">
	<fruit>
		<apple>green</apple>
		<banana>yellow</banana>
		<cherry>purple</cherry>
		<cherry>red</cherry>
		<cherry>yellow</cherry>
		<apple>red</apple>
	</fruit>
</cfxml>
<cfdump var="#x#">
<cfset i = xmlChildPos(x.fruit, "apple", 2)>
<cfdump var="#i#">
<cfdump var="#x.fruit.apple[2]#">