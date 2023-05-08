<cfoutput>
	<cfset f = 58 /100>
	58/100: #f#<br />
	fix(#f#*100): #fix(f*100)#%<br />
	createObject("java", "java.lang.Double").init(#f#): #createObject("java", "java.lang.Double").init(f)#%<br />
	<br />
	<cfset i = .58>
	int(numberFormat(#i#*100, "99.9")): #int(numberFormat(i*100, "99.9"))#<br />
</cfoutput>
