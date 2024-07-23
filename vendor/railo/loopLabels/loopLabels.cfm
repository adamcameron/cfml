<cfset innerThreshold = 6>
<cfset outerThreshold = 11>

<cfoutput>
<cfloop index="x" from="1" to="5" label="outer">
	Outer: x:#x#<br>
	<cfloop index="y" from="1" to="5" label="inner">
		Inner: y:#y#<br>
		<cfset sum = x+y>
		<cfset product = x*y>
		sum:#sum#; product:#product#<br>
		<cfif product GT outerThreshold>
			#product# > #outerThreshold#: Breaking out of outer<br>
			<cfbreak "outer">
		</cfif>
		<cfif sum GT innerThreshold>
			#sum# > #innerThreshold#: Continuing out of inner<br>
			<cfcontinue "inner">
		</cfif>
		Bottom of inner loop<br>
	</cfloop>
	Bottom of outer loop<hr>	
</cfloop>
</cfoutput>