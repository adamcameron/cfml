<cfscript>
// requestLongerThanSessionTimeout.cfm
writeLog(file=this.name, text="top of #listLast(getCurrentTemplatePath(), '/\')# @ #getTickCount()-variables.requestStartTime#");
for (i=1; i <= 90; i++){
	sleep(1000);
	writeLog(file=this.name, text="(#i#) running #listLast(getCurrentTemplatePath(), '/\')# @ #getTickCount()-variables.requestStartTime#");
}
writeLog(file=this.name, text="bottom of #listLast(getCurrentTemplatePath(), '/\')# @ #getTickCount()-variables.requestStartTime#");
</cfscript>