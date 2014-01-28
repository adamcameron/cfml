<cfsetting showdebugoutput="false">
<cfset msg = "Hello world">
<cfoutput>#msg# @ #dateFormat(now(), "yyyy-mm-dd")# #timeFormat(now(), "HH:MM:SS")#</cfoutput>