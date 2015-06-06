<cfxml variable="myxmldoc">
	<my-item-lists>
		<single-list>
			<item-in-list>
				<item>
					<is-completed>Foo</is-completed>
				</item>
			</item-in-list>
		</single-list>
	</my-item-lists>
</cfxml>
<cfoutput>
	#myxmldoc["my-item-lists"]["single-list"]["item-in-list"].xmlChildren[1]["is-completed"].xmlText#
</cfoutput>