<cfset lDriverClasses ="
macromedia.jdbc.oracle.OracleDriver,
macromedia.jdbc.db2.DB2Driver,
macromedia.jdbc.informix.InformixDriver,
macromedia.jdbc.sequelink.SequeLinkDriver,
macromedia.jdbc.sqlserver.SQLServerDriver,
macromedia.jdbc.sybase.SybaseDriver
">
<!--- replace all spaces --->
<cfset lDriverClasses = replace(lDriverClasses," ","","ALL")>
<cfloop index="sDriverClass" list="#lDriverClasses#">
	<cfset oDriver = CreateObject("java", trim(sDriverClass))>
	<cfoutput>[#sDriverClass#]: [#oDriver.getMajorVersion()#.#oDriver.getMinorVersion()#]<br /></cfoutput>
</cfloop>