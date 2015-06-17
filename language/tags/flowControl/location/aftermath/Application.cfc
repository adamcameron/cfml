<cfcomponent>

	<cffunction name="onRequestEnd">
		<cflog file="aftermath" text="onRequestEnd() called">
		<cfcookie name="aftermath_set_in_onrequestend" value="true">
	</cffunction>

</cfcomponent>