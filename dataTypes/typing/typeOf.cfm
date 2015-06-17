<cfoutput>
	<cfset i = int(0)>
	int(0)<br />
	#i.getClass()#<br />
	Cast to String: #i#<br /><br />

	<cfset i = 42>
	42<br />
	#i.getClass()#<br />
	Cast to String: #i#<br /><br />

	<cfset s = "foo">
	"foo"<br />
	#s.getClass()#<br />
	Cast to String: #s#<br /><br />

	<cfset ts = now()>
	now()<br />
	#ts.getClass()#<br />
	Cast to String: #ts#<br /><br />

	<cfset d = createOdbcDate(now())>
	createOdbcDate(now())<br />
	#d.getClass()#<br />
	Cast to String: #d#<br /><br />

	<cfset q = querynew("col")>
	<cfset queryAddRow(q)>
	<cfset querySetCell(q, "col", 1)>
	q<br />
	#q.getClass()#<br />
	Won't automatically cast to a string<br /><br />
	
	q["col"]<br />
	#q["col"].getClass()#<br />
	Won't automatically cast to a string<br /><br />
	
	q.col<br />
	#q.col.getClass()#<br />
	Cast to String: #q.col#<br /><br />
	
	q.col[1]<br />
	#q.col[1].getClass()#<br />
	Cast to String: #q.col[1]#<br /><br />

	<cfset x = xmlNew()>
	<cfset x.xmlRoot = xmlElemNew(x, "foo")>
	xmlNew()<br />
	#x.getClass()#<br />
	Cast to String: #x# (need to view-source to see it)<br /><br />
	
	xmlRoot<br />
	#x.xmlRoot.getClass()#<br />
	Cast to String: #x.xmlRoot# (need to view-source to see it)<br /><br />
	
</cfoutput>