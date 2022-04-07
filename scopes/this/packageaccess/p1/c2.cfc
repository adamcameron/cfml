<cfcomponent>

	<cffunction name="callPackageMethod" access="public">
		<cfreturn "callPackageMethod: #createObject('component', 'cf.scopes.this.packageaccess.p1.c1').packageMethod()#">
	</cffunction>

</cfcomponent>