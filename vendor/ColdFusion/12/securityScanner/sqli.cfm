<cfquery>
INSERT INTO someTable (
	uuid
)VALUES(
	'#createUuid()#'
)
</cfquery>

<cfquery name="uuids">
SELECT '#createUuid()#' AS uuid
FROM someTable
</cfquery>

<cfset queryExecute("
INSERT INTO someTable (
	uuid
)VALUES(
	'#createUuid()#'
)
")>
<cfset uuids = queryExecute("
SELECT '#createUuid()#' AS uuid
FROM someTable
")>