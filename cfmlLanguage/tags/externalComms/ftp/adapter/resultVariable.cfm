<cffunction name="createConnection" localMode="classic">
    <cfftp
        action = "open"
        connection = "ftpConnection"
        server = "ftp.backend"
        username = "#server.system.environment.FTP_USER#"
        password = "#server.system.environment.FTP_USER_PASSWORD#"
        stopOnError = true
    >
    <cfdump var="#local#" label="local in function">
</cffunction>

<cfdump var="#variables#" label="variables before call">
<cfset createConnection()>
<cfdump var="#variables#" label="variables after call">
