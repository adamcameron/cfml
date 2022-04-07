<cffunction name="f" output="false" returntype="string">
	<cfargument name="x" type="string" required="yes">
	<cfreturn x>
</cffunction>

<cfxml variable="x">
	<top>
		<middle>
			<bottom />
		</middle>
	</top>
</cfxml>

<cfdump var="#f(x)#">