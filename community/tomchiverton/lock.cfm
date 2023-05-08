<cfset sessionFlag='adminRunningLock'/>
<cflock name="#sessionFlag#" type="exclusive" timeout="1" throwOnTimeout="true">
<cfif structKeyExists(session,sessionFlag)>a
        already running. Not running again<br>
        Started at <cfoutput>#session[sessionFlag]#</cfoutput>
        <cfabort/>
<cfelse>b
        <cfset sleep(5000)/>
                <cfif structKeyExists(session,sessionFlag)>d
                        already running. Not running again !<br>
                        Started at <cfoutput>#session[sessionFlag]#</cfoutput>
                        <cfabort/>
                </cfif>e
                <cfset session[sessionFlag]=now()/>f
</cfif>
</cflock>