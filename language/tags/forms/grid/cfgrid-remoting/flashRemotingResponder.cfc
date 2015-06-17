<cfcomponent name="flashRemotingResponder" access="public" description="Responds to Flash remoting requests">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="getDate" output="false" description="Returns the current time" 
					access="remote" returntype="string">
	<cfargument name="mask" required="false" type="string" default=""/>

		<!--- get the current time --->
		<cfset var time = now() />
				
		<cfif len(arguments.mask)>
			<!--- format the date according to mask --->
			<cfset time = dateformat(time,arguments.mask) />
		</cfif>
		
		<cfreturn time /> 
</cffunction>


<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="getMembers" output="false" description="Returns a query with names (id,name,age,gender)" 
					access="remote" returntype="query">

	<!--- replace this with a query --->
	<cfscript>
	var memberList = queryNew("id,name,age,gender");
	queryAddRow(memberList);
		querySetCell(memberList,'id','1');
		querySetCell(memberList,'name','Adams');
		querySetCell(memberList,'age','23');
		querySetCell(memberList,'gender','male');
	queryAddRow(memberList);
		querySetCell(memberList,'id','6');
		querySetCell(memberList,'name','Alan');
		querySetCell(memberList,'age','30');
		querySetCell(memberList,'gender','male');
	queryAddRow(memberList);
		querySetCell(memberList,'id','10');
		querySetCell(memberList,'name','Alicia');
		querySetCell(memberList,'age','23');
		querySetCell(memberList,'gender','female');
	queryAddRow(memberList);
		querySetCell(memberList,'id','11');
		querySetCell(memberList,'name','Alfred');
		querySetCell(memberList,'age','26');
		querySetCell(memberList,'gender','male');
	queryAddRow(memberList);
		querySetCell(memberList,'id','2');
		querySetCell(memberList,'name','Arnold');
		querySetCell(memberList,'age','50');
		querySetCell(memberList,'gender','male');
	queryAddRow(memberList);
		querySetCell(memberList,'id','5');
		querySetCell(memberList,'name','Jim');
		querySetCell(memberList,'age','23');
		querySetCell(memberList,'gender','male');
	queryAddRow(memberList);
		querySetCell(memberList,'id','17');
		querySetCell(memberList,'name','Frank');
		querySetCell(memberList,'age','40');
		querySetCell(memberList,'gender','male');
			querySetCell(memberList,'id','20');
		querySetCell(memberList,'name','Issac');
		querySetCell(memberList,'age','38');
		querySetCell(memberList,'gender','male');
	queryAddRow(memberList);
		querySetCell(memberList,'id','21');
		querySetCell(memberList,'name','Jackie');
		querySetCell(memberList,'age','23');
		querySetCell(memberList,'gender','female');
	queryAddRow(memberList);
		querySetCell(memberList,'id','22');
		querySetCell(memberList,'name','Karen');
		querySetCell(memberList,'age','42');
		querySetCell(memberList,'gender','female');
	queryAddRow(memberList);
		querySetCell(memberList,'id','23');
		querySetCell(memberList,'name','Larry');
		querySetCell(memberList,'age','50');
		querySetCell(memberList,'gender','male');
</cfscript>
		<cfreturn memberList /> 
</cffunction>

</cfcomponent>