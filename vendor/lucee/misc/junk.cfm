<cfdirectory
    name="listing"
    directory="#getDirectoryFromPath(getCurrentTemplatePath())#"
    action="list"
    mode="listnames"
    filter="*.cfm"
>

<cfdump var="#listing#">

<cfdirectory
    name="listing"
    directory="#getDirectoryFromPath(getCurrentTemplatePath())#"
    action="list"
    filter="*.cfm"
>

<cfdump var="#listing#">
