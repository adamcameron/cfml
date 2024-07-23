<cfcomponent output="false">


	<!--- like for like test --->
	<cffunction name="f1" returntype="void" output="true">
		<cfset var i = 0>
		<cfset var x = 0>
		<cfset var iLoopStart = getTickCount()>
		<cfset var iLoopTime = 0>

		<cfloop from="1" to="100000" index="i">
			<cfset x = i*2 + 1>
		</cfloop>
		<cfset iLoopTime = getTickCount() - iLoopStart>
		<cfoutput>Loop execution time: #iLoopTime#<br /></cfoutput>
	</cffunction>


	<!--- original --->
	<cffunction name="f2">
		<cfset looptick = getTickCount()>
		<cfloop from="1" to="100000" index="i">
			<cfset x = i*2 + 1>
		</cfloop>
		<cfset looptime = getTickCount() - looptick>
		<cfreturn looptime>
	</cffunction>



	<!--- original with VARing --->
	<cffunction name="f3" output="false" returntype="numeric">
		<cfset var i = 0>
		<cfset var x = 0>
		<cfset var looptime = 0>
		<cfset var looptick = getTickCount()>

		<cfloop from="1" to="100000" index="i">
			<cfset x = i*2 + 1>
		</cfloop>

		<cfset looptime = getTickCount() - looptick>
		<cfreturn looptime>
	</cffunction>


	<!--- like for like with return value --->
	<cffunction name="f4" returntype="numeric" output="true">
		<cfset var i = 0>
		<cfset var x = 0>
		<cfset var iLoopStart = getTickCount()>
		<cfset var iLoopTime = 0>

		<cfloop from="1" to="100000" index="i">
			<cfset x = i*2 + 1>
		</cfloop>
		<cfset iLoopTime = getTickCount() - iLoopStart>
		<cfoutput>Loop execution time: #iLoopTime#<br /></cfoutput>
		<cfreturn iLoopTime>
	</cffunction>


	<!--- like for like without VARing --->
	<cffunction name="f5" returntype="numeric" output="true">
		<cfset var i = 0>
		<cfset var x = 0>
		<cfset var iLoopStart = getTickCount()>
		<cfset iLoopTime = 0>


		<cfloop from="1" to="100000" index="i">
			<cfset x = i*2 + 1>
		</cfloop>
		<cfset iLoopTime = getTickCount() - iLoopStart>
		<cfoutput>Loop execution time: #iLoopTime#<br /></cfoutput>
		<cfreturn iLoopTime>
	</cffunction>


</cfcomponent>