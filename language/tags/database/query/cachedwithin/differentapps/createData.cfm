<!--- /differentapps/createData.cfm --->


<!---
DROP TABLE IF EXISTS `scratch`.`numbers`;
CREATE TABLE  `scratch`.`numbers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `english` varchar(45) NOT NULL,
  `maori` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
 --->

<cfquery datasource="scratch_mysql">
	TRUNCATE TABLE numbers
</cfquery>

<cfloop index="record" array="#[
	{english="one", maori="tahi"},
	{english="two", maori="two"},
	{english="three", maori="three"},
	{english="four", maori="four"}
]#">
	<cfquery datasource="scratch_mysql">
		INSERT INTO numbers (
			english, maori
		) values (
			<cfqueryparam value="#record.english#">,
			<cfqueryparam value="#record.maori#">
		)
	</cfquery>
</cfloop>

<cfquery name="numbers" datasource="scratch_mysql">
	SELECT	*
	FROM	numbers
</cfquery>
<cfdump var="#numbers#">
