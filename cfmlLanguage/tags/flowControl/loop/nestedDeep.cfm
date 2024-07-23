<cfsetting enablecfoutputonly="true">
<cfflush interval="50">
<cfloop index="a" from="1" to="3">
	<cfloop index="b" from="1" to="3">
		<cfloop index="c" from="1" to="3">
			<cfloop index="d" from="1" to="3">
				<cfloop index="e" from="1" to="3">
					<cfloop index="f" from="1" to="3">
						<cfloop index="g" from="1" to="3">
							<cfloop index="h" from="1" to="3">
								<cfloop index="i" from="1" to="3">
									<cfloop index="j" from="1" to="3">
										<cfoutput>[#a#][#b#][#c#][#d#][#e#][#f#][#g#][#h#][#i#][#j#]<br /></cfoutput>
									</cfloop>
								</cfloop>
							</cfloop>
						</cfloop>
					</cfloop>
				</cfloop>
			</cfloop>		
		</cfloop>
	</cfloop>
</cfloop>