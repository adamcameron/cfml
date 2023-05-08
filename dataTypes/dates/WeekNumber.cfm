<cfscript>
	for (i=1; i lt 31; i=i+1){
		d = dateAdd("d", i, createDate(2004, 12, 31));
		writeOutput("#dateFormat(d, 'yyyy-mm-dd ddd')#: #datePart('ww', d)#<br />");
	}
	
</cfscript>