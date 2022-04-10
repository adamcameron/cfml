<cfflush interval="50">
<div style="font-family:verdana; font-size: x-small;">
<cfscript>
	dStart = createDate(2007,1,1);

	for (i=1; i le 365; i=i+1){
		dThis = dateAdd("d", i, dStart);
		sDate = dateFormat(dThis, "yyyy-mm-dd");
		dThat = parseDateTime(sDate);
		if (dateCompare(dThis, dThat)){
			sColour = "red";
		}else{
			sColour = "green";
		}
		writeOutput('<span style="color:#sColour#">[#dThis#][#dThat#]</span><br />');
	
	}
</cfscript>
</div>