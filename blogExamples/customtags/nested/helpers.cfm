<cfscript>
	// this is just to factor some stuff out of the main tag files

	// fake function to resolve which kind of DB we're on, based on the DSN name
	function getDbConnector(string datasource){
		return 	{
			createJdbcParam = createJdbcParam,
			execute			= execute
		};
	}
	
	// these are the "methods" of the DbConnector "object"
	struct function createJdbcParam(){
		// this would create a Java object suitable to pass to JDBC, based on the CFML values 
		return duplicate(arguments[1]);
	}
	
	query function execute(required string SQL, array parameters){
		// this would pass the SQL and the parameters to the DB, and wait for the result
		var result = queryNew("");
		queryAddColumn(result, "id", [1]);
		queryAddColumn(result, "firstName", ["Zachary"]);
		queryAddColumn(result, "lastName", ["Cameron Lynch"]);
		return result;
	}

	
	boolean function validateParam(attributes){
		/*	
			this would validate that:
			- the appropriate attribute combos have been passed,
			- the value conforms to the type constraints 
			- etc
		*/
		var isValid = true;
		if (isValid){
			return true;
		}else{
			throw(type="SomeAppropriateException");
		};
	}
</cfscript>
<!--- just so I can do the whole thing in CFScript --->
<cffunction name="cfassociate">
	<cfassociate attributecollection="#arguments#">
</cffunction>