<cfcomponent output="false">


	<cffunction name="getGridData" access="remote" output="true" returntype="struct">
        <cfargument name="page" default="1" type="numeric">
        <cfargument name="pageSize" default="5" type="numeric">
        <cfargument name="gridsortcolumn" default="firstName">
        <cfargument name="gridsortdirection" default="asc">
		<cfscript>
			var st		= structNew();
			var i		= 0;
			var qReturn	=	false;

			// create test data
			var qBase = queryNew("rowid,firstName,lastName,dob", "cf_sql_integer,cf_sql_varchar,cf_sql_varchar,cf_sql_date");
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 1);	querySetCell(qBase, "firstName", "Don");		querySetCell(qBase, "lastName", "Cameron");				querySetCell(qBase, "dob", createDate(1933,2,20));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 2);	querySetCell(qBase, "firstName", "Val"); 		querySetCell(qBase, "lastName", "Cameron");				querySetCell(qBase, "dob", createDate(1933,11,6));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 3);	querySetCell(qBase, "firstName", "Mark"); 		querySetCell(qBase, "lastName", "Cameron");				querySetCell(qBase, "dob", createDate(1959,9,1));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 4);	querySetCell(qBase, "firstName", "Fiona"); 		querySetCell(qBase, "lastName", "Cameron");				querySetCell(qBase, "dob", createDate(1961,7,12));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 5);	querySetCell(qBase, "firstName", "Adam"); 		querySetCell(qBase, "lastName", "Cameron");				querySetCell(qBase, "dob", createDate(1970,2,17));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 6);	querySetCell(qBase, "firstName", "Liz"); 		querySetCell(qBase, "lastName", "Burnside");			querySetCell(qBase, "dob", createDate(1951,5,26));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 7);	querySetCell(qBase, "firstName", "Stephanie"); 	querySetCell(qBase, "lastName", "Ryall");				querySetCell(qBase, "dob", createDate(1973,5,13));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 8);	querySetCell(qBase, "firstName", "Amy"); 		querySetCell(qBase, "lastName", "Clay");				querySetCell(qBase, "dob", createDate(1978,1,25));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 9);	querySetCell(qBase, "firstName", "Katie"); 		querySetCell(qBase, "lastName", "Ryall");				querySetCell(qBase, "dob", createDate(1979,4,23));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 10);	querySetCell(qBase, "firstName", "Fleur"); 		querySetCell(qBase, "lastName", "Cameron");				querySetCell(qBase, "dob", createDate(1990,10,5));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 11);	querySetCell(qBase, "firstName", "Tori"); 		querySetCell(qBase, "lastName", "Wilson-Ryall");		querySetCell(qBase, "dob", createDate(1992,6,21));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 12);	querySetCell(qBase, "firstName", "Leo"); 		querySetCell(qBase, "lastName", "Clay");				querySetCell(qBase, "dob", createDate(2005,10,12));
			queryAddRow(qBase);	querySetCell(qBase, "rowId", 13);	querySetCell(qBase, "firstName", "Jasper"); 	querySetCell(qBase, "lastName", "Clay");				querySetCell(qBase, "dob", createDate(2008,3,31));

			if (not len(arguments.page)) arguments.page = 1;
			if (not len(arguments.pageSize)) arguments.pageSize = 5;
		</cfscript>

		<!--- sort it --->
<!--- 		<cfdump var="#qBase#" label="qBase"> --->
		<cfif len(arguments.gridsortcolumn)>
			<cfquery name="qReturn" dbtype="query">
				select		*
				from		qBase
				order by	#arguments.gridsortcolumn#<cfif len(arguments.gridsortdirection)> #arguments.gridsortdirection#</cfif>
			</cfquery>
		<cfelse>
			<cfset qReturn = qBase>
		</cfif>
<!--- 		<cfdump var="#qReturn#" label="Ordered"> --->

		<!--- filter it --->
		<cfloop query="qReturn">
			<cfset querySetCell(qReturn, "rowId", currentRow, currentRow)>
			<cfset querySetCell(qReturn, "dob", dateFormat(qReturn.dob[currentRow], "dd mmm yyyy"), currentRow)>
		</cfloop>
 		<cfdump var="#qReturn#" label="ID updated">
		<cfquery name="qReturn" dbtype="query" maxrows="#arguments.pageSize#">
			select		*
			from		qReturn
			where		rowid between #((arguments.page - 1) * arguments.pageSize) + 1# and #(arguments.page + 1) * arguments.pageSize#
		</cfquery>
<!--- 		<cfdump var="#qReturn#" label="Filtered"> --->
		<cfscript>
			st.totalRowCount = qBase.recordCount;
			st.query = qReturn;
			return st;
		</cfscript>
	</cffunction>


</cfcomponent>