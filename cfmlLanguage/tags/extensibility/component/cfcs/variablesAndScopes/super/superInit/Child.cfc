<cfcomponent output="true" extends="shared.cf.cfcs.superInit.Intermediary">
	CHILD CFC<br />
	<cffunction name="init" returntype="shared.cf.cfcs.superInit.Child" output="true" access="public">
		CHILD INIT()<br />
		<cfreturn super.init()>
	</cffunction>
</cfcomponent>