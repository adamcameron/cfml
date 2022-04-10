<cfflush interval="16">
<cfscript>
    function helloTranslator(string helloWord){
        return closure(string name){
            return "#helloWord#, #name#";
        };
    }
</cfscript>
<cfset helloInEnglish    = helloTranslator("Hello")>
<cfset helloInMaori      = helloTranslator("Kia ora")>
<cfoutput>
    #helloInEnglish("Anna")#<br />   <!--- Hello, Anna --->
    #helloInMaori("Barry")#<br />    <!--- Kia ora, Barry --->
</cfoutput>

<cfscript>
    function makeItHeading(numeric size){
        return closure(string str){
            return "<h#size#>#str#</h#size#>";
        };
    }

    makeH1    = makeItHeading(1);
    makeH2    = makeItHeading(2);
</cfscript>
<cfoutput>
    #makeH1("Main Heading")#
    #makeH2("Sub-Heading")#
</cfoutput>

<cfscript>
    function throwAfterRetries(numeric retries, string exception){
        var st = {retries=retries, exception=exception};    // should not need to do this (see bug 2949723)
        return closure(){
            if (st.retries){
                return st.retries--;
            }else{
                throw(exception);
            }
        };
    }

    trackRetry = throwAfterRetries(5, "Process failed");
    
    while (true){
        // try a login process or something similar

        // and feedback that it failed...
        writeOutput("It failed.  You have another #trackRetry()# attempts<br />");
    }
    
</cfscript>
<cfoutput>
    #countFrom100()#<br />
    #countFrom100()#<br />
    #countFrom100()#<br />
    #countFrom100()#<br />
</cfoutput>