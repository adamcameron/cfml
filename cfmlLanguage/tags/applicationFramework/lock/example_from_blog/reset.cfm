<cfapplication name="testLock" sessionmanagement="true">
<cfset structDelete(session, "iStart", false)>
<cffile action="delete" file="#getDirectoryFromPath(getCurrentTemplatePath())#/log.dat">
