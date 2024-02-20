<cfscript>
	q = queryExecute("SELECT * FROM t1")
	writeDump([
		q = q,
		d = q.d[1],
		s = q.d[1].toString(),
		s2 = toString(q.d[1]),
		class = q.d[1].getClass().getName(),
		plainString = q.d[1].toPlainString(),
		numberFormat = numberFormat(q.d[1], "0.000000000000")
	])
</cfscript>
