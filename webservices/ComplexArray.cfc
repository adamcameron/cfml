<cfcomponent>


	<cffunction name="emptyArray" returntype="array" access="remote">
		<cfreturn arrayNew(1)>
	</cffunction> 


	<cffunction name="stringArray" returntype="array" access="remote">
		<cfreturn listToArray("tahi,rua,toru,wha")>
	</cffunction> 


	<cffunction name="complexArray" returntype="array" access="remote">
		<cfscript>
			var a = arrayNew(1);
			a[1] = structNew();
			a[1].one = "tahi";
			a[2] = structNew();
			a[2].two = "rua";
			a[3] = structNew();
			a[3].three = "toru";
			a[4] = structNew();
			a[4].four = "wha";
			return a;
		</cfscript>
	</cffunction> 

	
</cfcomponent>