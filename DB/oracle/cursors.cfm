<cfquery name="q" datasource="demoshado">
SELECT v.value as numopencursors ,s.machine ,s.osuser,s.username
FROM V$SESSTAT v, V$SESSION s
WHERE v.statistic## = 3 and v.sid = s.sid
</cfquery>
<cfdump var="#q#">