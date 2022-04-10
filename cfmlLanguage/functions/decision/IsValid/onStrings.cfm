<cfscript>
aDateObject = createDate(2015,12,16);
notANumericDate = dateFormat(aDateObject, "d mmmm, yyyy");
aNumericDate = aDateObject+0;

writeDump(label="baseline", var=[
	aDateObject,
	aDateObject.getClass().getName(),
	notANumericDate,
	notANumericDate.getClass().getName(),
	aNumericDate,
	aNumericDate.getClass().getName()
]);

writeDump(label="test with notANumericDate", var={
	"isDate" = isDate(notANumericDate),
	"isValid" = isValid("date", notANumericDate),
	"isNumericDate" = isNumericDate(notANumericDate)
});

writeDump(label="test with aNumericDate", var={
	"isDate" = isDate(aNumericDate),
	"isValid" = isValid("date", aNumericDate),
	"isNumericDate" = isNumericDate(aNumericDate)
});

writeDump(label="test with aDateObject", var={
	"isDate" = isDate(aDateObject),
	"isValid" = isValid("date", aDateObject),
	"isNumericDate" = isNumericDate(aDateObject)
});

writeDump(label="parse them", var={
	"aDateObject" = parseDateTime(aDateObject),
	"notANumericDate" = parseDateTime(notANumericDate),
	"aNumericDate" = parseDateTime(aNumericDate)
});
</cfscript>