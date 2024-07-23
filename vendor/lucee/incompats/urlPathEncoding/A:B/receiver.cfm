<cfset response = [
    path_info = CGI.path_info,
    script_name = CGI.script_name
]>
<cfoutput>#serializeJson(response)#</cfoutput>
