<cfscript>
// requestLongerThanSessionTimeout.cfm
writeLog(file=this.name, text="top of #listLast(getCurrentTemplatePath(), '/\')# @ #getTickCount()-variables.requestStartTime#");
sleep(90*1000);
writeLog(file=this.name, text="bottom of #listLast(getCurrentTemplatePath(), '/\')# @ #getTickCount()-variables.requestStartTime#");
</cfscript>