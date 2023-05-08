<cfxml variable="myxmldoc">
	<todo-list>
		<complete>foo</complete>
	</todo-list>
</cfxml>

<cfoutput>
	#myxmldoc["todo-list"].complete.xmlText#
</cfoutput>