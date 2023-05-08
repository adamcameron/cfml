<cfcomponent>
	<cffunction name="func" output="true">
		<cfargument name="arg" required="no">
		Outputs just fine<br />
		<cfdump var="#arguments#" label="Do a &lt;CFDUMP&gt;: outputs fine">
		<cfoutput>Does output<br /></cfoutput>
		Doesn't output, despite output=TRUE<br />
		<cfoutput>So only stuff withing &lt;cfoutput&gt; tags are output now,despite output=TRUE<br /></cfoutput>
		<cfdump var="#arguments#" label="Just to confirm &lt;CFDUMP&gt; still works">
	</cffunction>
</cfcomponent>
