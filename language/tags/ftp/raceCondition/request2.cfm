<cfflush interval="16">
<cfftp
    action = "open"
    connection = "ftpConnection"
    server = "ftp.backend"
    username = "INVALID"
    password = "INVALID"
    stopOnError = true
    result = "openResult"
>
Connection established.<br>
<cfdump var="#openResult#" label="openResult">

Putting&hellip;<br>
<cfset srcFile = expandPath("../fixtures/testFile.txt")>
<cfftp
    connection="ftpConnection"
    action="putFile"
    localFile = "#srcFile#"
    remoteFile = "#createGuid()#.txt"
    result = "putResult"
>
Put complete.<br>
<cfdump var="#putResult#" label="putResult">

Closing&hellip;<br>
<cfftp action="close" connection="ftpConnection" result="closeResult">
Close complete.<br>
<cfdump var="#putResult#" label="closeResult">
