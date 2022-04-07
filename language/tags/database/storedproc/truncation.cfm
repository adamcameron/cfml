<cfstoredproc procedure="usp_myTestProc" datasource="scratch">
        <cfprocparam cfsqltype="cf_sql_varchar" type="out" variable="vars.myString">
</cfstoredproc>
 
<cfdump label="testProcReturn" var="#vars#">