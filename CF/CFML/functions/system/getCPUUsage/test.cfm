<cflog file="getCPUUsage" text="before">
<cfset x = getCPUUsage(1000)>
<cflog file="getCPUUsage" text="after">
<cfdump var="#variables#">