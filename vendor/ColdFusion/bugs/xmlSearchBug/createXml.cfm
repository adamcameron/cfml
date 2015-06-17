<cfparam name="URL.seed" type="integer" default="0">
<cfset id = 0>
<cfoutput>
<cfxml variable="x">
	<aaa id="#++id#">
	<cfloop index="i" from="1" to="#URL.seed#">
		<bbb id="#++id#">
			<cfloop index="i" from="1" to="#URL.seed\2#">
				<ccc id="#++id#">
					<cfloop index="i" from="1" to="#URL.seed\4#">
						<ddd id="#++id#" />
					</cfloop>
				</ccc>
			</cfloop>
		</bbb>
	</cfloop>
	</aaa>
</cfxml>
</cfoutput>
<cffile action="write" file="#expandPath('./text.xml')#" output="#x#">