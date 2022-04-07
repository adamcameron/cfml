<cffunction name="addObject" returntype="void">
	<cfset var iStart	= getTickCount()>
	<cfquery datasource="#variables.sycamoreContext.app.dsn#">
		INSERT INTO SOBJ_NOTE (
			prop_id,
			sobj_id,
			ten_id
			, prop_text1
		) VALUES (
			CONCAT(LEFT(UUID(), 23), SUBSTRING(UUID(), 25)),
			<cfqueryparam value="#stValues['sobj_id'].basic#" cfsqltype="CF_SQL_VARCHAR" maxlength="35">,
			<cfqueryparam value="#variables.sycamoreContext.user.ten_id#" cfsqltype="CF_SQL_VARCHAR" maxlength="35">
			,
				<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#stValues['dbo_text2'].basic#">
			)
	</cfquery>
	
	
	<cfoutput>#getTickCount() - iStart#ms</cfoutput>
</cffunction>

<cfscript>
	variables.sycamoreContext.app.dsn = "syc_test";
	variables.sycamoreContext.user.ten_id = "E378213E-B295-566E-0C6CE99D1513EBEF";
	variables._null = "<syc:null />";

	stValues.sobj_id.basic		= createUuid();
	stValues.sobj_created.basic	= now();
	stValues.sobj_modified.basic= now();
	stValues.ten_id.basic		= variables.sycamoreContext.user.ten_id;
	stValues.dbo_boolean.basic	= true;
	stValues.dbo_datetime.basic	= now();
	stValues.dbo_decimal.basic	= pi();
	stValues.dbo_integer.basic	= 42;
	stValues.dbo_money.basic	= 1.23;
	stValues.dbo_password.basic	= hash(createUuid());
	stValues.dbo_string.basic	= "hello world";
	stValues.dbo_text.basic		= "hello world text";
	stValues.dbo_uuid.basic		= createUuid();
	stValues.dbo_boolean2.basic	= true;
	stValues.dbo_datetime2.basic= now();
	stValues.dbo_decimal2.basic	= pi();
	stValues.dbo_integer2.basic	= 42;
	stValues.dbo_money2.basic	= 1.23;
	stValues.dbo_password2.basic= hash(createUuid());
	stValues.dbo_string2.basic	= "hello world";
	stValues.dbo_text2.basic	= "hello world text";
	stValues.dbo_uuid2.basic	= createUuid();
	addObject(stValues=stValues);
</cfscript>



