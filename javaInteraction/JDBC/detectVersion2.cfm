<cfset drivernames ="
macromedia.jdbc.oracle.OracleDriver,
macromedia.jdbc.db2.DB2Driver,
macromedia.jdbc.informix.InformixDriver,
macromedia.jdbc.sequelink.SequeLinkDriver,
macromedia.jdbc.sqlserver.SQLServerDriver,
macromedia.jdbc.sybase.SybaseDriver
">
<!--- replace all spaces --->
<cfset drivernames = replace(drivernames," ","","ALL")>
<cfloop index="drivername" list="#drivernames#">
<cfobject action="CREATE" class="#trim(drivername)#" name="driver" type="JAVA">
<cfset args= ArrayNew(1)>
<cfset driver.main(args)>
</cfloop>