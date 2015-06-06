<cfset iMinUpTime = createObject("java", "java.lang.management.ManagementFactory").getRuntimeMXBean().getUptime() \ 60000>
<cfoutput>Uptime: #int(iMinUpTime/60)#h#numberFormat(iMinUpTime mod 60, "00")#m</cfoutput>
