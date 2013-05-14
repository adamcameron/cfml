<cfcomponent> 
    <cfset this.dsn = "cfdocexamples"> 
    <cffunction name="getEmployees" access="remote" returnFormat="json" output="false"> 
        <cfargument name="empid" required="no" type="string" default="0"> 
        <cfquery name="qryEmp" datasource="#this.dsn#"> 
            select * from Employees  
            <cfif empid neq 0> 
            where Emp_ID = #empid# 
            </cfif> 
        </Cfquery> 
        <cfreturn qryEmp> 
    </cffunction> 
</cfcomponent>