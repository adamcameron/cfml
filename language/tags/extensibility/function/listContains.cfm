<cfscript>
days = "Tuesday,yesterday,day,another day"
containedAt =  listContains(days, "day")
foundAt = listFind(days, "day")

dump({
	"Using listContains()"	= containedAt,
	"Using listFind()"		= foundAt
})
</cfscript>