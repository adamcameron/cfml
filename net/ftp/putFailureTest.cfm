<cfftp
    action = "open"
    connection = "ftpConnection"
    server = "ftp.backend"
    username = "ftpuser"
    password = "password1234"
    result = "connectionResult"
>
<cfdump var="#connectionResult#">

<cftry>
    <cfftp
        action = "putfile"
        connection = "ftpConnection"
        localfile = "#expandPath("./testfile.txt")#"
        remotefile = "/invalid/textfile.txt"
        result = "putResult"
        stoponerror = "false"
    >
    <cfdump var="#putResult#">
    <cffinally>
        <cfftp
            action = "close"
            connection = "ftpConnection"
            result = "closeResult"
        >
        <cfdump var="#closeResult#">
    </cffinally>
</cftry>
