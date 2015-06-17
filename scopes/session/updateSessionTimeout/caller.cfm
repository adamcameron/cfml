<cfdump var="#this#" label="this @ #now()#">
<cfoutput>Session should expire @ : #timeFormat(now()+this.sessionTimeout, "HH:MM:SS")#</cfoutput>