<cfscript>
    ```<!---
        make
        hyper text
        transfer
        protocol 
        request
    --->```
    
    http
        url     = "https://postman-echo.com/get"
        result  = "response"
        {
        ```<!---
            now
            use 
            tag islands
            F
            T
            W
        --->```
        ```
        <cfhttpparam
                        type    = "header"
                        name    = "Accepts"
                        value   = "application/json"
        >
        
        <cfhttpparam
                        type    = "url"
                        name    = "message"
                        value   = "G'day world!"
        >
        ```
    }

    ```<cfdump var="#response#">```
</cfscript>
