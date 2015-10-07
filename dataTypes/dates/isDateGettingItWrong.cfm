<cfscript>
notDate = "16.51p";

isValidDate = isValid("date", notDate);
isDate_ = isDate(notDate);
dateFormat_ = dateFormat(notDate);
dateAdd_ = dateAdd("d", notDate, 0);
dateDiff_ = dateDiff("s", notDate, notDate);

writeDump({
isValidDate=isValidDate,
isDate_=isDate_,
dateFormat_=dateFormat_,
dateAdd_=dateAdd_,
dateDiff_=dateDiff_
});
</cfscript>