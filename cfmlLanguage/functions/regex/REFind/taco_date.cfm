<cfscript>
	date1	= "2-1-2004";	// and remember that's being treated as mm/dd/yyyy by this code...
	date2	= "";

	match = REFind("^(?x)	## match must be @ beginning of string, and (?x) allows me to add comments and make it a multiline regexp
			(\d{1,2})		## 1-2 chars which will be the month part
			(/|-)			## whichever slash we're using, and recall it for later.  If you use ?: here, it doesn't capture it for use two steps further down
			(\d{1,2})		## 1-2 chars which will be the day part 
			\2				## whichever slash we had earlier
			((\d{2}){0,1})	## a group of exactly two characters; but either zero or one occurences of that; so the (optional) first two positions of YYyy
			(\d{2})			## two digits (so in total it's possibly exactly two digits from above, and definitely another two digits here); so the minimum requirement for year: YY
			$				## anchored to the end of the string
			",date1, 1, true);

	if (arrayLen(match.pos) eq 7){
		dayPart		= mid(date1, match.pos[4], match.len[4]);
		monthPart	= mid(date1, match.pos[2], match.len[2]);
		yearPart	= "";
		if (match.pos[5]){
			yearPart = mid(date1, match.pos[5], match.len[5]);
		}
		yearPart = yearPart & mid(date1, match.pos[7], match.len[7]);
		separator = mid(date1, match.pos[3], match.len[3]);	// or you could just hard-code "/" here if you liked
		
		date2 = numberFormat(dayPart, "00") & separator & numberFormat(monthPart, "00") & separator & yearPart;
		// but it still might not be a date
	}else{
		writeOutput("That ain't a date");
	}
</cfscript>
<cfdump var="#match#">
<cfdump var="#date2#">



