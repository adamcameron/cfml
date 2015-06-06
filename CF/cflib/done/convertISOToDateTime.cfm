	<cffunction name="ConvertISOToDateTime" returntype="date">
		<cfargument name="ISODateString" required="yes" type="string" hint="Properly formed ISO-8601 dateTime String">
		<cfscript>
			// time formats have 2 ways of showing themselves: 1994-11-05T13:15:30Z UTC format OR 1994-11-05T08:15:30-05:00
			initialDate = parseDateTime(REReplace(ISODateString, "(\d{4})-?(\d{2})-?(\d{2})T([\d:]+).*", "\1-\2-\3 \4"));
			// If not in UTC format then we need to
			if (right(arguments.ISODateString, 1) neq "Z") {
				timeModifier = "";
				//Now we determine if we are adding or deleting the the time modifier.
				if (ISODateString contains '+' and listlen(listrest(ISODateString,"+"),":") eq 2){
					timeModifier = listrest(ISODateString,"+");
					multiplier = 1; // Add
				} else if (listlen(listlast(ISODateString,"-"),":") eq 2) {
					timeModifier = listlast(ISODateString,"-");
					multiplier = -1; // Delete
				}
				if (len(timeModifier)){
					initialDate = dateAdd("h", val(listfirst(timeModifier,":"))*multiplier,initialDate);
					initialDate =  dateAdd("m", val(listlast(timeModifier,":"))*multiplier,initialDate);
				}
			}
			return initialDate;
		</cfscript>
	</cffunction>
	
	<cfscript>
/**
 * Converts text string of ISO Date to datetime object; useful for parsing RSS and RDF.
 * 
 * @param str 	 ISO datetime string to parse. (Required)
 * @return Returns a date. 
 * @author James Edmunds (&#106;&#97;&#109;&#101;&#115;&#101;&#100;&#109;&#117;&#110;&#100;&#115;&#64;&#106;&#97;&#109;&#101;&#115;&#101;&#100;&#109;&#117;&#110;&#100;&#115;&#46;&#99;&#111;&#109;) 
 * @version 1, September 21, 2004 
 */
function ISODateToTS(str) {
	// time formats have 2 ways of showing themselves: 1994-11-05T13:15:30Z UTC format OR 1994-11-05T08:15:30-05:00
	var initialDate		= parseDateTime(REReplace(arguments.str, "(\d{4})-?(\d{2})-?(\d{2})T([\d:]+).*", "\1-\2-\3 \4"));
	var timeModifier	= "";
	var multiplier		= 0;

	// If not in UTC format then we need to offset the time
	if (right(arguments.str, 1) neq "Z") {
		//Now we determine if we are adding or deleting the the time modifier.
		if (arguments.str contains '+' and listlen(listrest(arguments.str, "+"), ":") eq 2){
			timeModifier = listRest(arguments.str,"+");
			multiplier = 1; // Add
		} else if (listlen(listLast(arguments.str,"-"),":") eq 2) {
			timeModifier = listLast(arguments.str,"-");
			multiplier = -1; // Delete
		}
		if (len(timeModifier)){
			initialDate = dateAdd("h", val(listFirst(timeModifier, ":"))*multiplier, initialDate);
			initialDate =  dateAdd("n", val(listLast(timeModifier, ":"))*multiplier, initialDate);
		}
	}
	return initialDate;
}
</cfscript>




<cfoutput>
<cfset s = "1994-11-05T08:15:30Z">
s: #s#<br />
ISODateToTS(): #ISODateToTS(s)#
<hr />
<cfset s = "1994-11-05T08:15:30+05:00">
s: #s#<br />
ISODateToTS(): #ISODateToTS(s)#
<hr />
<cfset s = "1994-11-05T08:30:30-08:30">
s: #s#<br />
ISODateToTS(): #ISODateToTS(s)#
<hr />
<cfset s = "1994-11-05T08:30:30-08:00">
s: #s#<br />
ISODateToTS(): #ISODateToTS(s)#
<hr />
</cfoutput>