<cffunction name="returnClosure" returntype="closure">
    <cfscript>
        return closure(){
            return "I'm a closure<br />";
        };
    </cfscript>
</cffunction>

<cfscript>
    /**
    * @returntype string
    */
    function returnClosure2(){
        return closure(){
            return "I'm a closure too<br />";
        };
    }
    
    string function returnString(){
        return "But I'm a string<br />";
    }
    
    closure function returnSyntaxError(){    // ;-)
        return closure(){
            return "I'm a closure too<br />";
        };
    }
</cfscript>

<cfscript>
    c1 = returnClosure();
    writeOutput(c1());
    
    c2 = returnClosure2();
    writeOutput(c2());
    
    s1 = returnString();
    writeOutput(s1);
</cfscript>