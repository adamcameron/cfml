<cfcomponent>
	<cffunction name="f" returntype="string">
		<cfset var x = "">
		<cfxml variable="x">
			<bottom>
				<middle>
					<top>
					</top>
				</middle>
			</bottom>
		</cfxml>
		<cfreturn x>
	</cffunction>

</cfcomponent>