<cfscript>
// parseDateTime.cfm
isoDates = [
	"1997",
	"1997-07",
	"1997-07-16",
	"1997-07-16T19:20+01:00",
	"1997-07-16T19:20:30+01:00",
	"1997-07-16T19:20:30.45+01:00"
];
for (isoDate in isoDates){
	try {
		d = parseDateTime(isoDate);
		writeOutput("isoDate: #isoDate# => #dateTimeFormat(d, 'yyyy-mm-dd HH:nn:ss.lll')#<br>");
	} catch (any e){
		writeOutput("#e.type#: #e.message# #e.detail#<br>");
	}
}
</cfscript>