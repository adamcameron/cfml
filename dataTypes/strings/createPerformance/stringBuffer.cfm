<cfscript>
// stringBuffer.cfm
startTime = getTickCount();
sb = createObject("java", "java.lang.StringBuffer").init(stringLength);
for (i=1; i <= stringLength; i++){
	sb.append("X");
}
s = sb.ToString();
endTime = getTickCount();
</cfscript>