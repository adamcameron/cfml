<cfset oJRun = CreateObject("java", "jrunx.kernel.JRun")>
<cfset oJRun.restart(oJRun.getServerName())>