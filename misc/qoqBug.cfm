<cfscript>
record1 = queryNew(
	"type,subject,status",
	"varchar,varchar,varchar",
	[["RECORD1_TYPE","RECORD1_SUBJECT","RECORD1_STATUS"]]
)
record2 = queryNew(
	"subtype",
	"varchar",
	[["RECORD2_TEMPLATE"]]
)
record3 = queryNew(
	"subtype",
	"varchar",
	[["RECORD3_TEMPLATE"]]
)
record4 = queryNew(
	"id",
	"int",
	[[1]]
)

writeDump(var=[record1, record2, record3, record4], metainfo=false)
</cfscript>

<cfquery name="records" dbtype="query">
		SELECT 	'one' AS type,
				type AS subtype,
				subject,
				status
		FROM 	record1
		UNION
		SELECT 	'two' AS type,
				subtype,
				subtype AS subject,
				NULL
		FROM 	record2
		UNION
		SELECT 	'three' AS type,
				subtype,
				subtype AS subject,
				NULL
		FROM 	record3
		UNION
		SELECT 	'four' AS type,
				NULL AS subtype,
				NULL AS subject,
				NULL
		FROM	record4
</cfquery>
<cfdump var="#records#" metainfo="false">
