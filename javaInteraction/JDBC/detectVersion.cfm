<!--- <cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")> --->
<cfset oSqlServerJdbc = CreateObject("java", "macromedia.jdbc.sqlserver.SQLServerDriver")>
<cfset oOracleJdbc = CreateObject("java", "macromedia.jdbc.oracle.OracleDriver")>

<cfoutput>
MS SQL Server<br />
Major: #oSqlServerJdbc.getMajorVersion()#<br />
Minor: #oSqlServerJdbc.getMinorVersion()#<br />
<hr />
Oracle<br />
Major: #oOracleJdbc.getMajorVersion()#<br />
Minor: #oOracleJdbc.getMinorVersion()#<br />
<hr />

<!---
<hr />
<pre>#oCv.viewObject(oSqlServerJdbc)#</pre>
<hr />
<pre>#oCv.viewObject(oOracleJdbc)#</pre>
<hr />
--->
</cfoutput>